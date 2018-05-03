package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.PlayRecord;

public interface RecordPlayService {

	/**
	 * 记录当前用户的播放记录
	 * @param request
	 * HttpServletRequest
	 * @param songId
	 * 歌曲Id
	 */
	void recordPlay(HttpServletRequest request, int songId);

	/**
	 * 获取所有用户的播放记录
	 * @return
	 * 若没有，则返回空
	 */
	List<PlayRecord> getAllRecords();

}
