var my_audio=document.createElement("audio");
var playBtns=null;
var musics=null;
var _player=null;//播放器
var _song=null;//歌曲
var ListBtn=null;
var topOffset=0;
$(function(){
    my_audio.volume=0.5;
    _song=new Song();
    _player=new Player(my_audio,_song);//实例化播放器

   
    ListBtn=$("#playList")[0];
    addEvents();
    
});
function addEvents(){
   
    playerBtnsEvent();
    volumeChange();
    
    //显示播放列表
    showPlayList();
  //切换到歌词页面
    $("#lyricBtn").click(function(){
    	var musicName=_player.currentMusicName;
    	var uname=$(".user").eq(0).html();
    	if(uname==""){
    		window.location.href ="Detail.action?musicName="+musicName;
    	}else{
    		window.location.href ="Detail.action?musicName="+musicName+"&username="+uname;
    	}
    	
    });
    //播放结束的监听事件
    _player.audio.addEventListener("ended",function(){
		if(!(_player.audio.loop)){
			 _player.next();
			 topOffset=0;
		    addActive(_player.playIndex);
		}else
		{
			_player.play();
			 topOffset=0;
		};
	});
};

//显示播放列表
function showPlayList(){
    ListBtn.onclick=function(){
        if(_player.isListShow){
            $("#ListWrap").css({right:-310});
            _player.isListShow=false;
        }else{
            $("#ListWrap").css({right:30});
            _player.isListShow=true;
        }
    };
}
//音量控制事件
function volumeChange(){
    var v_timer=null;
    $("#volume").mouseenter(function(){
        clearTimeout(v_timer);
        $(".v-rangeWrap").show();

    }).mouseleave(function(){
        v_timer=setTimeout(function(){
            $(".v-rangeWrap").hide();
        },1000);
    });
    $("#v-range").change(function(){
        var val=this.value;
        _player.audio.volume=val*0.01;
    });
}
//播放器按钮事件
function playerBtnsEvent(){
    //播放暂停按钮
    $("#_play").click(function(){
        if(_player.isPaused()){
            _player.play();
        }else{
            _player.pause();
        }

    });
    //下一首
    $("#_next").click(function(){
        _player.next();
        addActive(_player.playIndex);
    });
    //上一首
    $("#_prev").click(function(){
        _player.prev();
        addActive(_player.playIndex);
    });
    //切换播放模式
    $("#modelBtn").click(function(){
    	_player.changePlayModel();
    });
  
}

//设置页面播放列表
function setPlayList(){
    $("#ListWrap ul")[0].innerHTML="";
    var aList=_player.playList;
    var len=aList.length;
    for(var i=0;i<len;i++){
        var li=document.createElement("li");
        li.title=aList[i].name;
        li.innerHTML=" <i class='iconfont'>&#xe671;</i>"+(i+1)+". "+aList[i].name + "-"+aList[i].singer;
        $("#ListWrap ul")[0].appendChild(li);
    }
    //设置选中样式
    var page_musicList=$("#ListWrap ul").find("li");
    for(var j=0;j<len;j++){
        page_musicList[j].className="";
    }
    page_musicList[_player.playIndex].className="active";
    //
    //播放列表点击事件
    playListClick();
}
//音乐播放列表的点击事件
function playListClick(){
    var aList=$("#ListWrap ul").find("li");
    var len=aList.length;
    for(var i=0;i<len;i++){
        aList[i].index=i;
        aList[i].onclick=function(){
            addActive(this.index);
            _player.playIndex=this.index;
            _player.play();
        };
    }
}
function addActive(index){
    var aList=$("#ListWrap ul").find("li");
    var len=aList.length;
    for(var j=0;j<len;j++){
        aList[j].className="";
    }
    aList[index].className="active";
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