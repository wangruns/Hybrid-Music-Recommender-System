package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.Review;

public interface ReviewService {

	/**
	 * 添加评论并返回是否成功
	 * @param request
	 * HttpServletRequest
	 * @param songId
	 * 歌曲Id
	 * @param review
	 * 评论信息
	 * @return
	 * 如果添加成功，返回true
	 */
	boolean addReview(HttpServletRequest request, int songId, String review);

	/**
	 * 获取当前歌曲的精彩评论，并加上是否被当前用户点赞的标记
	 * @param request
	 * HttpServletRequest
	 * @param songId
	 * 歌曲Id
	 * @return
	 * 评论信息列表
	 */
	List<Review> getHotReviewBySongIdWithLikeFlag(HttpServletRequest request, int songId);

}
