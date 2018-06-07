package top.wangruns.trackstacking.model;

public class Song {
	private int songId;
	private String songName;
	private String songAddress;
	private String songCoverAddress;
	private String songType;
	private int songLength;
	private String lyricName;
	private String lyricAddress;
	private int trendingCoefficient;
	private boolean whetherCollected;

	public Song(String songName, String songAddress) {
		this.songName=songName;
		this.songAddress=songAddress;
	}
	
	public Song(String songName, String songAddress,String lyricName,String lyricAddress) {
		this.songName=songName;
		this.songAddress=songAddress;
		this.lyricName=lyricName;
		this.lyricAddress=lyricAddress;
	}

	public Song() {}
	
	
	
	public int getTrendingCoefficient() {
		return trendingCoefficient;
	}

	public void setTrendingCoefficient(int trendingCoefficient) {
		this.trendingCoefficient = trendingCoefficient;
	}

	public boolean isWhetherCollected() {
		return whetherCollected;
	}

	public void setWhetherCollected(boolean whetherCollected) {
		this.whetherCollected = whetherCollected;
	}

	public String getLyricName() {
		return lyricName;
	}

	public void setLyricName(String lyricName) {
		this.lyricName = lyricName;
	}

	public String getLyricAddress() {
		return lyricAddress;
	}

	public void setLyricAddress(String lyricAddress) {
		this.lyricAddress = lyricAddress;
	}


	public String getSongCoverAddress() {
		return songCoverAddress;
	}

	public void setSongCoverAddress(String songCoverAddress) {
		this.songCoverAddress = songCoverAddress;
	}

	public String getSongType() {
		return songType;
	}

	public void setSongType(String songType) {
		this.songType = songType;
	}

	public int getSongLength() {
		return songLength;
	}

	public void setSongLength(int songLength) {
		this.songLength = songLength;
	}

	public int getSongId() {
		return songId;
	}

	public void setSongId(int songId) {
		this.songId = songId;
	}

	public String getSongName() {
		return songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public String getSongAddress() {
		return songAddress;
	}

	public void setSongAddress(String songAddress) {
		this.songAddress = songAddress;
	}

}
