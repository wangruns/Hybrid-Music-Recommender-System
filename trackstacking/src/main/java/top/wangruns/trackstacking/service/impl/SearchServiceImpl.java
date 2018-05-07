package top.wangruns.trackstacking.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.SearchDao;
import top.wangruns.trackstacking.dao.TrendingRecDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.SearchService;
import top.wangruns.trackstacking.utils.Request;

@Service("searchService")
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDao searchDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;
	

	public List<TrendingSong> getSearchSongWithCollectionFlag(HttpServletRequest request, String keyword) {
		List<TrendingSong> searchSongList=new ArrayList<TrendingSong>();
		List<Collection> collectionList=new ArrayList<Collection>();
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList=trendingRecDao.getCollection(user);
		searchSongList=searchDao.selectSongLikeKeyword(keyword);
		
		//在搜索结果列表中给已经被该用户收藏的歌曲加上标记
		if(collectionList!=null && searchSongList!=null) {
			for(Collection c:collectionList) {
				for(TrendingSong t:searchSongList) {
					if(c.getSongId()==t.getSongId()) {
						t.setWhetherCollected(true);
					}
				}
			}
		}
		return searchSongList;
	}
	

}
