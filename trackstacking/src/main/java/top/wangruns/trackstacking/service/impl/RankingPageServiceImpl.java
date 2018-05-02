package top.wangruns.trackstacking.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.RankingPageDao;
import top.wangruns.trackstacking.dao.TrendingRecDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.RankingPageService;
import top.wangruns.trackstacking.utils.Request;

@Service("rankingPageService")
public class RankingPageServiceImpl implements RankingPageService{
	@Autowired
	private RankingPageDao rankingPageDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;
	
	
	public List<TrendingSong> getRankWithCollectionFlag(HttpServletRequest request, int mode) {
		List<TrendingSong> rankingPageList = new ArrayList<TrendingSong>();
		List<Collection> collectionList = new ArrayList<Collection>();
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList = trendingRecDao.getCollection(user);
		if(mode==1) {
			rankingPageList=rankingPageDao.selectRecentWeekRanking();
		}else if(mode==2){
			rankingPageList=rankingPageDao.selectRecentMonthRanking();
		}else {
			//保留便于扩展
			rankingPageList=rankingPageDao.selectRecentMonthRanking();
		}
		
		// 在个性化列表中给已经被该用户收藏的歌曲加上标记
		if (collectionList != null && rankingPageList != null) {
			for (Collection c : collectionList) {
				for (TrendingSong t : rankingPageList) {
					if (c.getSongId() == t.getSongId()) {
						t.setWhetherCollected(true);
					}
				}
			}
		}
		return rankingPageList;
	}
	
	

}
