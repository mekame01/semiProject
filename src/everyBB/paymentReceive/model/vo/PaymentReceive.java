package everyBB.paymentReceive.model.vo;

import java.sql.Date;

public class PaymentReceive {

	private int payReIdx;
	private int resIdx;
	private String payReTid;
	private int payReFee;
	private Date payReDate;
	private String payReStatus;
	private String payReErrorMsg;
	private String payReErrorCd;
	private String payReYn;
	
	public int getPayReIdx() {
		return payReIdx;
	}
	
	public void setPayReIdx(int payReIdx) {
		this.payReIdx = payReIdx;
	}
	
	public int getResIdx() {
		return resIdx;
	}
	
	public void setResIdx(int resIdx) {
		this.resIdx = resIdx;
	}
	
	public String getPayReTid() {
		return payReTid;
	}
	
	public void setPayReTid(String payReTid) {
		this.payReTid = payReTid;
	}
	
	public int getPayReFee() {
		return payReFee;
	}
	
	public void setPayReFee(int payReFee) {
		this.payReFee = payReFee;
	}
	
	public Date getPayReDate() {
		return payReDate;
	}
	
	public void setPayReDate(Date payReDate) {
		this.payReDate = payReDate;
	}
	
	public String getPayReStatus() {
		return payReStatus;
	}
	
	public void setPayReStatus(String payReStatus) {
		this.payReStatus = payReStatus;
	}
	
	public String getPayReErrorMsg() {
		return payReErrorMsg;
	}
	
	public void setPayReErrorMsg(String payReErrorMsg) {
		this.payReErrorMsg = payReErrorMsg;
	}
	
	public String getPayReErrorCd() {
		return payReErrorCd;
	}
	
	public void setPayReErrorCd(String payReErrorCd) {
		this.payReErrorCd = payReErrorCd;
	}
	
	public String getPayReYn() {
		return payReYn;
	}
	
	public void setPayReYn(String payReYn) {
		this.payReYn = payReYn;
	}

	@Override
	public String toString() {
		return "PaymentReceive [payReIdx=" + payReIdx + ", resIdx=" + resIdx + ", payReTid=" + payReTid + ", payReFee="
				+ payReFee + ", payReDate=" + payReDate + ", payReStatus=" + payReStatus + ", payReErrorMsg="
				+ payReErrorMsg + ", payReErrorCd=" + payReErrorCd + ", payReYn=" + payReYn + "]";
	}
}
