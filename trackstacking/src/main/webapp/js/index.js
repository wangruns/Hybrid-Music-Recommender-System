var collectBnts=null;
var commentBtns=null;
$(function(){

    //给热门推荐里的播放按钮添加事件
    musics=$("#hot .hot-content .h-item ul li");
    playBtns=musics.find(".option .play");
 
    //收藏按钮事件
    collectBnts=musics.find(".option .add");
    //评论按钮事件
    commentBtns=musics.find(".option .comment");
    hotBtnsEvent();
    commentEvent();
});


//评论事件
function commentEvent(){
	var len=commentBtns.length;
    for(var i=0;i<len;i++){
    	commentBtns[i].index=i;
    	commentBtns[i].onclick=function(){
            var name=musics[this.index].getAttribute("data-name");
            var uname=$(".user").eq(0).html();
        	if(uname==""){
        		window.location.href ="Detail.action?musicName="+name;
        	}else{
        		window.location.href ="Detail.action?musicName="+name+"&username="+uname;
        	}
        };
    };
}
function collectBtnsEvent(url){
	var len=collectBnts.length;
    for(var i=0;i<len;i++){
    	collectBnts[i].index=i;
    	collectBnts[i].onclick=function(){
    		//如果没登录，则不允许收藏
    		
    		var username=$(".user").eq(0).html();
    		if(username==""){
    			$("#tipModal").find(".modal-body").html("请先登录再收藏哦~").end().modal("show");
    		}else{
    			var length=musics[this.index].getAttribute("data-duration");
                var name=musics[this.index].getAttribute("data-name");
                var address=musics[this.index].getAttribute("title");
                var date=formatDateTime( new Date());
                var collectOBJ={
                		date_time:date,song_name:name,username:username,length:length,address:address
                };
                //发送ajax请求
                $.ajax({
                	type:"post",
                	url:url,
                	data:collectOBJ,
                	success:function(data){
                		var d=JSON.parse(data);
                		if(d.status==200){
                			$("#tipModal").find(".modal-body").html(d.msg).end().modal("show");;
                		}else{
                			$("#tipModal").find(".modal-body").html(d.msg).end().modal("show");
                		}
                	},
                });
    		}
        };
    };
}
function hotBtnsEvent(){
    var len=playBtns.length;
    
    for(var i=0;i<len;i++){
        playBtns[i].index=i;
        playBtns[i].onclick=function(){
//        	alert(this.index);
        	var src=musics[this.index].getAttribute("title");
//        	alert(src);
            var singer="";
            var name=musics[this.index].getAttribute("data-name");
            var lyric="";
            var totalTime=musics[this.index].getAttribute("data-duration");
            var musicOBJ={
                src:src,singer:singer,name:name,lyric:lyric,totalTime:totalTime
            };
            _player.addMusicToPlayList(musicOBJ);
            setPlayList();
            _player.play();
        };
    };
}

var formatDateTime = function (date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    var minute = date.getMinutes();
    minute = minute < 10 ? ('0' + minute) : minute;
    return y + '-' + m + '-' + d+' '+h+':'+minute;
};