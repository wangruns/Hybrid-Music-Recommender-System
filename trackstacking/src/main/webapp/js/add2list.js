var collectBnts=null;
var commentBtns=null;
$(function(){
    //给热门推荐里的播放按钮添加监听
    musics=$("#hot .hot-content .h-item ul li");
    playBtns=musics.find(".option .play");
    
    //喜欢按钮添加监听
    collectBtns=musics.find(".option .collect");
    
    var song = [
		{
			'cover' : 'images/cover.jpg',
			'src' : 'http://www.wangruns.top/wp-content/uploads/2017/03/%E4%B8%8D%E4%BB%85%E4%BB%85%E6%98%AF%E5%96%9C%E6%AC%A2.mp3',
			'title' : '不仅仅是喜欢'
		},
	];

    audioFn = audioPlay({
		song : song,
		autoPlay : true  //是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
	});
	/* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
	audioFn.newSong({
		'cover' : 'images/cover6.jpg',
		'src' : 'http://www.wangruns.top/wp-content/uploads/2017/03/I Knew You Were Trouble.mp3',
		'title' : 'I Knew You Were Trouble'
	},false);

    
    hotBtnsEvent();
});

/**
 * 将点击的歌曲添加到播放列表并播放
 * @returns
 */
function hotBtnsEvent(){
    var len=playBtns.length;
    for(var i=0;i<len;i++){
        playBtns[i].index=i;
        playBtns[i].onclick=function(){
        	var src=musics[this.index].getAttribute("title");
            var name=musics[this.index].getAttribute("data-name");
            var id=musics[this.index].getAttribute("idd");
            //记录播放信息
            recordPlayInfo(id);
            //添加新歌并立即播放
            audioFn.newSong({
    			'cover' : 'images/cover4.jpg',
    			'src' : src,
    			'title' : name
    		},true);
            
        };
    };
}


/**
 * 收藏喜欢歌曲
 * @param songId
 * @returns
 */
function collectFunc(songId){
	//只有登录的用户才可以享受收藏功能
	if($("#logout")[0].style.display =='none'){
		$("#SignInModalCenter").modal("show");
		return;
	} 
	var collectElement=$("#"+songId);
	//用于获取使用了tab 页里面歌曲真实id相同的元素
	var collectElement2=$("#second"+songId);
	var data = {        
	        "songId": songId,
	 };
    url = "collectSong.do";
	$.ajax({
        type:"POST",
        url:url,
        data:data,
        success:function(data){
        	var res=JSON.parse(data);
            if(res.status==200){
            	if(res.msg=="true"){
            		//已经收藏了
            		collectElement2.addClass("text-danger");
        			collectElement.addClass("text-danger");
            	}else{
            		//已经取消收藏了
            		collectElement.removeClass("text-danger");
            		collectElement2.removeClass("text-danger");
            	}
            }else{
            	alert(res.msg)
            	/*$('#collapse-error-hint').html(res.msg);
            	$('#collapse-error-hint').collapse()*/
            }
        }
    });
	
    
}

/**
 * 简单的记录主动播放记录
 * Attentiion！
 * 这里只是采用了一种简单的记录方式，即点击便认为播放了
 * 其实并不好，最好播放时间达到一定的阈值才认为播放比较好
 * 先记录在这里，看后期还有时间改没有
 * 2018-04-30 19：52：56
 * @param songId
 * @returns
 */
function recordPlayInfo(songId){
	//只记录登录的用户才的播放情况
	if($("#logout")[0].style.display =='none'){
		return;
	} 
	var data = {        
	        "songId": songId,
	 };
    url = "recordPlay.do";
    $.ajax({
        type:"GET",
        url:url,
        data:data,
    });
}

/**
 * 我的音乐
 * @returns
 */
function myMusicPage(){
	//只有登录的用户才可以
	if($("#logout")[0].style.display =='none'){
		$("#SignInModalCenter").modal("show");
		return;
	} 
	window.location.href ="myMusicPage.do";
}
