package top.wangruns.trackstacking.dao;

import java.util.List;

import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.TrendingSong;

public interface NewTrackOnShelfDao {

	/**
	 * 查询当前新歌曲
	 * @return
	 * 若没有新歌曲，则返回null
	 */
	List<TrendingSong> selecNewSong();

}
