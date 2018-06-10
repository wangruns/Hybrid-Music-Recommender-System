package top.wangruns.trackstacking.algorithm;

import java.util.List;
import java.util.Map;
import java.util.Set;

import top.wangruns.trackstacking.model.Song;

public class SGD {

	public static void getW2WSourceDescent(Edge<String, String> edgeW2W, float[] ei, Set<String> bipartiteSetA,
			Map<String, float[]> wordEmbedding, Map<String, int[]> w2wNetwork, Set<String> wordSet, float[] descentW2WSource, float[] descentW2WDestination) {
		String sourceNode=edgeW2W.getSourceNode();
		String destinationNode=edgeW2W.getDestinateNode();
		float ej[]=wordEmbedding.get(destinationNode);
		int relatedArray[]=w2wNetwork.get(sourceNode);
		int len=relatedArray.length;
		//当前节点到对面的网络B的所有连边（公式的分母）
		float sumCurI2B=0;
		//当前节点到对面的网络B的所有连边 乘 B中对应的节点 （公式中的分子）
		float sumCurI2BTimesNodeInB[]=new float[ei.length];
		
		//处理在双边网络B中的节点
		for(int i=0;i<len;i++) {
			String node=W2WNetwork.getW2WNode(i, wordSet);
			//获取对应节点的嵌入
			float[] eB=wordEmbedding.get(node);
			if(!bipartiteSetA.contains(node)) {
				//在双边网络B中的节点与当前节点的转置相乘
				float temp=(float) Math.exp(Operator.times(ei, eB));
				sumCurI2B+=temp;
				Operator.add(sumCurI2BTimesNodeInB,Operator.dotTimes(temp, eB));
			}
		}
		int weight=edgeW2W.getWeight();
		float[] descentSource=Operator.dotTimes(weight, Operator.dotMinus(ej, Operator.divide(sumCurI2BTimesNodeInB,sumCurI2B)));
		float[] curI2JTimesJ=Operator.dotTimes((float) Math.exp(Operator.times(ei, ej)), ej);
		float[] descentDestination=Operator.dotTimes(weight, Operator.dotMinus(ei, Operator.divide(curI2JTimesJ,sumCurI2B)));
		
		Operator.assign(descentW2WSource, Operator.dotTimes(-1, descentSource));
		Operator.assign(descentW2WDestination, Operator.dotTimes(-1, descentDestination));
		
	}

	public static void getW2DSourceDescent(Edge<String, Integer> edgeW2D, float[] ei,
			Map<String, float[]> wordEmbedding, Map<Integer, float[]> lyricEmbedding, Map<String, int[]> w2dNetwork, List<Song> engSongList,
			float[] descentW2DSource, float[] descentW2DDestination) {
		Integer documentNode=edgeW2D.getDestinateNode();
		float ej[]=lyricEmbedding.get(documentNode);
		//当前节点到对面的网络B的所有连边（公式的分母）
		float sumCurI2B=0;
		//当前节点到对面的网络B的所有连边 乘 B中对应的节点 （公式中的分子）
		float sumCurI2BTimesNodeInB[]=new float[ei.length];
		
		//处理在双边网络B中的节点
		for(Song song:engSongList) {
			//在文档子网络中是中的歌曲Id表示的节点
			Integer node_j=song.getSongId();
			//获取对应节点的嵌入
			float[] eB=lyricEmbedding.get(node_j);
			//在双边网络B中的节点与当前节点的转置相乘
			float temp=(float) Math.exp(Operator.times(ei, eB));
			sumCurI2B+=temp;
			Operator.add(sumCurI2BTimesNodeInB,Operator.dotTimes(temp, eB));
		}
		int weight=edgeW2D.getWeight();
		float[] descentSource=Operator.dotTimes(weight, Operator.dotMinus(ej, Operator.divide(sumCurI2BTimesNodeInB,sumCurI2B)));
		float[] curI2JTimesJ=Operator.dotTimes((float) Math.exp(Operator.times(ei, ej)), ej);
		float[] descentDestination=Operator.dotTimes(weight, Operator.dotMinus(ei, Operator.divide(curI2JTimesJ,sumCurI2B)));
		
		Operator.assign(descentW2DSource, Operator.dotTimes(-1, descentSource));
		Operator.assign(descentW2DDestination, Operator.dotTimes(-1, descentDestination));
		
	}


}
