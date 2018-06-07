package top.wangruns.trackstacking.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.service.RankingPageService;
import top.wangruns.trackstacking.utils.OneDayOneWord;
import top.wangruns.trackstacking.utils.Static;

@Controller
public class RankingPageCotroller {
	@Autowired
	private RankingPageService rankingPageService;
	
	@GetMapping(value = "rankingFrameLoad.do")
	public ModelAndView rankingFrameLoad(HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("rankingFrame");
		List<Song> weekRankingList=rankingPageService.getRankWithCollectionFlag(request,1);
		List<Song> monthRankingList=rankingPageService.getRankWithCollectionFlag(request,2);
		
		modelAndView.addObject("weekRankingList",weekRankingList);
		modelAndView.addObject("monthRankingList",monthRankingList);
		
		modelAndView.addObject("oneDayOneWord",OneDayOneWord.getOneDayOneWord(Static.RANKING_WORD_ARRAY));
		
		return modelAndView;
		
	}
	
	

}
