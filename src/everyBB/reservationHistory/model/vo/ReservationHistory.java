package everyBB.reservationHistory.model.vo;

import java.sql.Date;

public class ReservationHistory {

	private int resHistoryIdx;
	private int resIdx;
	private int carIdx;
	private String userId;
	private Date regDate;
	private String resState;

	public int getResHistoryIdx() {
		return resHistoryIdx;
	}

	public void setResHistoryIdx(int resHistoryIdx) {
		this.resHistoryIdx = resHistoryIdx;
	}

	public int getResIdx() {
		return resIdx;
	}

	public void setResIdx(int resIdx) {
		this.resIdx = resIdx;
	}

	public int getCarIdx() {
		return carIdx;
	}

	public void setCarIdx(int carIdx) {
		this.carIdx = carIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getResState() {
		return resState;
	}

	public void setResState(String resState) {
		this.resState = resState;
	}

	@Override
	public String toString() {
		return "ReservationHistory [resHistoryIdx=" + resHistoryIdx + ", resIdx=" + resIdx + ", carIdx=" + carIdx
				+ ", userId=" + userId + ", regDate=" + regDate + ", resState=" + resState + "]";
	}
}
