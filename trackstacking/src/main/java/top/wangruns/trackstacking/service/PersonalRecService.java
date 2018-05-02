package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.TrendingSong;

public interface PersonalRecService {

	/**
	 * 获取当前用户每天的个性化推荐音乐列表，并带上是否已经收藏的标记.
	 * 每天早上6点更新一次
	 * @param request
	 * HttpServletRequest
	 * @return
	 */
	List<TrendingSong> getPersonalDailyRecWithCollectionFlag(HttpServletRequest request);

}
