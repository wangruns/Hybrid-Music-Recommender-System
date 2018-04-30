package top.wangruns.trackstacking.service;

import javax.servlet.http.HttpServletRequest;

public interface RecordDownloadService {

	/**
	 * 记录当前登录用户的下载记录，若没有登入则直接返回
	 * @param request
	 * HttpServletRequest
	 * @param songId
	 * 歌曲Id
	 */
	void recordDownload(HttpServletRequest request, int songId);

}
