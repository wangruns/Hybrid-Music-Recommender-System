package top.wangruns.trackstacking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.service.RankingPageService;
import top.wangruns.trackstacking.service.TrendingRecService;

@Controller
public class RankingPageCotroller {
	@Autowired
	private RankingPageService rankingPageService;
	
	@GetMapping(value = "rankingPage.do")
	public ModelAndView rankingPage(HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("rankingPage");
		List<TrendingSong> weekRankingList=rankingPageService.getRankWithCollectionFlag(request,1);
		List<TrendingSong> monthRankingList=rankingPageService.getRankWithCollectionFlag(request,2);
		
		modelAndView.addObject("weekRankingList",weekRankingList);
		modelAndView.addObject("monthRankingList",monthRankingList);
		modelAndView.addObject("test","Name");
		
		return modelAndView;
		
	}
	

}
