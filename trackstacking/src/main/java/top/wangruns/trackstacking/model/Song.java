package top.wangruns.trackstacking.model;

public class Song {
	private int songId;
	private String songName;
	private String songAddress;
	private String songCoverAddress;
	private String songType;
	private int songLength;
	
	
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
