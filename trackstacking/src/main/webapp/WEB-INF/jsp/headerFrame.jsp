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
  
  <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.do">Track Stacking</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item" id="exploringId">
              <a class="nav-link" href="#">发现音乐</a>
            </li>
            <li class="nav-item" id="rankingId">
              <a class="nav-link" href="#">排行榜</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" onclick="myMusicPage()">我的音乐</a>
            </li>
          </ul>
          <form class="form-inline mt-2 mt-md-0" action="${pageContext.request.contextPath}/search.do" id="searchFormId">
            <input class="form-control mr-sm-2" type="text" placeholder="音乐" aria-label="Search" name="keyword" required autofocus oninvalid="this.setCustomValidity('搜索内容不能为空')"
 oninput="setCustomValidity('')">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
          </form>
          <ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown" <c:if test="${sessionScope.user!=null}">style="display:none;"</c:if>><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button"  aria-haspopup="true"
					aria-expanded="false" data-toggle="modal" data-target="#SignInModalCenter"> 登录 </a>
					</li> 
				<li class="nav-item dropdown" <c:if test="${sessionScope.user!=null}">style="display:none;"</c:if>><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button"  aria-haspopup="true"
					aria-expanded="false" data-toggle="modal" data-target="#SignUpModalCenter"> 注册 </a>
					</li> 
			</ul>
			<ul class="navbar-nav">
				<li id="logout" class="nav-item " <c:if test="${sessionScope.user==null}">style="display:none;"</c:if>><a
					class="nav-link " href="${pageContext.request.contextPath}/logout.do" 
					role="button"> 退出 </a>
					</li>
			</ul>
        </div>
      </nav>
      
    <script>
	$(function(){
		//search page
		$("#searchFormId").submit(function(){
			$('#hot').load("searchFrameLoad.do",$('#searchFormId').serialize() );
			$("#playerId").show();
	        return false;
		});
		//new track on shelf rec
		$('#newTrackOnShelfId').on('click', function (e) {
			$('#hot').load("newTrackOnShelfFrameLoad.do");
			$("#playerId").show();
		});
		//ranking page;
		$('#rankingId').on('click', function (e) {
			$('#hot').load("rankingFrameLoad.do");
			$("#playerId").show();
		});
		//explorin(trending rec)
		$('#exploringId,#trendingRecId').on('click', function (e) {
			$('#hot').load("trendingRecFrameLoad.do");
			$("#playerId").show();
		});
		//personalized rec
		$('#personalizedRecId').on('click', function (e) {
			$('#hot').load("personalizedRecFrameLoad.do");
			$("#playerId").show();
		});
		
	});
	</script>
      
  </body>
</html>
