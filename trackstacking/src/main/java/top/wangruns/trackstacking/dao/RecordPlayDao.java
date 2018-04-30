package top.wangruns.trackstacking.dao;

import top.wangruns.trackstacking.model.PlayRecord;

public interface RecordPlayDao {

	/***
	 * 添加新的播放记录
	 * @param playRecord
	 */
	void insert(PlayRecord playRecord);

}
