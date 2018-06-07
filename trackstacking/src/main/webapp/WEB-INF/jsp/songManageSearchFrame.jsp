<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <title>Track Stacking</title>
	
  </head>
  <body>
  
  	<!-- 添加歌曲Modal -->
	<div class="modal fade" id="addSongModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">添加歌曲</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	       
	        <form class="form-signin" id="addSongFormId" enctype="multipart/form-data" method="post">
		      <h5 class="h5 mb-3 font-weight-normal">歌曲</h5>
		      <div class="input-group mb-2">
				  <div class="custom-file">
				    <input type="file" id="fileSongId" class="custom-file-input" id="inputGroupFile01" name="song" onchange="loadFile(this.files[0],'songHintId')">
				    <label id="songHintId" class="custom-file-label" for="inputGroupFile01">选择歌曲文件/mp3</label>
				  </div>
			  </div>
			  <h5 class="h5 mb-3 font-weight-normal">歌词(可选)</h5>
			  <div class="input-group mb-2">
				  <div class="custom-file">
				    <input type="file" id="fileLyricId" class="custom-file-input" id="inputGroupFile02" name="lyric" onchange="loadFile(this.files[0],'lyricHintId')">
				    <label id="lyricHintId" class="custom-file-label" for="inputGroupFile01">选择歌词文件/lrc</label>
				  </div>
			  </div>
			  
			  <div class="collapse" id="collapse-file-error-hint">
					<div class="card card-body">帐号或者密码错误</div>
			  </div>
			  <button class="btn btn-lg btn-primary btn-block" type="submit" >确定</button>
		    </form>
		    
	      </div>
	    </div>
	  </div>
	</div><!-- 添加歌曲 End-->
	
  
    <div class="container">
      	<h1></h1>
      	<h3>搜索结果 ${oneDayOneWord}</h3>
      	
      	<c:if test="${not empty songManageSearchList}">
      	<div>
 	    		<button id="deleteSelectId" class="btn btn-outline-success my-2 my-sm-0">删除选中</button>
 	    		<button id="addSongBtnId" class="btn btn-outline-success my-2 my-sm-0 margin-left-m" aria-haspopup="true" aria-expanded="false" data-toggle="modal" data-target="#addSongModalCenter">添加</button>
      	</div>
      	</c:if>
      	
      	<div class="row content hot-content">
      	    <!-- 前DIV -->
      	    <div class="col-sm-1">
      	        <!-- 小跳动特效框 -->
      	    	<div class=" ">
                        <span class="musicbar animate bg-empty inline m-r-lg m-t" style="width:50px;height:60px">
                          <span class="bar1 a3 lter"></span>
                          <span class="bar2 a5 lt"></span>
                          <span class="bar3 a1 bg"></span>
                          <span class="bar4 a4 dk"></span>
                          <span class="bar5 a2 dker"></span>
                        </span>
                </div><!-- 小跳动特效框 End-->
      	    </div><!-- 该前DIV为了中DIV居中 -->
      	    
      		<!--中DIV 歌曲部分-->
             <div class="col-sm-10">
            	<h6>&nbsp;</h6>
            	<h3 class="border-line-delete">歌曲管理</h3>
            	<div class="container">
            		<div class="row content">
            		
            			<table class="table table-striped">
            				<thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">歌曲ID</th>
							      <th scope="col">歌曲名称</th>
							      <th scope="col">歌曲地址</th>
							    </tr>
							 </thead>
							 <tbody>
								 <c:forEach items="${songManageSearchList}" var="song" varStatus="status">
								    <tr>
								      <th scope="row">${status.index+1}<input type="checkbox" value="${song.songId}" aria-label="Checkbox for following text input"></th>
								      <td>${song.songId}</td>
								      <td>${song.songName}</td>
								      <td>${song.songAddress}</td>
								    </tr>
							   	 </c:forEach>
							 </tbody>
            			</table>
            			
            		</div>
            	</div><!-- container  End-->
            	
              </div><!-- 中DIV End-->
   			 <!-- 后DIV -->
   			 <div class="col-sm-1"></div><!-- 该后DIV为了中DIV居中 -->
   			 
      	</div>
		
	  </div><!-- /.container -->
	  
	  <script>
	  $(function(){
		//处理删除选中
		$('#deleteSelectId').on('click', function (e) {
			var selectedIds = [];
			$('input:checkbox:checked').each(function() {
				selectedIds.push($(this).val());
	         });
			//删除
			var data = {        
			        "songIds": selectedIds,
			 };
		    url = "deleteSong.do";
		    $.ajax({
		    	//traditional: true[https://www.cnblogs.com/ybyi/p/6297600.html]
		    	traditional: true,
		        type:"POST",
		        url:url,
		        data:data
		    });
		    //删除后变成禁止选中状态
		    $('input:checkbox:checked').each(function() {
                $(this).attr("disabled", "disabled");
			});
		});
		
		//处理上传
		var  maxSongSize=1024*1024*10;//文件最大10M
		var  maxLyricSize=1024*10;//文件最大10K
		var songFormat=["mp3"];
		var lyricFormat=["lrc"];
	    $("#addSongFormId").submit(function(){
			var song=$('#fileSongId').get(0).files[0];
	        var lyric=$('#fileLyricId').get(0).files[0];
	        //判定格式
	        if(song==null){
	        	$('#collapse-file-error-hint').html("请选择歌曲文件");
            	$('#collapse-file-error-hint').collapse();return false;
	        }else if(song.size>maxSongSize || (lyric!=null&&lyric.size>maxLyricSize) ){
	        	$('#collapse-file-error-hint').html("超出文件最大限制");
            	$('#collapse-file-error-hint').collapse();return false;
	        }else if(songFormat.indexOf(song.name.substr(song.name.lastIndexOf(".")+1) )==-1){
	        	$('#collapse-file-error-hint').html("歌曲文件格式不对");
            	$('#collapse-file-error-hint').collapse();return false;
	        }else if(lyric!=null && lyricFormat.indexOf(lyric.name.substr(lyric.name.lastIndexOf(".")+1) )==-1){
	        	$('#collapse-file-error-hint').html("歌词文件格式不对");
            	$('#collapse-file-error-hint').collapse();return false;
	        }else {
	        }
	       //提交
	        url = "addSong.do";
	        /**
	         *	var data=$('#addSongFormId').serialize();
	         *	序列化的方式，在表单里面与文件的时候就不行了，可以用FormData对象
	         */
	       var data = new FormData(document.getElementById("addSongFormId"));
	       //var data = new FormData($('#addSongFormId'));
	       $.ajax({
	            type:"POST",
	            url:url,
	            data:data,
	            processData:false,
	            contentType:false,
	            success:function(data){
	            	var res=JSON.parse(data);
	                if(res.status==200){
	                	$('#collapse-file-error-hint').html(res.msg);
	                	$('#collapse-file-error-hint').collapse()
	                    $("#addSongModalCenter").modal('hide');
	                }else{
	                	$('#collapse-file-error-hint').html(res.msg);
	                	$('#collapse-file-error-hint').collapse()
	                }
	            }
	        }); 
	        return false;
	        
		});//处理上传 End
		
	});
	//覆盖标签来显示文件名称
	function loadFile(file,fileHintId){
		$("#"+fileHintId).html(file.name);
	}
	  
	</script>

  </body>
</html>
