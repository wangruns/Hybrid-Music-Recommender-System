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

    <title>我的音乐</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css" >
	
	<!-- Animate CSS https://daneden.github.io/animate.css/-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css" >
	<!-- simple-line-icons CSS http://www.bootcdn.cn/simple-line-icons/-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple-line-icons.css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/player.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont/iconfont.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/audio.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cool.css">
	
	<style>
	body{
		padding-bottom: 6rem;
	}
	</style>
	
  </head>
  <body>
  
 	<!-- 登录Modal -->
	<div class="modal fade" id="SignInModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">登录</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	       
	        <form class="form-signin" id="login-submit">
		      <!-- <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
		      <h1 class="h3 mb-3 font-weight-normal">请输入帐号和密码</h1>
		      <label for="inputEmail" class="sr-only">Email address</label>
		      <input type="email" id="inputEmail" class="form-control" placeholder="邮箱帐号" required autofocus oninvalid="this.setCustomValidity('请输入正确的邮箱')"
 oninput="setCustomValidity('')">
		      <label for="inputPassword" class="sr-only">Password</label>
		      <input type="password" id="inputPassword" class="form-control" placeholder="密码" required oninvalid="this.setCustomValidity('密码不能为空')"
 oninput="setCustomValidity('')">
		      
		      <div class="collapse" id="collapse-error-hint">
					<div class="card card-body">帐号或者密码错误</div>
				</div>
		      
		      <div class="checkbox mb-3">
		        <label>
		          <input type="checkbox" value="remember-me"> 记住我
		        </label>
		      </div>
			  <button class="btn btn-lg btn-primary btn-block" type="submit" >登录</button>
		      <!-- <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p> -->
		    </form>
	        
	      </div>
	      <!-- <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary">确定</button>
	      </div> -->
	    </div>
	  </div>
	</div><!-- 登录Modal End-->
	
	<!-- 注册Modal -->
	<div class="modal fade" id="SignUpModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitleSignUp">注册</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	       
	        <form class="form-signin" id="register-submit">
		      <!-- <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
		      <h1 class="h3 mb-3 font-weight-normal">请输入帐号和密码</h1>
		      <label for="inputEmail" class="sr-only">Email address</label>
		      <input type="email" id="inputEmail-signup" class="form-control" placeholder="邮箱帐号" required autofocus oninvalid="this.setCustomValidity('请输入正确的邮箱')"
 oninput="setCustomValidity('')">
		     
		      <button type="button"  class="btn btn-md btn-primary" id="get-validate-code">获取验证码</button>
		      <input type="number" class="form-control" id="validate-code-signup" placeholder="验证码" required oninvalid="this.setCustomValidity('请输入验证码')"
 oninput="setCustomValidity('')"> 
		      
		      <label for="inputPassword" class="sr-only">Password</label>
		      <input type="password" id="inputPassword-signup" class="form-control" placeholder="密码" required oninvalid="this.setCustomValidity('密码不能为空')"
 oninput="setCustomValidity('')">
		      
		      <label for="inputPasswordAgain" class="sr-only">Password Again</label>
			  <input type="password" id="inputPasswordAgain-signup" class="form-control" placeholder="再次输入密码" required oninvalid="this.setCustomValidity('密码不能为空')"
			 oninput="setCustomValidity('')">
		      
		      <div class="collapse" id="collapse-error-hint-signup">
					<div class="card card-body">两次密码不一致</div>
			 	</div>
		      
			  <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
		      <!-- <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p> -->
		    </form>
	        
	      </div>
	      <!-- <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary">确定</button>
	      </div> -->
	    </div>
	  </div>
	</div><!-- 注册Modal End-->

    <header>
      <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.do">Track Stacking</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/trendingRecPage.do">发现音乐 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/rankingPage.do">排行榜</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="#">我的音乐</a>
            </li>
          </ul>
           <form class="form-inline mt-2 mt-md-0" action="${pageContext.request.contextPath}/search.do">
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
    </header>

    <%--main --%>
	  <!-- 页面滑动 -->
      
      <div class="container" id="hot">
      	<h1></h1>
      	<h3>我的音乐 ${oneDayOneWord}</h3>
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
            <div class="col-sm-10 h-item" id="mytest"><!-- 中DIV -->
      		  <!-- One of three columns -->
      			

		<div class="row">
		  <div class="col-4">
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">我的收藏</a>
		      <a class="list-group-item list-group-item-action " id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">最近播放</a>
		    </div>
		  </div>
		  <div class="col-8">
			    <div class="tab-content" id="nav-tabContent">
			      <!-- 我的收藏 -->
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      		  <ul class="list-group list-group-flush" >
							<c:forEach items="${myCollectionList}" var="song" varStatus="status">
			                      <li class="list-group-item list-group-item-light " idd="${song.songId}" title="${song.songName}">
			                      	<!-- 歌曲信息区 -->
			                      	<div class="clear text-ellipsis">
			                          <span>${status.index+1}.${song.songName}</span>
			                          <span class="text-muted"> -- _ _ -- </span>
			                          <span class="text-danger icon-fire"></span>
			                        </div>
			                        <!-- 播放控制区 downloadFun(${song.songAddress})-->
			                        <div class="pull-right m-l fr">
				                        <a href="javascript:;" class="play m-r-sm" title="播放" onclick="playFunc(${song.songId})" id="play${song.songId}" name="${song.songName}" address="${song.songAddress}">
				                          <i class="icon-control-play text  "></i>
				                          <!-- <i class="icon-control-pause text-active"></i> -->
				                        </a>
				                        <a href="${pageContext.request.contextPath}/download.do?songAddress=${song.songAddress}&songId=${song.songId}" class="m-r-sm" title="下载"><i class="icon-cloud-download"></i></a>
				                         <a href="javascript:;"
				                         <c:choose>
				                         	<c:when test="${song.whetherCollected}">class="collect m-r-sm text-danger"</c:when>
				                         	<c:otherwise>class="collect m-r-sm"</c:otherwise>
				                         </c:choose>
				                         <%-- <c:if test="${song.whetherCollected}">class="collect m-r-sm text-danger" </c:if> --%>
				                         onclick="collectFunc(${song.songId})" id="${song.songId}" title="喜欢"><i class="icon-heart"></i>
				                         </a>
			                        </div>
			                      </li>
			                   </c:forEach>
			                 </ul>
			      </div><!-- 我的收藏 End-->
			      <!-- 最近播放 -->
			      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
			      		<ul class="list-group list-group-flush" >
							<c:forEach items="${myRecentPlayList}" var="song" varStatus="status">
			                      <li class="list-group-item list-group-item-light " idd="${song.songId}" title="${song.songAddress}"  data-duration="${song.songLength}" data-name="${song.songName}">
			                      	<!-- 歌曲信息区 -->
			                      	<div class="clear text-ellipsis">
			                          <span>${status.index+1}.${song.songName}</span>
			                          <span class="text-muted"> -- _ _ -- </span>
			                          <span class="text-danger icon-fire"></span>
			                        </div>
			                        <!-- 播放控制区 downloadFun(${song.songAddress})-->
			                        <div class="pull-right m-l option fr">
				                        <a href="javascript:;" class="play m-r-sm" title="播放">
				                          <i class="icon-control-play text  "></i>
				                          <!-- <i class="icon-control-pause text-active"></i> -->
				                        </a>
				                        <a href="${pageContext.request.contextPath}/download.do?songAddress=${song.songAddress}&songId=${song.songId}" class="m-r-sm" title="下载"><i class="icon-cloud-download"></i></a>
				                         <a href="javascript:;"
				                         <c:choose>
				                         	<c:when test="${song.whetherCollected}">class="collect m-r-sm text-danger"</c:when>
				                         	<c:otherwise>class="collect m-r-sm"</c:otherwise>
				                         </c:choose>
				                         onclick="collectFunc(${song.songId})" id="second${song.songId}" title="喜欢"><i class="icon-heart"></i>
				                         </a>
			                        </div>
			                      </li>
			                   </c:forEach>
			                 </ul>
			      </div><!-- 最近播放 End-->
			      </div>
			    </div>
	  	</div>
	</div>
      		
      		
      		
   			 </div><!--中DIV 歌曲部分 End-->
   			 <!-- 后DIV -->
   			 <div class="col-sm-1"></div><!-- 该后DIV为了中DIV居中 -->
   			 
      	</div>
		
	  </div><!-- /.container -->
	  
	  
	  <!-- 播放器栏 -->
	  <nav class="fixed-bottom" >
		 <div class="audio-box">
			<div class="audio-container">
				<div class="audio-cover" style="background-image: url(&quot;images/cover.jpg&quot;);"></div>
				<div class="audio-view">
					<h3 class="audio-title">track stacking</h3>
					<!-- 进度条 -->
					<div class="audio-body">
						<div class="audio-backs">
							<div class="audio-this-time">00:35</div>
							<div class="audio-count-time">01:03</div>
							<div class="audio-setbacks">
								<i class="audio-this-setbacks" style="width: 55.0658%;">
									<span class="audio-backs-btn"></span>
								</i>
								<span class="audio-cache-setbacks" style="width: 100%;">
								</span>
							</div>
						</div>
					</div>
					<!-- 控制选项 -->
					<div class="audio-btn">
						<div class="audio-select">
							<div class="audio-prev"></div>
							<div class="audio-play audio-stop"></div>
							<div class="audio-next"></div>
							<div class="icon-shuffle icon-loop" id="play-pattern" title="单曲循环"></div>
							<div class="audio-menu"></div>
							<div class="audio-volume"></div>
						</div>
						<div class="audio-set-volume">
							<div class="volume-box">
								<i style="height: 80%;"><span></span></i>
							</div>
						</div>
						<!-- 播放列表 -->
						<div class="audio-list">
							<div class="audio-list-head">
								<p>播放列表</p>
								<span class="menu-close">关闭</span>
							</div>
							<ul class="audio-inline"><li></li></ul>
						</div>
					</div><!-- 控制选项 End-->
					
				</div>
			</div>
		</div>
	  </nav><!-- 播放器栏 End-->
	  
      
      <!-- 页面滑动 End-->


      <!-- Marketing messaging and featurettes
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/image/5.jpeg" alt="Generic placeholder image" width="140" height="140">
            <h2>热门推荐</h2>
            <p>聆听潮流的声音</p>
            <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/trendingRecPage.do" role="button">查看详情 &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/image/1.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>新碟上架</h2>
            <p>发现你的新世界</p>
            <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/newTrackOnShelfPage.do" role="button">查看详情 &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/image/2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>个性化推荐</h2>
            <p>每天早上6点更新</p>
            <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/personalRecPage.do" role="button">查看详情	 &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->

       
      </div><!-- /.container -->


      <!-- FOOTER -->
      <footer class="container">
        <p class="float-right"><a href="#">返回顶部</a></p>
        <p>&copy; 2017-2018 WangRuns, School of Big Data & Software Engineering. &middot; <a href="https://github.com/wangruns/Hybrid-Music-Recommender-System">GitHub</a></p>
      </footer>
    <%--main End--%>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/audio.js"></script>
	<script src="${pageContext.request.contextPath}/js/add2list.js"></script>
	<script src="${pageContext.request.contextPath}/js/navbar.js"></script>
	
	
	<script>
	$(function(){
		$('#list-home').load("collectedFrameLoad.do");
		//处理我的收藏tab切换
		$('#list-tab a[href="#list-home"]').on('click', function (e) {
			$('#list-home').load("collectedFrameLoad.do");
		});
		//处理最近播放tab切换
		$('#list-tab a[href="#list-profile"]').on('click', function (e) {
			$('#list-profile').load("recentFrameLoad.do");
		});
	});
	</script>
  </body>
</html>
