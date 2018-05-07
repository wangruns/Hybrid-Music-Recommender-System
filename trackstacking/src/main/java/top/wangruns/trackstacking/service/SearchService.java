package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.TrendingSong;

public interface SearchService {

	/**
	 * 根据关键词，查询歌词信息，并加上是否收藏标记
	 * @param request
	 * HttpServletRequest
	 * @param keyword
	 * 搜索关键词
	 * @return
	 * 若没有结果，返回list.size()=0
	 */
	List<TrendingSong> getSearchSongWithCollectionFlag(HttpServletRequest request, String keyword);

}
