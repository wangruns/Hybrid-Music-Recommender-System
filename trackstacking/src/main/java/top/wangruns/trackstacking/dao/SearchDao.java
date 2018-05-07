package top.wangruns.trackstacking.dao;

import java.util.List;

import top.wangruns.trackstacking.model.TrendingSong;

public interface SearchDao {

	/**
	 * 根据关键字模糊查询歌曲信息
	 * @param keyword
	 * 关键字
	 * @return
	 * 若查询不到，返回null
	 */
	List<TrendingSong> selectSongLikeKeyword(String keyword);

}
