package top.wangruns.trackstacking.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import top.wangruns.trackstacking.service.SongService;
import top.wangruns.trackstacking.service.UserService;

@Controller
public class SongController {
	@Autowired
	private UserService userService;
	@Autowired
	private SongService songService;
	
	@RequestMapping(value = "deleteSong.do", method = { RequestMethod.POST })
	public void deleteSong(HttpServletRequest request, int songIds[]) {
		if(userService.isHasPrivilege(request)) {
			songService.batchDeleteById(songIds);
		}
		
	}

}
