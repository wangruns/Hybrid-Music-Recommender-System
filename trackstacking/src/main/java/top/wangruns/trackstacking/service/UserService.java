package top.wangruns.trackstacking.service;

import java.util.List;

import top.wangruns.trackstacking.model.User;

public interface UserService {
	

	/**
	 * 根据帐号和密码查找用户
	 * @param u
	 * 帐号和密码被实例化的User
	 * @return
	 * 若找到返回true
	 */
	public boolean findLogin(User u);

	/**
	 * 检验指定的邮箱帐号是否存在
	 * @param email
	 * 邮箱帐号
	 * @return
	 * 若存在返回true
	 */
	public boolean isEmailExisted(String email);

	/**
	 * 向user用户表中插入新的记录
	 * @param u
	 * 用户User对象
	 * @return
	 * 若插入成功返回true
	 */
	public boolean insert(User u);

	/**
	 * 获取所有的用户记录
	 * @return
	 * 若没有，则返回null
	 */
	public List<User> getAllRecords();

	/**
	 * 获取所有的用户Id记录
	 * @return
	 * 若没有，则返回null
	 */
	public List<Integer> getAllUserIdRecords();

}
