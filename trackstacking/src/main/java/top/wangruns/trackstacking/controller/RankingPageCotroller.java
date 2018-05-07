package top.wangruns.trackstacking.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.service.RankingPageService;
import top.wangruns.trackstacking.utils.OneDayOneWord;
import top.wangruns.trackstacking.utils.Static;

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
		
		modelAndView.addObject("oneDayOneWord",OneDayOneWord.getOneDayOneWord(Static.RANKING_WORD_ARRAY));
		
		return modelAndView;
		
	}
	

}
