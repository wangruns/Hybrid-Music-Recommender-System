package top.wangruns.trackstacking.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.UserService;


@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public User findLogin(User u) {
		User user = userDao.findLogin(u);
		return user;
	}

}
