package top.wangruns.trackstacking.algorithm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.function.Consumer;

public class UserKNN {

	/**
	 * 获取用户的k个近邻用户
	 * @param userIdList
	 * 用户Id列表
	 * @param user2songRatingMatrix
	 * 用户-歌曲 “评分”矩阵
	 * @param k
	 * 参数k,k个邻居
	 * @return
	 * userId,[neighborAId,neighborBId...neighborKId]
	 */
	public static Map<Integer, Integer[]> getKNN(List<Integer> userIdList, final Map<Integer, float[]> user2songRatingMatrix, final int k) {
		// TODO Auto-generated method stub
		final Map<Integer,Integer[]> userKNNMatrix=new HashMap<Integer,Integer[]>();
		userIdList.forEach(new Consumer<Integer>() {

			public void accept(final Integer curUserId) {
				// TODO Auto-generated method stub
				Integer[] knnId=new Integer[k];
				//为用户建立一个最小堆来存放相似性最大的k个邻居
				final MininumHeap mininumHeap=new MininumHeap(k);
				//获取K Nearest Neighbors
				user2songRatingMatrix.forEach(new BiConsumer<Integer, float[]>() {

					public void accept(Integer otherUserId, float[] userRatingArray) {
						// TODO Auto-generated method stub
						//排除自己
						if(otherUserId!=curUserId) {
							//计算当前用户和其他用户的相似性
							float similarity=Similarity.calculateSimilarity(user2songRatingMatrix.get(curUserId),user2songRatingMatrix.get(otherUserId));
							//放入堆中
							mininumHeap.addElement(new TreeNode(otherUserId,similarity));
						}
						
					}

				});
				//从堆中获取相似性最大的k的邻居
				for(int i=0;i<k;i++) {
					knnId[i]=mininumHeap.getArray()[i].id;
				}
				userKNNMatrix.put(curUserId, knnId);
			}
			
		});
		return userKNNMatrix;
	}

}
