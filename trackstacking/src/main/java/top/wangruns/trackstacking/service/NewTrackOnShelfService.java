package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.TrendingSong;

public interface NewTrackOnShelfService {

	/**
	 * 获取当前的新碟歌曲,并加上是否以及被收藏标记
	 * @param request
	 * @return
	 */
	List<TrendingSong> getNewTrackWithCollectionFlag(HttpServletRequest request);

}
