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
import top.wangruns.trackstacking.model.Song;
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
		
		//在结果列表中给已经被该用户点赞的评论加上标记
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

	public boolean reviewLikeChange(HttpServletRequest request, int reviewId) {
		boolean isLiked=true;
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		//获取当前评论的点赞状态
		Like like=reviewDao.selectByLike(new Like(user.getUserId(),reviewId));
		if(like==null) {
			//该评论还没有被该用户点赞
			isLiked=false;
			//进行点赞
			reviewDao.insertLikeRecord(new Like(user.getUserId(),reviewId));
		}else {
			//已经点赞了，则取消点赞
			reviewDao.deleteLikeRecordById(like.getLikeId());
		}
		//返回该评论改变后的点赞状态
		return !isLiked;
	}

	public List<Review> getNewReviewBySongIdWithLikeFlag(HttpServletRequest request, int songId) {
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		//获取用户的点赞列表
		List<Like> likeList=null;
		if(user!=null) {
			likeList= reviewDao.selectLikeByUserId(user.getUserId());
		}
		//获取歌曲的最新评论列表
		List<Review> newReviewList= reviewDao.selectNewReviewWithLikeNumber(songId);
		
		//在结果列表中给已经被该用户点赞的评论加上标记
		if(newReviewList!=null && likeList!=null) {
			for(Like like:likeList) {
				for(Review review:newReviewList) {
					if(like.getReviewId()==review.getReviewId()) {
						review.setWhetherLiked(true);
					}
				}
			}
		}
		return newReviewList;
	}

	public void batchDeleteById(int[] reviewIds) {
		if(reviewIds==null) {
			return;
		}
		reviewDao.deleteByIds(reviewIds);
		
	}

}
