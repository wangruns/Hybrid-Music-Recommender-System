package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.TrendingSong;

public interface SongService {

	/**
	 * 获取所有的歌曲Id记录
	 * @return
	 * 若没有，则返回null
	 */
	public List<Integer> getAllSongIdRecords();

	/**
	 * 根据歌曲Id获取歌曲的信息
	 * @param songId
	 * @return
	 * 若没有，则返回null
	 */
	public TrendingSong getSongById(int songId);

	/**
	 * 根据歌曲Id获取歌曲的信息，并加上是否收藏的标记
	 * @param request
	 * @param songId
	 * @return
	 */
	public TrendingSong getSongByIdWithCollectionFlag(HttpServletRequest request, int songId);

}
