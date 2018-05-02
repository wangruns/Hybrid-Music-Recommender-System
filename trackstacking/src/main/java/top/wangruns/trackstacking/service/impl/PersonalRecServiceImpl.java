package top.wangruns.trackstacking.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.PersonalRecDao;
import top.wangruns.trackstacking.dao.TrendingRecDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.PersonalRecService;
import top.wangruns.trackstacking.utils.Request;

@Service("personalRecService")
public class PersonalRecServiceImpl implements PersonalRecService {
	@Autowired
	private PersonalRecDao personalRecDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;

	public List<TrendingSong> getPersonalDailyRecWithCollectionFlag(HttpServletRequest request) {
		List<TrendingSong> personalRecList = new ArrayList<TrendingSong>();
		List<Collection> collectionList = new ArrayList<Collection>();
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList = trendingRecDao.getCollection(user);
		/* =============================================================== */
		
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

}
