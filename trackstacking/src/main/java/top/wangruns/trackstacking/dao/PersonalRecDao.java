package top.wangruns.trackstacking.dao;

import java.util.List;

import top.wangruns.trackstacking.model.TrendingSong;
import top.wangruns.trackstacking.model.User;

public interface PersonalRecDao {

	/**
	 * 从表A中获取当前用户的个性化推荐列表
	 * @param user 
	 * @return
	 * 初始化为随机歌曲列表
	 */
	List<TrendingSong> selectPersonalRecFromA(User user);

	/**
	 * 从表B中获取当前用户的个性化推荐列表
	 * @param user 
	 * @return
	 * 初始化为随机歌曲列表
	 */
	List<TrendingSong> selectPersonalRecFromB(User user);

	/**
	 * 像reca表中插入数据
	 * @param userId
	 * 用户id
	 * @param songId
	 * 歌曲id
	 */
	void insertRecA(int userId, int songId);

	/**
	 * 像recb表中插入数据
	 * @param userId
	 * 用户id
	 * @param songId
	 * 歌曲id
	 */
	void insertRecB(int userId, int songId);

	/**
	 * 根据id从recB表中删除数据
	 * @param userId
	 */
	void deleteBByUserId(int userId);
	
	/**
	 * 根据id从recA表中删除数据
	 * @param userId
	 */
	void deleteAByUserId(int userId);

}
