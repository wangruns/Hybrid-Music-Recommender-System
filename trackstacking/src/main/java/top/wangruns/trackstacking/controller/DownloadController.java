package top.wangruns.trackstacking.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import top.wangruns.trackstacking.service.RecordDownloadService;

@Controller
public class DownloadController {
	@Autowired
	private RecordDownloadService recordDownloadService;
	
	@RequestMapping(value = "download.do", method = { RequestMethod.GET})
	public void download(HttpServletRequest request,HttpServletResponse response,String songAddress,int songId) throws IOException {
		//对于登录用户，记录其下载记录
		recordDownloadService.recordDownload(request, songId);
		
		response.setContentType("audio/mp3");  
		response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(System.currentTimeMillis()+"如果不想返回名称的话.mp3", "utf8"));
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
		InputStream bis=null;
		if(songAddress.contains("http")) {
			//在另外服务器的文件
			URL url = new URL(songAddress);  
            URLConnection uc = url.openConnection();  
			bis=new BufferedInputStream(uc.getInputStream());
		}else {
			//在服务器内部的文件
			songAddress=request.getServletContext().getRealPath(songAddress);
			bis = new BufferedInputStream(new FileInputStream(new File(songAddress)));
		}
		int len = 0;  
		while((len = bis.read()) != -1){  
            out.write(len);  
            out.flush();  
        }  
		out.close();
		bis.close();
		
	}


}
