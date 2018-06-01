package top.wangruns.trackstacking.dao;

import java.util.List;

import top.wangruns.trackstacking.model.Like;
import top.wangruns.trackstacking.model.Review;

public interface ReviewDao {

	/**
	 * 插入评论信息
	 * @param review
	 * 评论对象
	 * @return
	 * 若插入成功返回1,否则返回0,即返回受影响的行数
	 */
	int insert(Review review);

	/**
	 * 查询当前用户的点赞信息
	 * @param userId
	 * 当前用户Id
	 * @return
	 * 如果没有，则返回null
	 */
	List<Like> selectLikeByUserId(int userId);

	/**
	 * 查询当前歌曲的带点赞数目的精彩评论信息,这里定义前10条
	 * @param songId
	 * 当前歌曲Id
	 * @return
	 * 如果没有，返回null
	 */
	List<Review> selectHotReviewWithLikeNumber(int songId);

	/**
	 * 查询当前点在是否存在
	 * @param like
	 * 点赞对象like（主要是根据用户userId和评论reviewId）
	 * @return
	 * 如果没有，返回null
	 */
	Like selectByLike(Like like);

	/**
	 * 插入点赞记录
	 * @param like
	 */
	void insertLikeRecord(Like like);

	/**
	 * 删除点赞记录
	 * @param likeId
	 */
	void deleteLikeRecordById(int likeId);

	/**
	 * 查询当前歌曲的带点赞数目的最新评论信息
	 * @param songId
	 * 当前歌曲Id
	 * @return
	 * 如果没有，返回null
	 */
	List<Review> selectNewReviewWithLikeNumber(int songId);

	/**
	 * 批量删除，根据数组里面的Id删除对应的评论
	 * @param reviewIds
	 */
	void deleteByIds(int[] reviewIds);

}
