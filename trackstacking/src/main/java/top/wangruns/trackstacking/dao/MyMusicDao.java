package top.wangruns.trackstacking.dao;

import java.util.List;

import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;

public interface MyMusicDao {

	/**
	 * 查询当前用户收藏的歌曲信息列表
	 * @param user
	 * @return
	 */
	public List<TrendingSong> selectCollectedSong(User user);

	/**
	 * 查询当前用户最近的播放列表
	 * @param user
	 * @return
	 */
	public List<TrendingSong> selectMyRecentSong(User user);
	
}
