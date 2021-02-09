package everyBB.review.model.vo;

import java.sql.Date;

public class Review {

	private int reviewIdx;
	private int resIdx;
	private String userId;
	private int carIdx;
	private Double reviewScore;
	private String reviewContent;
	private Date reviewDate;

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public int getResIdx() {
		return resIdx;
	}

	public void setResIdx(int resIdx) {
		this.resIdx = resIdx;
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

	public Double getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(Double reviewScore) {
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
		return "Review [reviewIdx=" + reviewIdx + ", resIdx=" + resIdx + ", userId=" + userId + ", carIdx=" + carIdx
				+ ", reviewScore=" + reviewScore + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate
				+ "]";
	}


}
