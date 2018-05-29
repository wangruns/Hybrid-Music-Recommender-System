package top.wangruns.trackstacking.dao;

import java.util.List;

import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.TrendingSong;

public interface SongDao {

	/**
	 * 获取所有歌曲Id记录
	 * @return
	 * 若没有，则返回null
	 */
	List<Integer> selectAllSongId();

	/**
	 * 查询歌曲信息，根据其Id
	 * @param songId
	 * @return
	 */
	TrendingSong selectSongById(int songId);

	/**
	 * 查询歌曲的流行度，根据其Id
	 * @param songId
	 * @return
	 */
	int selectCoefficientById(int songId);

}
