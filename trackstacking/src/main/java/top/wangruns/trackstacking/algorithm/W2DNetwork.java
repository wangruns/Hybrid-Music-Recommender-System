package top.wangruns.trackstacking.algorithm;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import top.wangruns.trackstacking.model.Song;

public class W2DNetwork {

	/**
	 * 获取w2dNetwork矩阵中横轴对应下标的文档节点
	 * 这里用歌曲Id表示文档节点
	 * @param index
	 * @param engSongList
	 * @return
	 * 文档节点（歌曲Id）
	 */
	public static int getW2DNode(int index, List<Song> songList) {
		return songList.get(index).getSongId();
	}

	public static Map<String, int[]> constructW2DN(Set<String> wordSet, List<Song> engSongList,
			ServletContext servletContext) {
		Map<String,int []> w2dNetwork=new HashMap<String, int[]>();
		Iterator<String> iterator=wordSet.iterator();
		while(iterator.hasNext()) {
			//当前单词节点
			String curWord=iterator.next();
			//邻接文档节点权重数组,0表示节点没有连接
			int weightArray[]=new int[engSongList.size()];
			int arrayIndex=0;
			int curWordLen=curWord.length();
			for(Song song:engSongList) {
				//计算当前单词在每个文档中出现的次数
				int cnt=0;
				/**
				 * 获取当前文档的内容
				 * 这里采用一个文档一个文档的重复读取
				 * 虽然增加了IO的负担，避免文档数量过大，一次性读入，内存开销太大
				 */
				StringBuilder documentSb=readContentSb(servletContext.getRealPath(song.getLyricAddress()));
				int indexOfCurWord=0;
				while(true) {
				    indexOfCurWord=documentSb.indexOf(curWord,indexOfCurWord);
				    //找不到了
				    if(indexOfCurWord==-1) {
				    	break;
				    }
				    cnt++;
					indexOfCurWord+=curWordLen;
				}
				weightArray[arrayIndex++]=cnt;
			}
			w2dNetwork.put(curWord, weightArray);
		}
		
		return w2dNetwork;
	}

	private static StringBuilder readContentSb(String realPath) {
		StringBuilder wordSb=new StringBuilder();
		try {
			BufferedReader in=new BufferedReader(new FileReader(new File(realPath)));
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
		return wordSb;
	}

}
