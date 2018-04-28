package top.wangruns.trackstacking.model;

public class Song {

	private int id=0;
	private String name;
	private String address;
	private String artist;
	private String album;
    private int length;
    private int attention=0;
    private String type;
    
    
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public int getAttention() {
		return attention;
	}
	public void setAttention(int attention) {
		this.attention = attention;
	}
	
}
