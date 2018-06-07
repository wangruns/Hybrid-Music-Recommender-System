package top.wangruns.trackstacking.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import top.wangruns.trackstacking.model.Review;
import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.service.RecordPlayService;
import top.wangruns.trackstacking.service.ReviewService;
import top.wangruns.trackstacking.service.SongService;
import top.wangruns.trackstacking.service.UserService;
import top.wangruns.trackstacking.utils.ReturnMsg;

@Controller
public class ReviewController {
	@Autowired
	private SongService songService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "reviewFrameLoad.do", method = { RequestMethod.GET })
	public ModelAndView reviewFrameLoad(HttpServletRequest request, int songId) {
		//获取当前选中的歌曲
		Song song = songService.getSongByIdWithCollectionFlag(request, songId);
		//获取选中歌曲的精彩评论
		List<Review> hotReviewList = reviewService.getHotReviewBySongIdWithLikeFlag(request,songId);
		//获取选中歌曲的最新评论(目前评论数据很少，先不做分页)
		List<Review> newReviewList = reviewService.getNewReviewBySongIdWithLikeFlag(request,songId);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("reviewFrame");
		
		modelAndView.addObject("song", song);
		modelAndView.addObject("hotReviewList", hotReviewList);
		modelAndView.addObject("newReviewList", newReviewList);

		return modelAndView;
	}
	
	@PostMapping(value = "review.do")
	@ResponseBody
	public String review(HttpServletRequest request,int songId,String review) {
		boolean isAdded=reviewService.addReview(request,songId,review);
		if(isAdded) {
			return ReturnMsg.msg(HttpServletResponse.SC_OK,"评论成功");
		}
		return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "评论出错");
	}
	
	@GetMapping(value = "reviewLike.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String reviewLike(HttpServletRequest request,int reviewId) {
		boolean isLiked=reviewService.reviewLikeChange(request,reviewId);
		return ReturnMsg.msg(HttpServletResponse.SC_OK, isLiked+"");
	}
	
	@RequestMapping(value = "newReviewFrameLoad.do", method = { RequestMethod.GET })
	public ModelAndView newReviewFrameLoad(HttpServletRequest request, int songId) {
		//获取选中歌曲的最新评论(目前评论数据很少，先不做分页)
		List<Review> newReviewList = reviewService.getNewReviewBySongIdWithLikeFlag(request,songId);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("newReviewFrame");
		modelAndView.addObject("newReviewList", newReviewList);

		return modelAndView;
	}
	
	@RequestMapping(value = "deleteReview.do", method = { RequestMethod.POST })
	public void deleteReview(HttpServletRequest request, int reviewIds[]) {
		if(userService.isHasPrivilege(request)) {
			reviewService.batchDeleteById(reviewIds);
		}
		
	}
		

}
