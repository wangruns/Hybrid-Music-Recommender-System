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
      
  </body>
</html>
