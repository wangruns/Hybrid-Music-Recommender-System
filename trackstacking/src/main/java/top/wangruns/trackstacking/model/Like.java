package top.wangruns.trackstacking.model;

public class Like {
	private int likeId;
	private int userId;
	private int reviewId;
	
	public Like() {}
	
	public Like(int userId,int reviewId) {
		this.userId=userId;
		this.reviewId=reviewId;
	}

	public int getLikeId() {
		return likeId;
	}

	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

}
