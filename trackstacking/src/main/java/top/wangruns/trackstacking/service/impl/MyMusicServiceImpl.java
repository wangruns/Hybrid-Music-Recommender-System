package top.wangruns.trackstacking.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.MyMusicDao;
import top.wangruns.trackstacking.dao.NewTrackOnShelfDao;
import top.wangruns.trackstacking.dao.TrendingRecDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.MyMusicService;
import top.wangruns.trackstacking.utils.Request;

@Service("myMusicService")
public class MyMusicServiceImpl implements MyMusicService{
	@Autowired
	private MyMusicDao myMusicDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;

	
	public List<TrendingSong> getMyCollectionWithCollectionFlag(HttpServletRequest request) {
		List<TrendingSong> myCollectionList = new ArrayList<TrendingSong>();
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		myCollectionList = myMusicDao.selectCollectedSong(user);
		//为该用户收藏的歌曲加上标记
		if(myCollectionList!=null) {
			for(TrendingSong t:myCollectionList) {
				t.setWhetherCollected(true);
			}
		}
		return myCollectionList;
	}

	public List<TrendingSong> getMyRecentPlayListWithCollectionFlag(HttpServletRequest request) {
		List<TrendingSong> myRecentPalyList = new ArrayList<TrendingSong>();
		List<Collection> collectionList=new ArrayList<Collection>();
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		myRecentPalyList = myMusicDao.selectMyRecentSong(user);
		collectionList=trendingRecDao.getCollection(user);
		//在新碟上架列表中给已经被该用户收藏的歌曲加上标记
		if(collectionList!=null && myRecentPalyList!=null) {
			for(Collection c:collectionList) {
				for(TrendingSong t:myRecentPalyList) {
					if(c.getSongId()==t.getSongId()) {
						t.setWhetherCollected(true);
					}
				}
			}
		}
		return myRecentPalyList;
	}

}
