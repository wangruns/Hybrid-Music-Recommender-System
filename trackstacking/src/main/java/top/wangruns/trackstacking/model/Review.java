package top.wangruns.trackstacking.model;

public class Review {
	private int reviewId;
	private int userId;
	private int songId;
	private String review;
	private String reviewTime;
	//评论点赞数目
	private int likeCoefficient;
	//发表该评论的用户昵称
	private String userName;
	//当前用户是否对该评论点赞
	private boolean whetherLiked;

	public int getLikeCoefficient() {
		return likeCoefficient;
	}

	public void setLikeCoefficient(int likeCoefficient) {
		this.likeCoefficient = likeCoefficient;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public boolean isWhetherLiked() {
		return whetherLiked;
	}

	public void setWhetherLiked(boolean whetherLiked) {
		this.whetherLiked = whetherLiked;
	}

	public Review(int userId, int songId, String review) {
		this.userId = userId;
		this.songId = songId;
		this.review = review;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Review() {
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
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

	public String getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(String reviewTime) {
		this.reviewTime = reviewTime;
	}

}
