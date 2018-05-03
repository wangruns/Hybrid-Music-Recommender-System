package top.wangruns.trackstacking.algorithm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;

import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.DownloadRecord;
import top.wangruns.trackstacking.model.PlayRecord;
import top.wangruns.trackstacking.service.CollectionService;
import top.wangruns.trackstacking.service.PersonalRecService;
import top.wangruns.trackstacking.service.RecordDownloadService;
import top.wangruns.trackstacking.service.RecordPlayService;
import top.wangruns.trackstacking.utils.Static;

public class UpdateTask extends TimerTask{
	@Autowired
	private PersonalRecService personalRecService;
	@Autowired
	private RecordDownloadService recordDownloadService;
	@Autowired
	private RecordPlayService recordPlayService;
	@Autowired
	private CollectionService collectionService;
	

	@Override
	public void run() {
		//更换推荐列表
		Static.isFromA=!Static.isFromA;
		//用户-歌曲 推荐列表
		Map<Integer,List<Integer>> user2songRecMatrix=new HashMap<Integer, List<Integer>>();
		//获取用户的下载记录
		List<DownloadRecord> downloadList=recordDownloadService.getAllRecords();
		//获取用户的播放记录
		List<PlayRecord> playList=recordPlayService.getAllRecords();
		//获取用户的收藏记录
		List<Collection> collectionList=collectionService.getAllRecords();
		//用户-歌曲 “评分”矩阵
		Map<Integer,List<Float>> user2songRatingMatrix=new HashMap<Integer, List<Float>>();
		user2songRatingMatrix=DataTranslate.getFrequencyMatrix(downloadList,playList,collectionList);
//		userKNNBasedCF(user2song);
		if(Static.isFromA) {
			//向B中更新写数据
			personalRecService.updatePersonalRecIntoB(user2songRecMatrix);
		}else {
			//向A中更新写数据
			personalRecService.updatePersonalRecIntoA(user2songRecMatrix);
		}
	}

}
