package top.wangruns.trackstacking.service;

import java.util.List;

public interface SongService {

	/**
	 * 获取所有的歌曲Id记录
	 * @return
	 * 若没有，则返回null
	 */
	public List<Integer> getAllSongIdRecords();

}
