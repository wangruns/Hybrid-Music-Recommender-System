package top.wangruns.trackstacking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.service.SearchService;
import top.wangruns.trackstacking.utils.OneDayOneWord;
import top.wangruns.trackstacking.utils.Static;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	
	@RequestMapping(value = "search.do",method = { RequestMethod.GET })
	public ModelAndView search(HttpServletRequest request,String keyword) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("searchResult");
		List<TrendingSong> searchSongList=searchService.getSearchSongWithCollectionFlag(request,keyword);
		
		modelAndView.addObject("searchSongList",searchSongList);
		if(searchSongList.size()==0) {
			modelAndView.addObject("oneDayOneWord","下落不明");
		}else {
			modelAndView.addObject("oneDayOneWord",OneDayOneWord.getOneDayOneWord(Static.SEARCH_WORD_ARRAY));
		}
		
		return modelAndView;
		
	}

}
