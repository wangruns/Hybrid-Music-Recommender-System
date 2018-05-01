package top.wangruns.trackstacking.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.NewTrackOnShelfDao;
import top.wangruns.trackstacking.dao.TrendingRecDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.NewTrackOnShelfService;
import top.wangruns.trackstacking.utils.Request;

@Service("newTrackOnShelfService")
public class NewTrackOnShelfServiceImpl implements NewTrackOnShelfService{
	@Autowired
	private NewTrackOnShelfDao newTrackOnShelfDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;

	public List<TrendingSong> getNewTrackWithCollectionFlag(HttpServletRequest request) {
		List<TrendingSong> newTackOnShelList=new ArrayList<TrendingSong>();
		List<Collection> collectionList=new ArrayList<Collection>();
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList=trendingRecDao.getCollection(user);
		newTackOnShelList=newTrackOnShelfDao.selecNewSong();
		//在新碟上架列表中给已经被该用户收藏的歌曲加上标记
		if(collectionList!=null && newTackOnShelList!=null) {
			for(Collection c:collectionList) {
				for(TrendingSong t:newTackOnShelList) {
					if(c.getSongId()==t.getSongId()) {
						t.setWhetherCollected(true);
					}
				}
			}
		}
		return newTackOnShelList;
	}

}
