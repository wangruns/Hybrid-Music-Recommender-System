package top.wangruns.trackstacking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.UserService;
import top.wangruns.trackstacking.utils.ReturnMsg;
import top.wangruns.trackstacking.utils.SendEmail;

@Controller
public class RegisterController {
	@Autowired
	private UserService userService;
	
	
	@PostMapping(value = "getValidateCode.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getValidateCode(HttpServletRequest request,String email) {
		System.out.println("getValidateCode: "+email);
		//邮箱是否已经存在
		boolean isExisted=userService.isEmailExisted(email);
		System.out.println(isExisted);
		if(isExisted) {
			return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "该用户已存在");
		}
		String code=(int)(Math.random()*10000)+"";
		boolean isSuccessful=SendEmail.sendemail("邮箱验证", "您的验证码为："+code, email);
		if(isSuccessful) {
			request.getSession().setAttribute("code", email);
			return ReturnMsg.msg(HttpServletResponse.SC_OK, "发送成功");
		}else {
			return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "发送失败");
		}
	}

}
