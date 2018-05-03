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

}
