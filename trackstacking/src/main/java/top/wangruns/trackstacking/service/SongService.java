package top.wangruns.trackstacking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import top.wangruns.trackstacking.model.Song;

public interface SongService {

	/**
	 * 获取所有的歌曲Id记录
	 * @return
	 * 若没有，则返回null
	 */
	public List<Integer> getAllSongIdRecords();

	/**
	 * 根据歌曲Id获取歌曲的信息
	 * @param songId
	 * @return
	 * 若没有，则返回null
	 */
	public Song getSongById(int songId);

	/**
	 * 根据歌曲Id获取歌曲的信息，并加上是否收藏的标记
	 * @param request
	 * @param songId
	 * @return
	 */
	public Song getSongByIdWithCollectionFlag(HttpServletRequest request, int songId);

	/**
	 * 批量删除，根据数组里面的Id删除对应的歌曲
	 * @param request
	 * @param reviewIds
	 */
	public void batchDeleteById(HttpServletRequest request,int[] songIds);

	/**
	 * 检验歌曲文件，歌词文件的格式
	 * @param song
	 * MultipartFile 歌曲文件
	 * @param lyric
	 * MultipartFile 歌词文件
	 * @return
	 * 如果符合要求，返回true
	 */
	public boolean checkFormat(MultipartFile song, MultipartFile lyric);

	/**
	 * 添歌曲记录，根据上传的歌曲文件和歌词文件
	 * @param request 
	 * HttpServletRequest
	 * @param song
	 * MultipartFile 歌曲文件
	 * @param lyric
	 * MultipartFile 歌词文件
	 * @return
	 * 如果添加成功返回true
	 */
	public boolean addSong(HttpServletRequest request, MultipartFile song, MultipartFile lyric);

	/**
	 * 获取所有具有歌词的歌曲信息
	 * @return
	 * 如果没有，返回null
	 */
	public List<Song> getAllSongRecordsWithLyric();

}
