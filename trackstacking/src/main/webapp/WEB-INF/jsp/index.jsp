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
	.hide{
		display: none;
	}
	.ahover{
		color:#818182;
	}
	.img-logo{
		height:50px;
		width:50px;
		margin-top:1px;
	}
	.fl{
		float:left;
	}
	.float-right{
		float:right;
	}
	.media-left, .media-right, .media-body{
		display: table-cell;
		vertical-align: top;
	}
	.media-heading {
	   margin-top: 0;
	   margin-bottom: 5px;
	}
	.ds-time{
		color: #999;
	}
	.border-line{
		border-bottom: 1px solid #cfcfcf;
	}
	.border-line-color{
		border-bottom: 2px solid #2AD980;
	}
	.custom-select-override {
	    display: inline-block;
	    height: calc(2.25rem + 2px);
	    padding: .375rem 1.75rem .375rem .75rem;
	    line-height: 1.5;
	    color: #495057;
	    vertical-align: middle;
	    background: #fff url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3E%3Cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E") no-repeat right .75rem center;
	        background-size: auto auto;
	    background-size: 8px 10px;
	    border: 1px solid #ced4da;
	    border-radius: .25rem;
	    -moz-appearance: none;
	}
	.margin-left-m{
		margin-left:15px;
	}
	.custom-file-input-{
    position: relative;
    z-index: 2;
    width: 100%;
    height: calc(2.25rem + 2px);
    margin: 0;
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
	    </div>
	  </div>
	</div><!-- 注册Modal End-->


    <header id="headerId">
    
    </header>
    

    <div id="hot">
	  <!-- 页面滑动 -->
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="first-slide" src="${pageContext.request.contextPath}/image/slide1.jpg" alt="First slide">
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="${pageContext.request.contextPath}/image/slide2.jpg" alt="Second slide">
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="${pageContext.request.contextPath}/image/slide3.jpg" alt="Third slide">
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div><!-- 页面滑动 End-->
     </div><!-- hot End -->
     
     
      <!-- 播放器栏 -->
	  <nav class=" fixed-bottom hide" id="playerId">
		 <div class="audio-box">
			<div class="audio-container">
				<div class="audio-cover" style="background-image: url(&quot;images/cover.jpg&quot;);"></div>
				<div class="audio-view">
					<h1 class="audio-title">track stacking</h1>
					<!-- 进度条 -->
					<div class="audio-body">
						<div class="audio-backs">
							<div class="audio-this-time">00:35</div>
							<div class="audio-count-time">01:03</div>
							<div class="audio-setbacks">
								<i class="audio-this-setbacks" style="width: 0.0%;">
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
							<!-- <div class="audio-play audio-stop"></div> -->
							<div class="audio-play"></div>
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
            <p id="trendingRecId"><a class="btn btn-secondary" href="#" role="button">查看详情 &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/image/1.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>新碟上架</h2>
            <p>发现你的新世界</p>
            <p id="newTrackOnShelfId"><a class="btn btn-secondary" href="#" role="button">查看详情 &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/image/2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>个性化推荐</h2>
            <p>每天早上6点更新</p>
            <p id="personalizedRecId"><a class="btn btn-secondary" href="#" role="button">查看详情 &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->

       
      </div><!-- /.container -->


      <!-- FOOTER -->
      <footer class="container">
        <p class="float-right"><a href="#">返回顶部</a></p>
        <p>&copy; 2017-2018 WangRuns, School of Big Data & Software Engineering. &middot; <a href="https://github.com/wangruns/Hybrid-Music-Recommender-System">GitHub</a></p>
      </footer>
    

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
		$('#headerId').load("headerFrameLoad.do");
	});
	</script>
  </body>
</html>
