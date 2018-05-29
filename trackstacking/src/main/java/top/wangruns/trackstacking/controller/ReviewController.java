package top.wangruns.trackstacking.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.service.RecordPlayService;
import top.wangruns.trackstacking.service.SongService;

@Controller
public class ReviewController {
	@Autowired
	private SongService songService;

	@RequestMapping(value = "reviewFrameLoad.do", method = { RequestMethod.GET })
	public ModelAndView reviewFrameLoad(HttpServletRequest request, int songId) {
		TrendingSong song = songService.getSongByIdWithCollectionFlag(request, songId);
		List<TrendingSong> clickedSongList = new ArrayList<TrendingSong>();
		clickedSongList.add(song);
		clickedSongList.add(song);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("reviewFrame");

		modelAndView.addObject("clickedSongList", clickedSongList);
		modelAndView.addObject("songName", song.getSongName());

		return modelAndView;

	}

}
