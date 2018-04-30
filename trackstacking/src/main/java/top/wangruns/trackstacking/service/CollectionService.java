package top.wangruns.trackstacking.service;

import javax.servlet.http.HttpServletRequest;

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

}
