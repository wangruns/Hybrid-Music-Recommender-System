package top.wangruns.trackstacking.algorithm;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.function.Consumer;

import top.wangruns.trackstacking.model.Song;

public class Training {

	/**
	 * 嵌入学习
	 * @param engSongList
	 * 歌曲信息列表,其遍历顺序对应w2dNetwork的数组[]下标
	 * @param w2wNetwork
	 * word 2 word Network
	 * @param w2dNetwork
	 * word 2 document network
	 * @param iter
	 * 采样的次数
	 * @param d
	 * 向量的维度
	 * @param alpha 
	 * 学习率
	 * @param wordSet 
	 * 单词节点集合，其遍历的顺序对应w2wNetwork的数组[]下标
	 * @return
	 * Map(songId,[document embedding])
	 */
	public static Map<Integer, float[]> train(List<Song> engSongList, final Map<String, int[]> w2wNetwork,
			Map<String, int[]> w2dNetwork, int iter, final int d, float alpha, final Set<String> wordSet) {
		Map<Integer, float[]> lyricEmbedding=new HashMap<Integer, float[]>();
		final Map<String, float[]> wordEmbedding=new HashMap<String, float[]>();
		//随机初始化
		for(Song song:engSongList) {
			float e[]=initialEmbedding(d);
			lyricEmbedding.put(song.getSongId(), e);
		}
		System.out.println("---------随机初始化 done----------");
		w2dNetwork.keySet().forEach(new Consumer<String>() {

			public void accept(String word) {
				float e[]=initialEmbedding(d);
				wordEmbedding.put(word, e);
			}
			
		});
		//为word 2 word换分双边网络
		final Set<String> bipartiteSetA=getBipartiteSetA(w2wNetwork,wordSet);
		
		//获取累计weight2Edge表
		Map<Integer,Edge<String,String>> weight2EdgeTableW2W=Sample.getWeight2EdgeTableW2W(w2wNetwork,wordSet,bipartiteSetA);
		//word 2 document 的双边网络很明显，所以不用特意的划分，getWeight2EdgeTableW2W的纵轴为bipartiteSetA,横轴为bipartiteSetB假设
		Map<Integer,Edge<String,Integer>> weight2EdgeTableW2D=Sample.getWeight2EdgeTableW2D(w2dNetwork,engSongList);
		//训练
		while(iter-->0) {
			//从w2wNetwork中采样，更新word embedding
			Edge<String,String> edgeW2W=Sample.simpleProbabilitySamplingW2W(weight2EdgeTableW2W);
			String sourceNodeW2W=edgeW2W.getSourceNode();
			String destinationNodeW2W=edgeW2W.getDestinateNode();
			
			float eW2WSource[]=wordEmbedding.get(sourceNodeW2W);
			float eW2WDestination[]=wordEmbedding.get(destinationNodeW2W);
			
			float descentW2WSource[]=new float[d];
			float descentW2WDestination[]=new float[d];
			SGD.getW2WSourceDescent(edgeW2W,eW2WSource,bipartiteSetA,wordEmbedding,w2wNetwork,wordSet,descentW2WSource,descentW2WDestination);
			
			float newEW2WSource[]=Operator.dotMinus(eW2WSource,Operator.dotTimes(alpha,descentW2WSource));
			float newEW2WDestination[]=Operator.dotMinus(eW2WDestination,Operator.dotTimes(alpha,descentW2WDestination));
			
			Operator.assign(wordEmbedding.get(sourceNodeW2W),newEW2WSource);
			Operator.assign(wordEmbedding.get(destinationNodeW2W),newEW2WDestination);
			
			
			//从w2dNetwork中采样，更新word and document embedding
			Edge<String,Integer> edgeW2D=Sample.simpleProbabilitySamplingW2D(weight2EdgeTableW2D);
			String sourceNodeW2D=edgeW2D.getSourceNode();
			Integer destinationNodeW2D=edgeW2D.getDestinateNode();
			
			float eW2DSource[]=wordEmbedding.get(sourceNodeW2D);
			float eW2DDestination[]=lyricEmbedding.get(destinationNodeW2D);
			
			float descentW2DSource[]=new float[d];
			float descentW2DDestination[]=new float[d];
			SGD.getW2DSourceDescent(edgeW2D,eW2DSource,wordEmbedding,lyricEmbedding,w2dNetwork,engSongList,descentW2DSource,descentW2DDestination);
			
			float newEW2DSource[]=Operator.dotMinus(eW2DSource,Operator.dotTimes(alpha,descentW2DSource));
			float newEW2DDestination[]=Operator.dotMinus(eW2DDestination,Operator.dotTimes(alpha,descentW2DDestination));
			
			Operator.assign(wordEmbedding.get(sourceNodeW2D),newEW2DSource);
			Operator.assign(lyricEmbedding.get(destinationNodeW2D),newEW2DDestination);
			
		}
		
		return lyricEmbedding;
	}

	/**
	 * 划分word 2 word双边网络,并返回网络双边网络子网A
	 * word 2 word也是可以看做是双边网络的，只需将图中的无向边看成两个有向边，把源头的一方看做是A子节点集，另一方看做B子节点集
	 * 具体地，遍历w2wNetwork节点，若节点a首次指向了b,c节点，则将b,c节点归到B子节点集中去；下一个从d节点开始，若d指向了f节点，则将f放到B中
	 * :
	 * for node_i in w2wNetwork and node_i not in add2SetB{
	 * 		for node_j in w2wNetwork{
	 * 			//排除自己
	 * 			if(node_i!=node_j and isRelated(node_i,node_j) ){
	 * 				add2SetA(node_i);
	 * 				add2SetB(node_j);
	 * 		}
	 * 	}
	 * }
	 * @param wordSet 
	 */
	private static Set<String> getBipartiteSetA(final Map<String, int[]> w2wNetwork, final Set<String> wordSet) {
		final Set<String> bipartiteSetA=new HashSet<String>();
		final Set<String> bipartiteSetB=new HashSet<String>();
		w2wNetwork.keySet().forEach(new Consumer<String>() {

			public void accept(final String node_i) {
				
				if(!bipartiteSetB.contains(node_i)) {
					w2wNetwork.keySet().forEach(new Consumer<String>() {
						
						public void accept(String node_j) {
							if(!node_i.equals(node_j) && isRelated(node_i,node_j)) {
								bipartiteSetA.add(node_i);
								bipartiteSetB.add(node_j);
							}
						}

						private boolean isRelated(String node_i, String node_j) {
							int weights[]=w2wNetwork.get(node_i);
							//获取下标
							int index=W2WNetwork.getW2WIndex(node_j,wordSet);
							//有连边
							if(weights[index]!=0) {
								return true;
							}
							return false;
						}

						
					});
				}
				
			}
			
		});
		return bipartiteSetA;
	}

	/**
	 * 初始化嵌入
	 * @param dimension
	 * @return
	 */
	private static float[] initialEmbedding(int dimension) {
		Random random=new Random(47);
		float e[]=new float[dimension];
		for(int i=0;i<dimension;i++) {
			e[i]=random.nextFloat();
		}
		return e;
	}
	

}
