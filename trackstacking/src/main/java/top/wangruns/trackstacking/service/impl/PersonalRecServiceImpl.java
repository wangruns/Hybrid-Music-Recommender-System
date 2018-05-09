package top.wangruns.trackstacking.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.function.BiConsumer;
import java.util.function.Consumer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.NewTrackOnShelfDao;
import top.wangruns.trackstacking.dao.PersonalRecDao;
import top.wangruns.trackstacking.dao.TrendingRecDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.PersonalRecService;
import top.wangruns.trackstacking.utils.Request;
import top.wangruns.trackstacking.utils.Static;

@Service("personalRecService")
public class PersonalRecServiceImpl implements PersonalRecService {
	@Autowired
	private PersonalRecDao personalRecDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;
	@Autowired
	private NewTrackOnShelfDao newTrackOnShelfDao;

	public List<TrendingSong> getPersonalDailyRecWithCollectionFlag(HttpServletRequest request) {
		List<TrendingSong> personalRecList = new ArrayList<TrendingSong>();
		List<Collection> collectionList = new ArrayList<Collection>();
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList = trendingRecDao.getCollection(user);
		/* =============================================================== */
		personalRecList=selectPersonalRec(user);
		/* =============================================================== */
		// 在个性化列表中给已经被该用户收藏的歌曲加上标记
		if (collectionList != null && personalRecList != null) {
			for (Collection c : collectionList) {
				for (TrendingSong t : personalRecList) {
					if (c.getSongId() == t.getSongId()) {
						t.setWhetherCollected(true);
					}
				}
			}
		}
		return personalRecList;
	}

	/**
	 * 每天早上6点更新个性化推荐列表，从更新后的表中读取记录			 					
	 * 这里采用两张表交替的方式来实现：
	 * （1）	6点之后就从另外一张表中读取记录
	 * （2）	重新开始计算新的个性化推荐列表存放于原来的表中的
	 * @param user
	 * @return
	 */
	private List<TrendingSong> selectPersonalRec(User user) {
		if(user==null) return null;
		List<TrendingSong> personalRecList = new ArrayList<TrendingSong>();
		if(Static.isFromA) {
			personalRecList=personalRecDao.selectPersonalRecFromA(user);
		}else {
			personalRecList=personalRecDao.selectPersonalRecFromB(user);
		}
		return personalRecList;
	}

	public void initializePersonalRecList(HttpServletRequest request) {
		final User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		List<TrendingSong> initialRecListA = new ArrayList<TrendingSong>();
		List<TrendingSong> initialRecListB = new ArrayList<TrendingSong>();
		//从新歌中随机获取10首，作为初始化列表
		initialRecListA=newTrackOnShelfDao.selecNewSong();
		for(int i=0;i<40;i++) {
			int len=initialRecListA.size();
			Random random=new Random();
			int index=random.nextInt(len);
			if(i<10) {
				initialRecListB.add(initialRecListA.get((index+1)%len));
			}
			initialRecListA.remove(index);
		}
		//批量插入
		if(Static.isFromA) {
			personalRecDao.insertListIntoRecA(initialRecListA,user.getUserId());
		}else {
			personalRecDao.insertListIntoRecB(initialRecListB,user.getUserId());
		}
		
	}

	public void updatePersonalRecIntoB(Map<Integer, Integer[]> user2song) {
		// TODO Auto-generated method stub
		user2song.forEach(new BiConsumer<Integer,Integer[]>(){

			public void accept(Integer userId, Integer[] recSongIds) {
				// TODO Auto-generated method stub
				personalRecDao.deleteBByUserId(userId);
				//批量插入
				personalRecDao.insertArrayIntoRecB(recSongIds,userId);
				
			}
			
		});
		
	}

	public void updatePersonalRecIntoA(Map<Integer, Integer[]> user2song) {
		// TODO Auto-generated method stub
		user2song.forEach(new BiConsumer<Integer,Integer[]>(){

			public void accept(Integer userId, Integer[] recSongIds) {
				// TODO Auto-generated method stub
				personalRecDao.deleteAByUserId(userId);
				//批量插入
				personalRecDao.insertArrayIntoRecA(recSongIds,userId);
				
			}
			
		});
		
	}



}
