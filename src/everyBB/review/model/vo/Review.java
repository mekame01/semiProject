package everyBB.review.model.vo;

import java.sql.Date;

public class Review {

	private int reviewIdx;
	private String userId;
	private int carIdx;
	private int resIdx;
	private int reviewScore;
	private String reviewContent;
	private Date reviewDate;

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getCarIdx() {
		return carIdx;
	}

	public void setCarIdx(int carIdx) {
		this.carIdx = carIdx;
	}

	public int getResIdx() {
		return resIdx;
	}

	public void setResIdx(int resIdx) {
		this.resIdx = resIdx;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Override
	public String toString() {
		return "Review [reviewIdx=" + reviewIdx + ", userId=" + userId + ", carIdx=" + carIdx + ", resIdx=" + resIdx
				+ ", reviewScore=" + reviewScore + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate
				+ "]";
	}
}
