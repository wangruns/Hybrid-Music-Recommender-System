package top.wangruns.trackstacking.algorithm;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.PlayRecord;
import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.utils.Static;

public class Hybrid {

	/**
	 * 开启混合模式，将基于最近邻用户的协同过滤的结果和基于异构文本网络的结果进行混合
	 * @param songList
	 * 带有歌词的歌曲信息
	 * @param user2songRecMatrix
	 * 基于最近邻用户的协同过滤的结果矩阵|userId,recommended song Id[ ]|
	 * @param collectionList
	 * 用户收藏列表（优先从收藏列表中寻找相似度高的前N_BYRID个歌曲，如果收藏列表数量中不足，则从播放列表补充；
	 * 如果数量超过，则随机选择N_HYBRID个歌曲）
	 * @param playList
	 * 用户播放列表
	 * @return 
	 */
	public static Map<Integer, Integer[]> open(List<Song> songList, final Map<Integer, Integer[]> user2songRecMatrix,
			final List<Collection> collectionList, final List<PlayRecord> playList, ServletContext servletContext) {
		//用户-歌曲 混合推荐列表
		final Map<Integer,Integer[]> user2songRecMatrixHybrid=new HashMap<Integer, Integer[]>();
		//这里不支持中文歌词
		final List<Song> engSongList=new ArrayList<Song>();
		filterChinese(servletContext,engSongList,songList);
		for(Song s:engSongList) {
			System.out.println(s.getSongName());
		}
		System.out.println("------------filterChinese完成-------------");
		//获取单词集合
		StringBuilder wordSb=new StringBuilder();
		Set<String> wordSet=getWordSet(servletContext,engSongList,wordSb);
		System.out.println("------------获取单词集合完成-------------");
		//构建word 2 word network矩阵，数量表示节点的权重(单词合作的次数)
		Map<String,int []> w2wNetwork=W2WNetwork.constructW2WN(wordSet,wordSb);
		System.out.println("------------w2wNetwork网络构建完成-------------");
		//构建word 2 document network矩阵，数量表示节点的权重(单词在文档中出现的次数)
		Map<String,int []> w2dNetwork=W2DNetwork.constructW2DN(wordSet,engSongList,servletContext);
		System.out.println("------------w2dNetwork网络构建完成-------------");
		//采样个数
		int iter=10;
		//向量的维度
		int d=5;
		//学习率
		float alpha=0.01f;
		final Map<Integer,float[]> lyricEmbedding=Training.train(engSongList,w2wNetwork,w2dNetwork,iter,d,alpha,wordSet);
		
		System.out.println("---------lyricEmbedding done----------");
		lyricEmbedding.forEach(new BiConsumer<Integer, float[]>() {
			public void accept(Integer id, float[] e) {
				String str=" ";
				for(int i=0;i<e.length;i++) {
					str+=e[i]+" ";
				}
				System.out.println("songId:"+id+", e:"+e.toString()+", "+str);
			}
		});
		
		//对于每一个用户，获取其收藏/播放记录中的带嵌入信息的样本歌曲
		final Map<Integer,Set<Integer>> user2EmbedSample=new HashMap<Integer, Set<Integer>>();
		user2songRecMatrix.forEach(new BiConsumer<Integer,Integer[]>(){

			public void accept(Integer userId, Integer[] recommendedSongIds) {
				//初始化用来寻找相似歌曲的样本歌曲集合
				final Set<Integer> originalIdSet=new HashSet<Integer>();
				//获取当前用户收藏的歌曲Id信息
				Set<Integer> collectedSongIdSet=getUserRecordIdSet(userId,collectionList,lyricEmbedding.keySet());
				
				if(collectedSongIdSet.size()>=Static.N_HYBRID) {
					//如果收藏列表里面的歌曲大于需要混合的歌曲数目，则随便选择N_HYBRID个进行查找
					collectedSongIdSet.forEach(new Consumer<Integer>() {
						int cnt=0;
						public void accept(Integer id) {
							if(cnt++<Static.N_HYBRID) {
								originalIdSet.add(id);
							}
						}
					});
				}else {
					//收藏列表里面的歌曲不够要混合的数目（一个混合需要用一首，若要5混合，则需要有5首样本歌曲），用播放列表的来凑
					int deltaN=Static.N_HYBRID-collectedSongIdSet.size();
					//获取当前用户播放的歌曲Id信息
					Set<Integer> playedSongIdSet=getUserRecordIdSet(userId,playList,lyricEmbedding.keySet());
					if(deltaN<=playedSongIdSet.size()) {
						//播放记录加上就够了
						originalIdSet.addAll(collectedSongIdSet);
						for(Integer id:playedSongIdSet) {
							if(deltaN-->0) {
								//加上播放记录里面的具有嵌入信息的歌曲Id
								originalIdSet.add(id);
							}else {
								break;
							}
						}
					}else {
						//播放记录加上也还是不够，则随机了
						originalIdSet.addAll(collectedSongIdSet);
						originalIdSet.addAll(playedSongIdSet);
						deltaN=Static.N_HYBRID-collectedSongIdSet.size()-playedSongIdSet.size();
						Set<Integer> embeddingSet=lyricEmbedding.keySet();
						for(Integer i:embeddingSet) {
							if(!originalIdSet.contains(i)) {
								originalIdSet.add(i);
								deltaN--;
							}
							if(deltaN<=0) {
								break;
							}
						}
					}
					
				}
				
				user2EmbedSample.put(userId, originalIdSet);
			}

			
		});
		//获取歌曲Id信息
		final List<Integer> embedSongIdList=new ArrayList<Integer>();
		lyricEmbedding.keySet().forEach(new Consumer<Integer>() {
			public void accept(Integer songId) {
				embedSongIdList.add(songId);
			}
		});
		//获取最相似的歌曲信息矩阵
		final Map<Integer,Integer[]> itemKNNMatrix=UserKNN.getKNN(embedSongIdList,lyricEmbedding,Static.N_HYBRID);
		//对于当前用户的每个样本歌曲，寻找其嵌入相似度最高的歌曲作为推荐歌曲
		/**
		 * 这里只为样本集originalIdSet中的每个歌曲寻找其最相似的歌曲，并且
		 * 以一定的概率P寻找当前用户没有听过的歌曲（解决新口味问题）：
		 * 比如当前用户的收藏列表中一直都是那么几首歌曲，而且几乎不变动，这样的话，
		 * 根据嵌入来计算相似度得到的推荐歌曲就可能永远都是那么几首歌曲，会严重的失去新颖性，很难为用户提供新口味
		 * 对此，设定一个概率因子P，对于没有被当前用户收藏的歌曲中，以P的概率会推荐该用户没有听过的歌曲
		 */
		final float P=0.5f;
		final Random random=new Random();
		//对于每个用户
		user2songRecMatrix.forEach(new BiConsumer<Integer,Integer[]>(){
			public void accept(Integer userId, Integer[] recedSongIds) {
				//获取当前用户的样本歌曲
				Set<Integer> embedSampleSet=user2EmbedSample.get(userId);
				int originalIdSetSize=embedSampleSet.size();
				Integer recIds[]=new Integer[originalIdSetSize]; 
				//获取当前用户之前协同过滤的结果，减少重复推荐
				Integer[] collaborativeFilterRecIds=user2songRecMatrix.get(userId);
				//对于每首嵌入样本歌曲
				int index=0;
				//当前用户已经听过的歌曲集合
				Set<Integer> listenedSongIdSet=getUserRecordIdSet(userId,playList,lyricEmbedding.keySet());
				for(Integer songId:embedSampleSet) {
					//获取该嵌入歌曲最相似的歌曲
					Integer[] similarSongIds=itemKNNMatrix.get(songId);
					for(Integer similarSongId:similarSongIds) {
						//初始推荐嵌入相似的歌曲
						recIds[index]=similarSongId;
						//当前歌曲被听过的时候，并且没有出现在协同过滤的推荐结果中，则会以一定的概率继续向下找，也会以一定概率停止
						if(random.nextFloat()>P && listenedSongIdSet.contains(similarSongId) &&
								!isInArray(similarSongId,collaborativeFilterRecIds) ) {
							break;
						}
						
					}
					index++;
				}
				
				user2songRecMatrixHybrid.put(userId, recIds);
			}
		});
		
		//返回混合结果
		return user2songRecMatrixHybrid;
		
	}

