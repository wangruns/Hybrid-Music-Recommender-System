package top.wangruns.trackstacking.utils;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.User;

public class Request {
	
	public static User getUserFromHttpServletRequest(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("user");
	}

}
