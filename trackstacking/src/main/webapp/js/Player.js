/**
 * Player Class
 * 播放器对象
 * @param audio
 * @param song
 * @returns
 */
//播放器对象
function Player(audio,song){
    this.audio=audio;//播放器元素
    this.audio.loop="loop";
    this.currentTime=audio.currentTime;//当前播放的时间
    this.volume=0.5;//初始化音量
    this.playModel="单曲循环";//播放模式  随机 单曲循环 顺序
    this.ms=0;
    this.mm=0;
    this.song=song;
    this.timer=null;
    this.playList=[];//播放列表
    this.playIndex=0;//当前播放的歌曲在播放列表中的索引
    this.paused=true;
    this.showed=true;
    this.isListShow=false;
    this.currentMusicName="";
}
//播放
Player.prototype.play=function(){
    if(this.playList.length>0){
//    	alert("开始放哦");
    	musicSrc=this.playList[this.playIndex].src;
//    	alert("musicSrc "+musicSrc);
        this.song.src=musicSrc;
//        alert("song.src "+this.song.src);
        this.song.totalTime=this.playList[this.playIndex].totalTime;
        this.currentMusicName=this.playList[this.playIndex].name;
        $("#musicName").html(this.playList[this.playIndex].name);
        var src=this.audio.src;
//        alert("audio.src "+src);
        if(src!=this.song.src){
//        	alert("不相等");
            this.audio.src=this.song.src;
        }
//        alert(this.audio.src);
        this.audio.play();
        $("#_play").find("i").html("&#xe682;");
        //更新时间
        this.paused=false;
        this.updateTime();
    }else{
        alert("当前播放列表为空，请添加歌曲到列表再播放~");
    }

};
//暂停
Player.prototype.pause=function(){
    clearInterval(this.timer);
    this.audio.pause();
    this.paused=true;
    $("#_play").find("i").html("&#xe65d;");
};
//更新播放器的播放时间
Player.prototype.updateTime=function(){
    var me=this;
    me.timer=setInterval(function(){
    	
        me.currentTime=me.audio.currentTime;
        
//        alert(me.currentTime);
        
        me.ms=Math.floor(parseInt(me.currentTime)/60);
        me.mm=parseInt(me.currentTime)%60;
        if(me.ms<10){
            me.ms="0"+me.ms;
        }
        if(me.mm<10){
            me.mm="0"+me.mm;
        }
        $("#time").text(me.ms+":"+me.mm);
        me.changeRange();
    },1000);
};
Player.prototype.changeRange=function(){
    var me=this;
    var total=me.song.getTotalTime();
    var now=me.audio.currentTime;
    $("#mus-range").css({width:now/(total)*100+"%"});
    $("#mus-range").attr("aria-valuenow",now/total*100+"%");
};
//添加歌曲到播放列表
Player.prototype.addMusicToPlayList=function(musicItem){
    var len=this.playList.length;
    for(var i=0;i<len;i++){
        if(musicItem.name==this.playList[i].name){
        	this.song.src=this.playList[i].src;
        	this.playIndex=i;
        	this.pause();
            return;
        }
    }
    this.playList.push(musicItem);
    this.playIndex=this.playList.length-1;
};
//上一首
Player.prototype.prev=function(){
    this.playIndex--;
    if(this.playIndex<0){
        this.playIndex=this.playList.length-1;
    }
    this.play();
};

//下一首
Player.prototype.next=function(){
    this.playIndex++;
    var len=this.playList.length;
    if(this.playIndex>len-1){
        this.playIndex=0;
    }
    this.play();
};
//
Player.prototype.isPaused=function(){
    return this.paused;
};
//切换播放模式
Player.prototype.changePlayModel=function(){
	//&#xe6f1;
	var me=this;
	if(!(me.audio.loop)){
		me.playModel="单曲循环";
		$("#modelBtn").find("i").eq(0).attr("title",me.playModel);
		$("#modelBtn").find("i").eq(0).html("&#xf0030;");
		me.audio.loop="loop";
	}else{
		me.playModel="顺序播放";
		me.audio.loop=false;
		$("#modelBtn").find("i").eq(0).attr("title",me.playModel);
		$("#modelBtn").find("i").eq(0).html("&#xe615;");
	}
};