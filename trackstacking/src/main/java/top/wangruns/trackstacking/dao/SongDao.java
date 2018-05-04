package top.wangruns.trackstacking.dao;

import java.util.List;

public interface SongDao {

	/**
	 * 获取所有歌曲Id记录
	 * @return
	 * 若没有，则返回null
	 */
	List<Integer> selectAllSongId();

}
