package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.Review;
import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.User;

public interface SearchService {

	/**
	 * 根据关键词，查询歌词信息，并加上是否收藏标记
	 * @param request
	 * HttpServletRequest
	 * @param keyword
	 * 搜索关键词
	 * @return
	 * 若没有结果，返回list.size()=0
	 */
	List<Song> getSearchSongWithCollectionFlag(HttpServletRequest request, String keyword);

	/**
	 * 根据关键词，查询评论信息
	 * @param keyword
	 * 搜索关键词
	 * @return
	 * 若没有结果，返回list.size()=0
	 */
	List<Review> getSearchReview(String keyword);

	/**
	 * 根据关键词，查询用户信息,不包括管理员自己
	 * @param request 
	 * HttpServletRequest
	 * @param keyword
	 * 搜索关键词
	 * @return
	 * 若没有结果，返回list.size()=0
	 */
	List<User> getSearchUser(HttpServletRequest request, String keyword);

	/**
	 * 根据关键词，查询歌曲信息
	 * @param keyword
	 * 搜索关键词
	 * @return
	 * 若没有结果，返回list.size()=0
	 */
	List<Song> getSearchSong(String keyword);

}
