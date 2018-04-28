var collectBnts=null;
var commentBtns=null;
$(function(){
    //给热门推荐里的播放按钮添加监听
    musics=$("#hot .hot-content .h-item ul li");
    playBtns=musics.find(".option .play");
    
    var song = [
		{
			'cover' : 'images/cover.jpg',
			'src' : 'http://jq22.qiniudn.com/the.mp3',
			'title' : 'the xx'
		},
		{
			'cover' : 'images/cover2.jpg',
			'src' : 'file:///home/hadwin/Music/e.mp3',
			'title' : '不该 - 周杰伦、张惠妹'
		},
		{
			'cover' : 'images/cover5.jpg',
			'src' : 'http://m10.music.126.net/20180428151231/289e1a268262e9349dc8db0f59d88728/ymusic/d055/334e/7cae/5f45bde0eafa37c00e3f3bbd671910fe.mp3',
			'title' : '再见 - 邓紫棋'
		},
		{
			'cover' : 'images/cover3.jpg',
			'src' : 'http://so1.111ttt.com:8282/2017/1/05m/09/298092042172.m4a?tflag=1494768586&pin=f8d0e2e08864846460002b12768a9267&ip=114.233.172.33#.mp3',
			'title' : '最后一次 - 庄心妍'
		},
		{
			'cover' : 'images/cover1.jpg',
			'src' : 'http://so1.111ttt.com:8282/2017/1/05m/09/298092036393.m4a?tflag=1494768868&pin=9a24cbf7571cb3524af1d6c883916169&ip=114.233.172.33#.mp3',
			'title' : '远走高飞 - 金志文、徐佳莹'
		}
	];

    audioFn = audioPlay({
		song : song,
		autoPlay : true  //是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
	});

	/* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
	audioFn.newSong({
		'cover' : 'images/cover4.jpg',
		'src' : 'http://so1.111ttt.com:8282/2016/5/06m/06/199061931237.m4a?tflag=1494769315&pin=a0b26b2dddd976d74724841f6d2641d6&ip=114.233.172.33#.mp3',
		'title' : '极乐净土 - GARNiDELiA'
	},false);

    
    hotBtnsEvent();
});

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
            //添加新歌并立即播放
            audioFn.newSong({
    			'cover' : 'images/cover4.jpg',
    			'src' : src,
    			'title' : name
    		},true);
            
        };
    };
}