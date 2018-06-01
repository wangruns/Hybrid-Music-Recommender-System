package top.wangruns.trackstacking.dao;

import java.util.List;

import top.wangruns.trackstacking.model.Review;
import top.wangruns.trackstacking.model.TrendingSong;

public interface SearchDao {

	/**
	 * 根据关键字模糊查询歌曲信息
	 * @param keyword
	 * 关键字
	 * @return
	 * 若查询不到，返回empty
	 */
	List<TrendingSong> selectSongLikeKeyword(String keyword);

	/**
	 * 根据关键字模糊查询评论信息
	 * @param keyword
	 * @return
	 * 若查询不到，返回empty
	 */
	List<Review> selectReviewLikeKeyword(String keyword);

}
