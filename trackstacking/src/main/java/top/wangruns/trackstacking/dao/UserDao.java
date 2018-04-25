package top.wangruns.trackstacking.dao;

import top.wangruns.trackstacking.model.User;

public interface UserDao {

	/**
	 * 根据某个用户的email和password进行查询
	 * @param u
	 * 用户User对象
	 * @return
	 * 若查询成功返回查询到的对象，否则返回null
	 */
	public User selectByUser(User u);

	/**
	 * 根据某个email记录进行查询
	 * @param email
	 * 邮箱帐号
	 * @return
	 * 若查询成功返回查询到的对象，否则返回null
	 */
	public User selectByEmail(String email);

	/**
	 * 向user用户表中插入新的记录
	 * @param u
	 * 用户User对象
	 * @return
	 * 若插入成功返回1,否则返回0,即返回受影响的行数
	 */
	public int insert(User u);
	

}
