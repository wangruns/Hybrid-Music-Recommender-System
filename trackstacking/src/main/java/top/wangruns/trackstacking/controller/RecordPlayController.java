package top.wangruns.trackstacking.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import top.wangruns.trackstacking.service.RecordPlayService;

@Controller
public class RecordPlayController {
	@Autowired
	private RecordPlayService recordPlayService;
	
	
	@GetMapping(value = "recordPlay.do")
	public void recordPlay(HttpServletRequest request,int songId) {
		recordPlayService.recordPlay(request,songId);
		
	}

}
