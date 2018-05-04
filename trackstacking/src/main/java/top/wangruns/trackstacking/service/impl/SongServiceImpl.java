package top.wangruns.trackstacking.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.SongDao;
import top.wangruns.trackstacking.service.SongService;

@Service("songService")
public class SongServiceImpl implements SongService{
	@Autowired
	private SongDao songDao;

	public List<Integer> getAllSongIdRecords() {
		return songDao.selectAllSongId();
	}

}
