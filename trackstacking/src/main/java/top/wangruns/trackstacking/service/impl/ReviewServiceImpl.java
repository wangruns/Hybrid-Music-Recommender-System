package top.wangruns.trackstacking.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.ReviewDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.Like;
import top.wangruns.trackstacking.model.Review;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.ReviewService;
import top.wangruns.trackstacking.utils.Request;

@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private ReviewDao reviewDao;

	public boolean addReview(HttpServletRequest request, int songId, String content) {
		boolean isInsertSuccessful = false;
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		if (user == null) {
			return isInsertSuccessful;
		}
		Review review = new Review(user.getUserId(), songId, content);
		int affectedRows = reviewDao.insert(review);
		if (affectedRows > 0) {
			isInsertSuccessful = true;
		}
		return isInsertSuccessful;
	}

	public List<Review> getHotReviewBySongIdWithLikeFlag(HttpServletRequest request, int songId) {
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		//获取用户的点赞列表
		List<Like> likeList=null;
		if(user!=null) {
			likeList= reviewDao.selectLikeByUserId(user.getUserId());
		}
		//获取歌曲的精彩评论列表
		List<Review> hotReviewList= reviewDao.selectHotReviewWithLikeNumber(songId);
		
		//在搜索结果列表中给已经被该用户收藏的歌曲加上标记
		if(hotReviewList!=null && likeList!=null) {
			for(Like like:likeList) {
				for(Review review:hotReviewList) {
					if(like.getReviewId()==review.getReviewId()) {
						review.setWhetherLiked(true);
					}
				}
			}
		}
		return hotReviewList;
	}

}
