package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.DownloadRecord;

public interface RecordDownloadService {

	/**
	 * 记录当前登录用户的下载记录，若没有登入则直接返回
	 * @param request
	 * HttpServletRequest
	 * @param songId
	 * 歌曲Id
	 */
	void recordDownload(HttpServletRequest request, int songId);

	/**
	 * 获取用户的下载记录
	 * @return
	 * 如果没有，则返回null
	 */
	List<DownloadRecord> getAllRecords();

}
