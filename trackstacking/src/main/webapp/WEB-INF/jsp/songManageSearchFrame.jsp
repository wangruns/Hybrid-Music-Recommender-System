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
  
    <div class="container">
      	<h1></h1>
      	<h3>搜索结果 ${oneDayOneWord}</h3>
      	
      	<c:if test="${not empty songManageSearchList}">
      	<div>
 	    		<button id="deleteSelectId" class="btn btn-outline-success my-2 my-sm-0">删除选中</button>
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
	});
	</script>

  </body>
</html>
