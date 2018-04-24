package top.wangruns.trackstacking.service;

import top.wangruns.trackstacking.model.User;

public interface UserService {
	

	/**
	 * 根据帐号和密码查找用户
	 * @param u
	 * 帐号和密码被实例化的User
	 * @return
	 * 从数据库中查找的结果
	 */
	public User findLogin(User u);

}
