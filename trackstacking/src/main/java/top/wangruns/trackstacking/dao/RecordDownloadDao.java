package top.wangruns.trackstacking.dao;

import top.wangruns.trackstacking.model.DownloadRecord;

public interface RecordDownloadDao {

	/**
	 * 添加新下载记录
	 * @param downloadRecord
	 */
	void insert(DownloadRecord downloadRecord);

}
