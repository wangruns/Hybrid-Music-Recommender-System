package top.wangruns.trackstacking.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Role;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.UserService;
import top.wangruns.trackstacking.utils.Request;


@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public boolean findLogin(User u) {
		boolean isUserExisted=false;
		User result = userDao.selectByUser(u);
		if(result!=null) {
			isUserExisted=true;
		}
		return isUserExisted;
	}

	public boolean isEmailExisted(String email) {
		boolean isEmailExisted=false;
		User result  = userDao.selectByEmail(email);
		if(result!=null) {
			isEmailExisted=true;
		}
		return isEmailExisted;
	}

	public boolean insert(User u) {
		boolean isInsertSuccessful=false;
		int affectedRows=userDao.insert(u);
		if(affectedRows>0) {
			isInsertSuccessful=true;
		}
		return isInsertSuccessful;
	}

	public List<User> getAllRecords() {
		return userDao.selectAll();
	}

	public List<Integer> getAllUserIdRecords() {
		return userDao.selectAllUserId();
	}

	public boolean isHasPrivilege(HttpServletRequest request) {
		boolean isHasPrivilege=false;
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		if(user==null) {
			return isHasPrivilege;
		}
		Role role=userDao.selectRoleByUserId(user.getUserId());
		if(role!=null) {
			isHasPrivilege=true;
		}
			
		return isHasPrivilege;
	}

	public void batchDeleteById(int[] userIds) {
		if(userIds==null) {
			return;
		}
		userDao.deleteByIds(userIds);
		
	}

	public boolean tooQuickly(HttpServletRequest request, int minutes) {
		//第一次操作
		if(request.getSession().getAttribute("lastTime")==null) {
			request.getSession().setAttribute("lastTime", new SimpleDateFormat("mm").format(new Date()));
			return false;
		}
		//第二次及其以上的操作
		String lastMinute=(String) request.getSession().getAttribute("lastTime");
		String curMinute=new SimpleDateFormat("mm").format(new Date());
		
		if( Math.abs(Integer.valueOf(curMinute)- Integer.valueOf(lastMinute)) <=minutes) {
			return true;
		}
		request.getSession().setAttribute("lastTime",curMinute);
		return false;
	}

}
