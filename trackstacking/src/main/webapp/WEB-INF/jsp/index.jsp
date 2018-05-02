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

    <title>发现音乐</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css" >
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
		      <input type="email" id="inputEmail" class="form-control" placeholder="邮箱帐号" required autofocus>
		      <label for="inputPassword" class="sr-only">Password</label>
		      <input type="password" id="inputPassword" class="form-control" placeholder="密码" required>
		      
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
		      <input type="email" id="inputEmail-signup" class="form-control" placeholder="邮箱帐号" required autofocus>
		     
		      <button type="button"  class="btn btn-md btn-primary" id="get-validate-code">获取验证码</button>
		      <input type="number" class="form-control" id="validate-code-signup" placeholder="验证码" required> 
		      
		      <label for="inputPassword" class="sr-only">Password</label>
		      <input type="password" id="inputPassword-signup" class="form-control" placeholder="密码" required>
		      
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
            <li class="nav-item">
              <a class="nav-link" href="#" onclick="myMusicPage()">我的音乐</a>
            </li>
          </ul>
          <form class="form-inline mt-2 mt-md-0">
            <input class="form-control mr-sm-2" type="text" placeholder="音乐" aria-label="Search">
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
				<li id="logout" class="nav-item dropdown" <c:if test="${sessionScope.user==null}">style="display:none;"</c:if>><a
					class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/logout.do" 
					role="button"> 退出 </a>
					</li>
			</ul>
        </div>
      </nav>
    </header>

    <main role="main">
	  <!-- 页面滑动 -->
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1>Example headline.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
            <div class="container">
              <div class="carousel-caption">
                <h1>Another example headline.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-right">
                <h1>One more for good measure.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
              </div>
            </div>
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


      <!-- Marketing messaging and featurettes
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/image/5.jpeg" alt="Generic placeholder image" width="140" height="140">
            <h2>热门推荐</h2>
            <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
            <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/trendingRecPage.do" role="button">查看详情 &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/image/1.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>新碟上架</h2>
            <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
            <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/newTrackOnShelfPage.do" role="button">查看详情 &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/image/2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>个性化推荐</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/personalRecPage.do" role="button">查看详情	 &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->

       
      </div><!-- /.container -->


      <!-- FOOTER -->
      <footer class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>&copy; 2017-2018 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/add2list.js"></script>
	
	<script>
	$(function(){
		
		
		//处理登录
		$("#login-submit").submit(function(){
			var email=$("#inputEmail").val();
	        var password=$("#inputPassword").val();
	        var data = {        
			        "email": email,
			        "password":password,
			 };
	        url = "${pageContext.request.contextPath}/login.do";
	        $.ajax({
	            type:"POST",
	            url:url,
	            data:data,
	            success:function(data){
	            	var res=JSON.parse(data);
	                if(res.status==200){
	                    $("#SignInModalCenter").modal('hide');
	                    location.reload();
	                }else{
	                	$('#collapse-error-hint').html(res.msg);
	                	$('#collapse-error-hint').collapse()
	                }
	            }
	        });
	        return false;
	        
		});//处理登录 End

	
	
	//获取验证码
	$("#get-validate-code").click(function(){
		var email=$("#inputEmail-signup").val();
		var btn=$(this);
		if(!checkEmail(email)){
			$('#collapse-error-hint-signup').html("请输入正确的邮箱");
        	$('#collapse-error-hint-signup').collapse()
			return;
		}
        var data = {        
		        "email": email,
		 };
        url = "${pageContext.request.contextPath}/getValidateCode.do";
        $.ajax({
            type:"POST",
            url:url,
            data:data,
            success:function(data){
            	var res=JSON.parse(data);
            	if(res.status==200){
            		settime(btn);
            	}
            	$('#collapse-error-hint-signup').html(res.msg);
            	$('#collapse-error-hint-signup').collapse();
            }
        });
        
	  });//获取验证码 End
	
	
	
	//处理注册
	$("#register-submit").submit(function(){
			var email=$("#inputEmail-signup").val();
	        var password=$("#inputPassword-signup").val();
	        var validateCode=$("#validate-code-signup").val();
	        var data = {        
			        "email": email,
			        "password":password,
			        "validateCode":validateCode,
			 };
	        url = "${pageContext.request.contextPath}/register.do";
	        $.ajax({
	            type:"POST",
	            url:url,
	            data:data,
	            success:function(data){
	            	var res=JSON.parse(data);
	                if(res.status==200){
	                    $("#SignUpModalCenter").modal('hide');
	                    location.reload();
	                }else{
	                	$('#collapse-error-hint-signup').html(res.msg);
	                	$('#collapse-error-hint-signup').collapse()
	                }
	            }
	        });
	        return false;
	        
		});//处理注册 End
		
	
	});
	
	
	//验证邮箱
	function checkEmail(str){
		   var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		   if(re.test(str)){
			   return true;
		   }else{
			   return false;
		   }
	}//验证邮箱 End
	
	
	//限制60s获取一次验证码
	var waitTime=6;
	var cnt=waitTime;
	function settime(val) {
		if (cnt == 0) {
			val.attr("disabled", false);
			val.html("重新获取");
			val.css({
			"background":"#007BFF"
			}); 
			cnt = waitTime;
			return false;
		} else {
			val.attr("disabled", true);
			val.html("正在获取"+cnt);
			val.css({
			"background":"#ccc"
			});
			cnt--;
		}
		setTimeout(function() {
			settime(val)
		},1000);
	}//限制60s获取一次验证码 End
	
	</script>
  </body>
</html>
