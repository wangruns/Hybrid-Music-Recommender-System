package top.wangruns.trackstacking.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import top.wangruns.trackstacking.model.Song;

@Controller
public class TrendingRecController {
	
	
	@RequestMapping(value = "trendingRecPage.do",method = { RequestMethod.GET })
	public ModelAndView trendingRecPage() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("trendingRecPage");
		
		List<Song> song1=new ArrayList<Song>();
		Song s1=new Song();
		s1.setId(1);
		s1.setAddress("track/song/e.mp3");
		s1.setAlbum("As Long As You Love Me");
		s1.setArtist("Justin Bieber");
		s1.setLength(229);
		s1.setName("As Long As You Love Me");
		s1.setType("Rock");
		s1.setWhetherCollected(true);
		
		Song s2=new Song();
		s2.setId(2);
		s2.setAddress("track/song/e.mp3");
		s2.setAlbum("叶会美2");
		s2.setArtist("周杰伦2");
		s2.setLength(120);
		s2.setName("千里之外2");
		s2.setWhetherCollected(false);
		
		
		
		song1.add(s1);
		song1.add(s2);
		modelAndView.addObject("song1",song1);
		modelAndView.addObject("test","Name");
		
		return modelAndView;
		
	}

}
