package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.Song;

public interface MyMusicService {

	/**
	 * 获取当前用户的收藏列表，带收藏标记
	 * @param request
	 * HttpServletRequest
	 * @return
	 * 如果没有过收藏，则返回null
	 */
	List<Song> getMyCollectionWithCollectionFlag(HttpServletRequest request);

	/**
	 * 获取当前用户的最近的播放里表，带收藏标记
	 * @param request
	 * @return
	 */
	List<Song> getMyRecentPlayListWithCollectionFlag(HttpServletRequest request);

}
