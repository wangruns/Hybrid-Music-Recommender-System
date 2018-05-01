package top.wangruns.trackstacking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.service.TrendingRecService;

@Controller
public class TrendingRecController {
	@Autowired
	private TrendingRecService trendingRecService;
	
	
	@RequestMapping(value = "trendingRecPage.do",method = { RequestMethod.GET })
	public ModelAndView trendingRecPage(HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("trendingRecPage");
		List<TrendingSong> trendingSongList=trendingRecService.getTrendingSongWithCollectionFlag(request);
		
		modelAndView.addObject("trendingSongList",trendingSongList);
		modelAndView.addObject("test","Name");
		
		return modelAndView;
		
	}

}
