/**
 * Song Class
 *  歌曲对象
 * @returns
 */
function Song(){
    this.name="";//歌名
    this.src="";//音乐源路径链接
    this.singer="";//歌手
    this.totalTime=0;//总时长，秒
    this.lyric="";//歌词
};

Song.prototype.setName=function(name){
    this.name=name;
};
Song.prototype.getName=function(){
    return this.name;
};

Song.prototype.setSRC=function(src){
    this.src=src;
};
Song.prototype.getSRC=function(){
    return this.src;
};

Song.prototype.setSinger=function(singer){
    this.singer=singer;
};
Song.prototype.getSinger=function(){
    return this.singer;
};

Song.prototype.setTotalTime=function(totalTime){
    this.totalTime=totalTime;
};
Song.prototype.getTotalTime=function(){
    return this.totalTime;
};

Song.prototype.setLyric=function(lyric){
    this.lyric=lyric;
};
Song.prototype.getLyric=function(){
    return this.lyric;
};