package top.wangruns.trackstacking.algorithm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.DownloadRecord;
import top.wangruns.trackstacking.model.PlayRecord;
import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.CollectionService;
import top.wangruns.trackstacking.service.PersonalRecService;
import top.wangruns.trackstacking.service.RecordDownloadService;
import top.wangruns.trackstacking.service.RecordPlayService;
import top.wangruns.trackstacking.service.SongService;
import top.wangruns.trackstacking.service.UserService;
import top.wangruns.trackstacking.utils.Static;

@Component
public class UpdateTask extends TimerTask{
	@Autowired
	private PersonalRecService personalRecService;
	@Autowired
	private RecordDownloadService recordDownloadService;
	@Autowired
	private RecordPlayService recordPlayService;
	@Autowired
	private CollectionService collectionService;
	@Autowired
	private UserService userService;
	@Autowired
	private SongService songService;
	

	@Override
	public void run() {
		System.out.println("------------开始执行任务-------------");
		
		try {
			//等待10s再开始执行任务
			TimeUnit.SECONDS.sleep(10);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		userService.getAllRecords();
		//更换推荐列表
		Static.isFromA=!Static.isFromA;
		//用户-歌曲 推荐列表
		Map<Integer,Integer[]> user2songRecMatrix=new HashMap<Integer, Integer[]>();
		//获取用户的下载记录
		List<DownloadRecord> downloadList=recordDownloadService.getAllRecords();
		//获取用户的播放记录
		List<PlayRecord> playList=recordPlayService.getAllRecords();
		//获取用户的收藏记录
		List<Collection> collectionList=collectionService.getAllRecords();
		//获取用户
		List<Integer> userIdList=userService.getAllUserIdRecords();
		//获取歌曲
		List<Integer> songIdList=songService.getAllSongIdRecords();
		//用户-歌曲 “评分”矩阵
		Map<Integer, float[]> user2songRatingMatrix=DataTranslate.getFrequencyMatrix(userIdList,songIdList,
				downloadList,playList,collectionList);
		//用户相似性计算，获取用户的k个近邻用户
		Map<Integer,Integer[]> userKNNMatrix=UserKNN.getKNN(userIdList,user2songRatingMatrix,Static.K);
		//基于用户相似性的协同过滤
		user2songRecMatrix=CollaborativeFiltering.userKNNBasedCF(userIdList,userKNNMatrix,
				user2songRatingMatrix,songIdList,Static.N);
		System.out.println("------------执行任务完成-------------");
		if(Static.isFromA) {
			//向B中更新写数据
			personalRecService.updatePersonalRecIntoB(user2songRecMatrix);
		}else {
			//向A中更新写数据
			personalRecService.updatePersonalRecIntoA(user2songRecMatrix);
		}
	}

}
