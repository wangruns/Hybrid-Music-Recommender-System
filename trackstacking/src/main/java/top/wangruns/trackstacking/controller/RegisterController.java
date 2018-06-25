package top.wangruns.trackstacking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.PersonalRecService;
import top.wangruns.trackstacking.service.UserService;
import top.wangruns.trackstacking.utils.ReturnMsg;
import top.wangruns.trackstacking.utils.SendEmail;

@Controller
public class RegisterController {
	@Autowired
	private UserService userService;
	@Autowired
	private PersonalRecService personalRecService;
	
	
	@PostMapping(value = "getValidateCode.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getValidateCode(HttpServletRequest request,String email) {
		//邮箱是否已经存在
		boolean isExisted=userService.isEmailExisted(email);
		if(isExisted) {
			return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "该用户已存在");
		}
		//防止疯狂发送...，这里简单的限制一下1分钟只发发送一次
		if(userService.tooQuickly(request,1)) {
			return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "发送频率太快");
		}
		String code=(int)(Math.random()*10000)+"";
//		boolean isSuccessful=SendEmail.sendemail("邮箱验证", "您的验证码为："+code, email);
		String content="Welcome to Track Stacking, your email verified code is："+code+"\n\n"+"Sincerely,";
		boolean isSuccessful=SendEmail.sendemail("Email Validation", content, email);
		if(isSuccessful) {
			request.getSession().setAttribute("code", code);
			return ReturnMsg.msg(HttpServletResponse.SC_OK, "发送成功");
		}else {
			return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "发送失败");
		}
	}
	
	
	@PostMapping(value = "register.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String register(HttpServletRequest request,User u) {
		//验证码是否正确
		String code=(String) request.getSession().getAttribute("code");
		if(code==null || !code.equals(u.getValidateCode())) {
			return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "验证码错误");
		}
		boolean isInserted=userService.insert(u);
		if(isInserted) {
			request.getSession().setAttribute("user", u);
			/**
			 * 用户注册成功时，初始化个性化推荐列表
			 */
			personalRecService.initializePersonalRecList(request);
			return ReturnMsg.msg(HttpServletResponse.SC_OK, JSONObject.toJSON(u).toString());
		}else {
			return ReturnMsg.msg(HttpServletResponse.SC_BAD_REQUEST, "注册失败");
		}
	}

}
