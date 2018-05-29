package top.wangruns.trackstacking.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.SongDao;
import top.wangruns.trackstacking.dao.TrendingRecDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.SongService;
import top.wangruns.trackstacking.utils.Request;

@Service("songService")
public class SongServiceImpl implements SongService{
	@Autowired
	private SongDao songDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;

	public List<Integer> getAllSongIdRecords() {
		return songDao.selectAllSongId();
	}

	public TrendingSong getSongById(int songId) {
		return songDao.selectSongById(songId);
	}

	public TrendingSong getSongByIdWithCollectionFlag(HttpServletRequest request, int songId) {
		//获取对应Id的歌曲
		TrendingSong song=songDao.selectSongById(songId);
		if(song==null) {
			return null;
		}
		//获取对应Id的歌曲的流行度
		int trendingCoefficient=songDao.selectCoefficientById(songId);
		song.setTrendingCoefficient(trendingCoefficient);
		//获取用户的收藏列表
		List<Collection> collectionList=new ArrayList<Collection>();
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList=trendingRecDao.getCollection(user);
		if(collectionList!=null) {
			for(Collection c:collectionList) {
				if(c.getSongId()==songId) {
					song.setWhetherCollected(true);
					break;
				}
			}
		}
		
		return song;
	}

}
