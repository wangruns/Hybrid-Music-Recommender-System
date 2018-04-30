package top.wangruns.trackstacking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.wangruns.trackstacking.service.CollectionService;
import top.wangruns.trackstacking.service.UserService;
import top.wangruns.trackstacking.utils.ReturnMsg;

@Controller
public class CollectionController {
	@Autowired
	private CollectionService collectionService;
	
	
	@PostMapping(value = "collectSong.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String collectSong(HttpServletRequest request,int songId) {
		boolean isCollected=collectionService.collectionChange(request,songId);
		return ReturnMsg.msg(HttpServletResponse.SC_OK, isCollected+"");
		
	}

}
