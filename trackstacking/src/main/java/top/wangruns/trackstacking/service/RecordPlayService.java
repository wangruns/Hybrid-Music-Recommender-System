package top.wangruns.trackstacking.service;

import javax.servlet.http.HttpServletRequest;

public interface RecordPlayService {

	/**
	 * 记录当前用户的播放记录
	 * @param request
	 * HttpServletRequest
	 * @param songId
	 * 歌曲Id
	 */
	void recordPlay(HttpServletRequest request, int songId);

}
