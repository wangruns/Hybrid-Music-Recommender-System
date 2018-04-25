package top.wangruns.trackstacking.dao;

import top.wangruns.trackstacking.model.User;

public interface UserDao {

	
	public User findLogin(User u);

	public int numberOfEmail(String email);

	public String isEmailExisted(String email);
	

}
