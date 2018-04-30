package top.wangruns.trackstacking.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.TrendingRecDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.TrendingRecService;
import top.wangruns.trackstacking.utils.Request;

@Service("trendingService")
public class TrendingRecServiceImpl implements TrendingRecService {
	@Autowired
	private TrendingRecDao trendingRecDao;
	@Autowired
	private UserDao userDao;

	public List<TrendingSong> getTrendingSongWithCollectionFlag(HttpServletRequest request) {
		List<TrendingSong> trendingRecList=new ArrayList<TrendingSong>();
		List<Collection> collectionList=new ArrayList<Collection>();
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList=trendingRecDao.getCollection(user);
		trendingRecList=trendingRecDao.getTrendingSong();
		//在热门推荐列表中给已经被该用户收藏的歌曲加上标记
		if(collectionList!=null && trendingRecList!=null) {
			for(Collection c:collectionList) {
				for(TrendingSong t:trendingRecList) {
					if(c.getSongId()==t.getSongId()) {
						t.setWhetherCollected(true);
					}
				}
			}
		}
		return trendingRecList;
	}

}
