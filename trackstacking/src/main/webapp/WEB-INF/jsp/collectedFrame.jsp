<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-12 <c:if test="${ (not empty myCollectionList) }">border</c:if>">

	<ul class="list-group list-group-flush">
		<c:forEach items="${myCollectionList}" var="song" varStatus="status">
			<li class="list-group-item list-group-item-light "
				idd="${song.songId}" title="${song.songName}">
				<!-- 歌曲信息区 -->
				<div class="clear text-ellipsis">
					<span>${status.index+1}.${song.songName}</span> <span
						class="text-muted"> -- _ _ -- </span> <span
						class="text-danger icon-fire"></span>
				</div> <!-- 播放控制区 downloadFun(${song.songAddress})-->
				<div class="pull-right m-l fr">
					<a href="javascript:;" class="play m-r-sm" title="播放" onclick="playFunc(${song.songId})" id="play${song.songId}" name="${song.songName}" address="${song.songAddress}"> <i
						class="icon-control-play text  "></i> <!-- <i class="icon-control-pause text-active"></i> -->
					</a> <a
						href="${pageContext.request.contextPath}/download.do?songAddress=${song.songAddress}&songId=${song.songId}"
						class="m-r-sm" title="下载"><i class="icon-cloud-download"></i></a>
					<a href="javascript:;"
						<c:choose>
				                         	<c:when test="${song.whetherCollected}">class="collect m-r-sm text-danger"</c:when>
				                         	<c:otherwise>class="collect m-r-sm"</c:otherwise>
				                         </c:choose>
						onclick="collectFunc(${song.songId})" id="second${song.songId}"
						title="喜欢"><i class="icon-heart"></i> </a>
				</div>
			</li>
		</c:forEach>
	</ul>
	
</div>
</body>
</html>