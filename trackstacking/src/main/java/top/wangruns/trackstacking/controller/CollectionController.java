package top.wangruns.trackstacking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.wangruns.trackstacking.utils.ReturnMsg;

@Controller
public class CollectionController {
	
	
	@PostMapping(value = "collectSong.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String collectSong(HttpServletRequest request,int songId) {
		System.out.println(songId);
//		return null;
		
		return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "收藏失败");
		
	}

}
