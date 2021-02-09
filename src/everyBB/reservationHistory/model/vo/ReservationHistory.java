package everyBB.reservationHistory.model.vo;

import java.sql.Date;

public class ReservationHistory {

	private int resHistoryIdx;
	private int resIdx;
	private String userId;
	private int carIdx;
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
		return "ReservationHistory [resHistoryIdx=" + resHistoryIdx + ", resIdx=" + resIdx + ", userId=" + userId
				+ ", carIdx=" + carIdx + ", regDate=" + regDate + ", resState=" + resState + "]";
	}

}
