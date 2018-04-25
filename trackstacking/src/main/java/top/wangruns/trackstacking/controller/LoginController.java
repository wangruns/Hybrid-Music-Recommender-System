package top.wangruns.trackstacking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.UserService;
import top.wangruns.trackstacking.utils.ReturnMsg;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	
	@PostMapping(value = "login.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String login(HttpServletRequest request, User u) {
		boolean isUserExisted=userService.findLogin(u);
		if(!isUserExisted) {
			return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "帐号或密码错误");
		}else {
			request.getSession().setAttribute("user", u);
			return ReturnMsg.msg(HttpServletResponse.SC_OK, JSONObject.toJSON(u).toString());
		}
	}
	
	
	

}
