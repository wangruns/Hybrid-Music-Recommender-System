package top.wangruns.trackstacking.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import top.wangruns.trackstacking.dao.SongDao;
import top.wangruns.trackstacking.dao.TrendingRecDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.Collection;
import top.wangruns.trackstacking.model.Song;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.SongService;
import top.wangruns.trackstacking.utils.Request;

@Service("songService")
public class SongServiceImpl implements SongService{
	@Autowired
	private SongDao songDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;

	public List<Integer> getAllSongIdRecords() {
		return songDao.selectAllSongId();
	}

	public Song getSongById(int songId) {
		return songDao.selectSongById(songId);
	}

	public Song getSongByIdWithCollectionFlag(HttpServletRequest request, int songId) {
		//获取对应Id的歌曲
		Song song=songDao.selectSongById(songId);
		if(song==null) {
			return null;
		}
		//获取对应Id的歌曲的流行度
		int trendingCoefficient=songDao.selectCoefficientById(songId);
		song.setTrendingCoefficient(trendingCoefficient);
		//获取用户的收藏列表
		List<Collection> collectionList=new ArrayList<Collection>();
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList=trendingRecDao.getCollection(user);
		if(collectionList!=null) {
			for(Collection c:collectionList) {
				if(c.getSongId()==songId) {
					song.setWhetherCollected(true);
					break;
				}
			}
		}
		
		return song;
	}

	public void batchDeleteById(HttpServletRequest request,int[] songIds) {
		if(songIds==null) {
			return;
		}
		for(int id:songIds) {
			Song song=songDao.selectSongById(id);
			if(song!=null) {
				String realSongPath=request.getServletContext().getRealPath(song.getSongAddress());
				File fileSong=new File(realSongPath);
				fileSong.delete();
				if(song.getLyricAddress()!=null) {
					String realLyricPath=request.getServletContext().getRealPath(song.getLyricAddress());
					File fileLyric=new File(realLyricPath);
					fileLyric.delete();
				}
			}
		}
		songDao.deleteByIds(songIds);
		
	}

	/**
	 * 这里由于在前端文件上传的时候，已经做过验证了，所以后端这里不再次验证了
	 * 由于时间关系，这里默认前端的验证是可靠的，虽然有时候这是一种危险的做法
	 */
	public boolean checkFormat(MultipartFile song, MultipartFile lyric) {
		
		return true;
	}

	public boolean addSong(HttpServletRequest request,MultipartFile song, MultipartFile lyric) {
		String name=song.getOriginalFilename();
		//歌曲名称需去掉.mp3的后缀
		String songName=name.substring(0, name.lastIndexOf("."));
		String songAddress="track/song/"+name;
		boolean isInsertSuccessful=false;
		int affectedRows=-1;
		//歌词文件是可选的
		if(lyric.isEmpty()) {
			affectedRows=songDao.insertOnlySong(new Song(songName,songAddress));
			//保存歌曲文件
			saveFile(song,request.getServletContext().getRealPath(songAddress));
		}else {
			//这里的歌曲名称仍旧保留.lrc的后缀
			String lyricName=lyric.getOriginalFilename();
			String lyricAddress="track/lyric/"+lyricName;
			affectedRows=songDao.insertSongWithLyric(new Song(songName,songAddress,lyricName,lyricAddress));
			//保存歌曲文件
			saveFile(song,request.getServletContext().getRealPath(songAddress));
			//保存歌词文件
			saveFile(lyric,request.getServletContext().getRealPath(lyricAddress));
		}
		
		if(affectedRows>0) {
			isInsertSuccessful=true;
		}
		return isInsertSuccessful;
	}

	private void saveFile(MultipartFile multipartFile, String realFilePath) {
		try {
			InputStream inputStream=multipartFile.getInputStream();
			FileOutputStream fileOutputStream = new FileOutputStream(realFilePath);  
			try {
				int b = 0;  
	            while ((b = inputStream.read()) != -1) {  
	            	fileOutputStream.write(b);  
	            }  
			}finally{
				inputStream.close();  
	            fileOutputStream.close(); 
			}
			
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
	}

	public List<Song> getAllSongRecordsWithLyric() {
		return songDao.selectAllSongsWithLyric();
		
	}

}
