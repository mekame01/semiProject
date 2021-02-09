package everyBB.reservation.model.vo;

import java.sql.Date;

public class Reservation {

	private int resIdx;
	private String userId;
	private int carIdx;
	private String resParking;
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

	public String getResParking() {
		return resParking;
	}

	public void setResParking(String resParking) {
		this.resParking = resParking;
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
		return "Reservation [resIdx=" + resIdx + ", userId=" + userId + ", carIdx=" + carIdx + ", resParking="
				+ resParking + ", resDate=" + resDate + ", resPickupDate=" + resPickupDate + ", resReturnDate="
				+ resReturnDate + ", resFee=" + resFee + "]";
	}
}