	/**
	 * 判定一个元素是否在数组中
	 * @param e
	 * @param array
	 * @return
	 */
	private  static <T>boolean isInArray(T e, T[] array) {
		for(T t:array) {
			if(e.equals(t)) {
				return true;
			}
		}
		return false;
	}

	private static Set<String> getWordSet(final ServletContext servletContext, List<Song> engSongList, final StringBuilder wordSb) {
		final Set<String> wordSet= new HashSet<String>();
		engSongList.forEach(new Consumer<Song>() {

			public void accept(Song song) {
				String realLyricAddress=servletContext.getRealPath(song.getLyricAddress());
				try {
					BufferedReader in=new BufferedReader(new FileReader(new File(realLyricAddress)));
					try{
			            String s;
			            while((s=in.readLine())!=null){
			            	//这里简单的根据空格划分
			            	if(s.trim().length()!=0) {
			            		//去掉时间戳[00:04.50]
			            		s=s.substring(s.lastIndexOf("]")+1);
			            		String strArray[]=s.split(" ");
			            		for(String str:strArray) {
			            			if(str.length()!=0) {
			            				wordSb.append(str);
				            			if(wordSet.isEmpty() || !wordSet.contains(str)) {
				            				wordSet.add(str);
				            			}
			            			}
			            		}
			            	}
			            }
			        }finally{
			            in.close();
			        }
					
				}catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		});
		return wordSet;
	}

	private static void filterChinese(final ServletContext servletContext,List<Song> engSongList, List<Song> songList) {
		int len=songList.size();
		for(int i=0;i<len;i++) {
			Song song=songList.get(i);
			if(isContainChinese(song.getSongName())) {
				continue;
			}
			if(isLyricContainChinese(servletContext.getRealPath(song.getLyricAddress()))) {
				continue;
			}
			engSongList.add(song);
		}
	}

	private static boolean isLyricContainChinese(String realLyricAddress) {
		try{
			BufferedReader in=new BufferedReader(new FileReader(new File(realLyricAddress)));
			try{
	            String s;
	            while((s=in.readLine())!=null){
	            	if(isContainChinese(s)) {
	            		System.err.println(s);
	            		return true;
	            	}
	            }
	        }finally{
	            in.close();
	        }
		}catch(IOException e){
			return true;
		}
		
		return false;
	}

	private static boolean isContainChinese(String str) {
		Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
		Matcher m = p.matcher(str);
        if (m.find()) {
            return true;
        }
		return false;
	}
	
	/**
	 * 获取当前用户操作过的歌曲Id集合
	 * 收藏/播放
	 * @param userID
	 * @param list
	 * @param embeddingIdSet
	 * @return
	 */
	private static <T> Set<Integer> getUserRecordIdSet(final Integer userID, List<T> list,final Set<Integer> embeddingIdSet) {
		final Set<Integer> set=new HashSet<Integer>();
		list.forEach(new Consumer<T>() {

			public void accept(T t) {
				try {
					Field userIdField=t.getClass().getDeclaredField("userId");
					userIdField.setAccessible(true);
					int userId=userIdField.getInt(t);
					if(userId==userID) {
						Field songIdField=t.getClass().getDeclaredField("songId");
						songIdField.setAccessible(true);
						int songId=songIdField.getInt(t);
						//必须是嵌入列表中存在的歌曲才能混合
						if((set.isEmpty() || !set.contains(songId)) && (embeddingIdSet.contains(songId)) ) {
							set.add(songId);
						}
					}
				} catch (NoSuchFieldException e) {
					e.printStackTrace();
				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
			
		});
		return set;
	}
	
	
}
