package top.wangruns.trackstacking.algorithm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.DownloadRecord;
import top.wangruns.trackstacking.model.PlayRecord;

public class DataTranslate {

	/**
	 * 构建用户频率矩阵来近似用户评分，对于某些系统而言，我们是不可能获取到用户对某些项目的评分的，但是我们可以利用用户的
	 * 行为习惯来反映用户的“评分”，比如一个用户常常收听某一首歌，那么我们可以推断该用户喜欢该歌曲的可能性很大.
	 * @param downloadList
	 * 用户的下载记录列表
	 * @param playList
	 * 用户的播放记录列表
	 * @param collectionList
	 * 用户的收藏记录列表
	 * @return
	 * 用户Id-歌曲Id 频率矩阵
	 */
	public static Map<Integer, List<Float>> getFrequencyMatrix(List<DownloadRecord> downloadList,
			List<PlayRecord> playList, List<Collection> collectionList) {
		// TODO Auto-generated method stub
		Map<Integer,List<Float>> user2songRatingMatrix=new HashMap<Integer, List<Float>>();
		
		return user2songRatingMatrix;
	}

}
