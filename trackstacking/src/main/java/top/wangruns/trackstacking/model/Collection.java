package top.wangruns.trackstacking.model;

public class Collection {
	private int collectionId;
	private int userId;
	private int songId;

	public Collection() {

	}

	public Collection(int userId,int songId) {
		this.userId=userId;
		this.songId=songId;
	}

	public int getCollectionId() {
		return collectionId;
	}

	public void setCollectionId(int collectionId) {
		this.collectionId = collectionId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSongId() {
		return songId;
	}

	public void setSongId(int songId) {
		this.songId = songId;
	}

}
