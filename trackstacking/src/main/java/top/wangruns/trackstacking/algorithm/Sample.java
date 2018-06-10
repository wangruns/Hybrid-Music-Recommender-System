package top.wangruns.trackstacking.algorithm;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;
import java.util.function.Consumer;

import top.wangruns.trackstacking.model.Song;

public class Sample {
	//权重的累计和
	private static int weightSumW2W;
	private static int weightSumW2D;
	
	/**
	 * 根据映射表进行概率采样
	 * @param weight2EdgeTableW2W
	 * @return
	 * 边（word 2 word）
	 */
	public static Edge<String, String> simpleProbabilitySamplingW2W(Map<Integer, Edge<String, String>> weight2EdgeTableW2W) {
		Edge<String, String> edge=null;
		Random random = new Random(47);
		int seed = random.nextInt(weightSumW2W);
		//判定seed落在的区间
		Iterator<Integer> iterator=weight2EdgeTableW2W.keySet().iterator();
		int prevousWeight=0;
		while(iterator.hasNext()) {
			int curWeight=iterator.next();
			//种子大于前一个累计和，小于当前累计和，表明种子就落在当前区间
			if(seed>=prevousWeight && seed<curWeight) {
				edge=weight2EdgeTableW2W.get(curWeight);
				break;
			}
			prevousWeight=curWeight;
		}
		return edge;
	}


	/**
	 * 获取	累计权重 to 边 的映射表. 
	 * 这里简单地根据权重来采样，即权重高的边被采集到的可能性更大
	 * 如 Edge_1:1,Edge_2:2,Edge_3:3,Edge_4:4,那么
	 * 所有权重的长度和为10，即
	 * 0-1为Edge_1
	 * 1-3为Edge_2
	 * 3-6为Edge_3
	 * 6-10为Edge_4
	 * 现在随机产生一个0-10之间的数字(色子)，如果落在区间1-3内，则采用的边为Edge_2.
	 * 此方法并不是最佳方法，这里只是简单的采用这种方式
	 * @param w2wNetwork
	 * 歌词到歌词网络
	 * @param wordSet
	 * 歌词节点集合
	 * @param bipartiteSetA 
	 * 双边网络A集合
	 * @return
	 */
	public static Map<Integer, Edge<String, String>> getWeight2EdgeTableW2W(final Map<String, int[]> w2wNetwork,
			final Set<String> wordSet, Set<String> bipartiteSetA) {
		//整理权重表key-累计的权重和
		final Map<Integer,Edge<String,String>> weight2EdgeTableW2W=new TreeMap<Integer, Edge<String, String>>();
		bipartiteSetA.forEach(new Consumer<String>() {

			//对于从双边网络A发出的每一条边
			public void accept(String node_i) {
				//获取邻接关系数组
				int relatedArray[]=w2wNetwork.get(node_i);
				for(int j=0;j<relatedArray.length;j++) {
					//对于和当前节点有连边的节点
					if(relatedArray[j]>0) {
						String node_j=W2WNetwork.getW2WNode(j,wordSet);
						//创建边
						Edge<String,String> edge=new Edge<String,String>(node_i,node_j,relatedArray[j]);
						weightSumW2W+=relatedArray[j];
						weight2EdgeTableW2W.put(weightSumW2W, edge);
					}
				}
			}
			
		});
		
		return weight2EdgeTableW2W;
	}

	/**
	 * 获取	累计权重 to 边 的映射表. 
	 * @param w2dNetwork
	 * 歌词文档网络
	 * @param engSongList
	 * 文档集合(歌曲信息列表中的歌词信息，这里可以用歌曲Id来表示)
	 * @return
	 */
	public static Map<Integer, Edge<String, Integer>> getWeight2EdgeTableW2D(final Map<String, int[]> w2dNetwork,
			final List<Song> engSongList) {
		Set<String> bipartiteSetA=w2dNetwork.keySet();
		//整理权重表key-累计的权重和
		final Map<Integer,Edge<String,Integer>> weight2EdgeTableW2D=new TreeMap<Integer, Edge<String, Integer>>();
		bipartiteSetA.forEach(new Consumer<String>() {

			//对于从双边网络A发出的每一条边
			public void accept(String node_i) {
				//获取邻接关系数组
				int relatedArray[]=w2dNetwork.get(node_i);
				for(int j=0;j<relatedArray.length;j++) {
					//对于和当前节点有连边的节点
					if(relatedArray[j]>0) {
						int node_j=W2DNetwork.getW2DNode(j,engSongList);
						//创建边
						Edge<String,Integer> edge=new Edge<String,Integer>(node_i,node_j,relatedArray[j]);
						weightSumW2D+=relatedArray[j];
						weight2EdgeTableW2D.put(weightSumW2D, edge);
					}
				}
			}
			
		});
		
		return weight2EdgeTableW2D;
	}

	
	/**
	 * 根据映射表进行概率采样
	 * @param weight2EdgeTableW2D
	 * @return
	 * 边（word 2 document）
	 */
	public static Edge<String, Integer> simpleProbabilitySamplingW2D(
			Map<Integer, Edge<String, Integer>> weight2EdgeTableW2D) {
		Edge<String, Integer> edge=null;
		Random random = new Random(47);
		int seed = random.nextInt(weightSumW2D);
		//判定seed落在的区间
		Iterator<Integer> iterator=weight2EdgeTableW2D.keySet().iterator();
		int prevousWeight=0;
		while(iterator.hasNext()) {
			int curWeight=iterator.next();
			//种子大于前一个累计和，小于当前累计和，表明种子就落在当前区间
			if(seed>=prevousWeight && seed<curWeight) {
				edge=weight2EdgeTableW2D.get(curWeight);
				break;
			}
			prevousWeight=curWeight;
		}
		return edge;
	}

	

}
