package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.Collection;

public interface CollectionService {

	/**
	 * 改变当前用户对某个歌曲的收藏状态
	 * @param request
	 * HttpServletRequest对象
	 * @param songId
	 * 需要改变收藏状态的歌曲Id
	 * @return
	 * 若改变后状态为收藏，则返回true
	 */
	boolean collectionChange(HttpServletRequest request, int songId);

	/**
	 * 获取所有用户的收藏记录
	 * @return
	 * 若没有，则返回null
	 */
	List<Collection> getAllRecords();

}
