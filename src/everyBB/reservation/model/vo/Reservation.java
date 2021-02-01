package everyBB.reservation.model.vo;

import java.sql.Date;

public class Reservation {

	private int resIdx;
	private int carIdx;
	private String userId;
	private Date resDate;
	private Date resPickupDate;
	private Date resReturnDate;
	private int resFee;

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

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public Date getResPickupDate() {
		return resPickupDate;
	}

	public void setResPickupDate(Date resPickupDate) {
		this.resPickupDate = resPickupDate;
	}

	public Date getResReturnDate() {
		return resReturnDate;
	}

	public void setResReturnDate(Date resReturnDate) {
		this.resReturnDate = resReturnDate;
	}

	public int getResFee() {
		return resFee;
	}

	public void setResFee(int resFee) {
		this.resFee = resFee;
	}

	@Override
	public String toString() {
		return "Reservation [resIdx=" + resIdx + ", carIdx=" + carIdx + ", userId=" + userId + ", resDate=" + resDate
				+ ", resPickupDate=" + resPickupDate + ", resReturnDate=" + resReturnDate + ", resFee=" + resFee + "]";
	}
	
}
