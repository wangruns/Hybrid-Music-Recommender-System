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
      	<h3>歌曲评论 ${song.songName}</h3>
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
            <div class="col-sm-10 h-item border"><!-- 中DIV -->
               
      		  <!-- One of three columns -->
      		  <ul class="list-group list-group-flush" >
				
				<%-- <c:forEach items="${clickedSongList}" var="song" varStatus="status"> --%>
				
                      <li class="list-group-item list-group-item-light " idd="${song.songId}" title="${song.songName}">
                      	<!-- 歌曲信息区 -->
                      	<div class="clear text-ellipsis">
                          <span><a href="#" class="ahover" onclick="reviewLoad(${song.songId})">${status.index+1}.${song.songName}</a></span>
                          <span class="text-muted"> -- _ _ -- </span>
                          <span class="badge badge-pill badge-primary badge-pill">${song.trendingCoefficient}</span>
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
                      
                  <%--  </c:forEach> --%>
                      
                 </ul>
                 
   			 </div><!--中DIV 歌曲部分 End-->
   			 <!-- 后DIV -->
   			 <div class="col-sm-1"></div><!-- 该后DIV为了中DIV居中 -->
   			 
      	</div>
		
	  </div><!-- /.container -->
	  
	  <!-- 评论模块 -->
	  <div class="container">
	  	<h1></h1>
	  	<div class="row content">
	  		<!-- 前DIV -->
      	    <div class="col-sm-1">
      	    </div><!-- 该前DIV为了中DIV居中 -->
      	    
      	    
      	    <!--中DIV -->
            <div class="col-sm-10">
            	<h6>&nbsp;</h6>
            	<h3 class="border-line-color">评论</h3>
            	<!-- 发表评论 -->
            	<div class="container">
            		<div class="row content">
            			 <div class="col-sm-5 ">
            				<div>
            					<img src="${pageContext.request.contextPath}/image/defaultUserLogo.jpg"  alt="..." class="rounded img-logo">
            				</div>
            				<div>
            				   <textarea id="reviewId" rows="2" cols="15" style="resize:none" placeholder="评论" onkeyup="wordCount(this)" maxlength="140"></textarea>
            				   <span id="num-cnt">140</span>
            				   <button onclick="reviewFunc(${song.songId})" class="btn btn-outline-success my-2 my-sm-0 fl">发表</button>
            				</div>
            				
            			</div> 
            			<div class="col-sm-5 ">
            			</div>
            		</div>
            	</div><!-- 发表评论 End-->
            	
            	
            	<h6>&nbsp;</h6>
            	<h3 class="border-line">精彩评论</h3>
            	<!-- 精彩评论 -->
            	<div class="container">
            		<div class="row content">
						  <ul class="list-group list-group-flush">
							<c:forEach items="${hotReviewList}" var="review" varStatus="status">
								<li class="media list-group-item list-group-item-light">
					                <div class="media-left">
					                    <a href="#">
					                        <img class="rounded img-logo" src="${pageContext.request.contextPath}/image/defaultUserLogo.jpg" alt="菜鸟" >
					                    </a>
					                </div>
					                <div class="media-body">
					                    <h6 class="media-heading text-primary">${review.userName}</h6>
					
					                    <p>${review.review}</p>
					                    <div class="ds-comment-footer">
					                        <span class="ds-time" title="${review.reviewTime}">${review.reviewTime}</span>&nbsp;
					                        <a href="javascript:;"
						                        class="<c:if test="${review.whetherLiked}">text-danger</c:if>" 
												onclick="likeFunc(${review.reviewId})" id="hotReviewLike${review.reviewId}"
												title="点赞"><span class="icon-like" id="hotReviewLikeNum${review.reviewId}">${review.likeCoefficient}</span> 
											</a>
					                    </div>
					                </div>
           						  </li>
								
							</c:forEach>
						 </ul>
            		</div>
            	</div><!-- 精彩评论  End-->
            	
            	
            	<h6>&nbsp;</h6>
            	<h3 class="border-line">最新评论</h3>
            	<!-- 最新评论 -->
            	<div id="newReviewAreaId">
            	<div class="container">
            		<div class="row content">
						  <ul class="list-group list-group-flush">
							<c:forEach items="${newReviewList}" var="review" varStatus="status">
								<li class="media list-group-item list-group-item-light">
					                <div class="media-left">
					                    <a href="#">
					                        <img class="rounded img-logo" src="${pageContext.request.contextPath}/image/defaultUserLogo.jpg" alt="菜鸟" >
					                    </a>
					                </div>
					                <div class="media-body">
					                    <h6 class="media-heading text-primary">${review.userName}</h6>
					
					                    <p>${review.review}</p>
					                    <div class="ds-comment-footer">
					                        <span class="ds-time" title="${review.reviewTime}">${review.reviewTime}</span>&nbsp;
					                        <a href="javascript:;"
						                        class="<c:if test="${review.whetherLiked}">text-danger</c:if>" 
												onclick="likeFunc(${review.reviewId})" id="newReviewLike${review.reviewId}"
												title="点赞"><span class="icon-like" id="newReviewLikeNum${review.reviewId}">${review.likeCoefficient}</span> 
											</a>
					                    </div>
					                </div>
           						  </li>
								
							</c:forEach>
						 </ul>
            		</div>
            	</div><!-- 最新评论  End-->
            	</div>
            	
            	
            	
            </div><!-- 中DIV -->
            
            <!-- 后DIV -->
   		    <div class="col-sm-1">
   		    </div><!-- 该后DIV为了中DIV居中 -->
	  	</div>
	  </div><!-- 评论模块 End-->
      	
  </body>
</html>
