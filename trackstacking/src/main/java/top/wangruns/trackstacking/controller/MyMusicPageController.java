package top.wangruns.trackstacking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.service.MyMusicService;

@Controller
public class MyMusicPageController {
	@Autowired
	private MyMusicService myMusicService;
	
	@GetMapping(value = "myMusicPage.do")
	public ModelAndView rankingPage(HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("myMusicPage");
		List<TrendingSong> myCollectionList=myMusicService.getMyCollectionWithCollectionFlag(request);
		List<TrendingSong> myRecentPlayList=myMusicService.getMyRecentPlayListWithCollectionFlag(request);
		
		modelAndView.addObject("myCollectionList",myCollectionList);
		modelAndView.addObject("myRecentPlayList",myRecentPlayList);
		modelAndView.addObject("test","Name");
		
		return modelAndView;
		
	}

}
