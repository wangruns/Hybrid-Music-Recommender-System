package top.wangruns.trackstacking.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.wangruns.trackstacking.dao.RecordPlayDao;
import top.wangruns.trackstacking.dao.UserDao;
import top.wangruns.trackstacking.model.PlayRecord;
import top.wangruns.trackstacking.model.User;
import top.wangruns.trackstacking.service.RecordPlayService;
import top.wangruns.trackstacking.utils.Request;

@Service("recordPlayService")
public class RecordPlayServiceImpl implements RecordPlayService{
	@Autowired
	private UserDao userDao;
	@Autowired
	private RecordPlayDao recordPlayDao;
	

	public void recordPlay(HttpServletRequest request, int songId) {
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		recordPlayDao.insert(new PlayRecord(user.getUserId(),songId));
		
	}


	public List<PlayRecord> getAllRecords() {
		return recordPlayDao.selectAll();
	}
	

}
