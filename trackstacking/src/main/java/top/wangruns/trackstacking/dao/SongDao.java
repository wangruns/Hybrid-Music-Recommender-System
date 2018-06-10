package top.wangruns.trackstacking.dao;

import java.util.List;

import top.wangruns.trackstacking.model.Song;

public interface SongDao {

	/**
	 * 获取所有歌曲Id记录
	 * @return
	 * 若没有，则返回null
	 */
	List<Integer> selectAllSongId();

	/**
	 * 查询歌曲信息，根据其Id
	 * @param songId
	 * @return
	 */
	Song selectSongById(int songId);

	/**
	 * 查询歌曲的流行度，根据其Id
	 * @param songId
	 * @return
	 */
	int selectCoefficientById(int songId);

	/**
	 * 批量删除，根据数组里面的Id删除对应的歌曲
	 * @param userIds
	 */
	void deleteByIds(int[] songIds);

	/***
	 * 插入单纯的歌曲(歌曲名称|歌曲地址)
	 * @param song
	 * @return
	 * 若插入成功返回1,否则返回0,即返回受影响的行数
	 */
	int insertOnlySong(Song song);

	/**
	 * 插入带歌词信息的歌曲(歌曲名称|歌曲地址|歌词名称|歌曲地址)
	 * @param song
	 * @return
	 */
	int insertSongWithLyric(Song song);

	/**
	 * 获取所有具有歌词的歌曲信息
	 * @return
	 * 若没有，则返回null
	 */
	List<Song> selectAllSongsWithLyric();

}
