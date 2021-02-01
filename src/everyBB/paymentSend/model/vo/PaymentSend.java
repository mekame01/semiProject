package everyBB.paymentSend.model.vo;

import java.sql.Date;

public class PaymentSend {

	private int paySendIdx;
	private int resIdx;
	private String paySendTid;
	private Date paySendDate;
	private String paymentYn;

	public int getPaySendIdx() {
		return paySendIdx;
	}

	public void setPaySendIdx(int paySendIdx) {
		this.paySendIdx = paySendIdx;
	}

	public int getResIdx() {
		return resIdx;
	}

	public void setResIdx(int resIdx) {
		this.resIdx = resIdx;
	}

	public String getPaySendTid() {
		return paySendTid;
	}

	public void setPaySendTid(String paySendTid) {
		this.paySendTid = paySendTid;
	}

	public Date getPaySendDate() {
		return paySendDate;
	}

	public void setPaySendDate(Date paySendDate) {
		this.paySendDate = paySendDate;
	}

	public String getPaymentYn() {
		return paymentYn;
	}

	public void setPaymentYn(String paymentYn) {
		this.paymentYn = paymentYn;
	}

	@Override
	public String toString() {
		return "PaymentSend [paySendIdx=" + paySendIdx + ", resIdx=" + resIdx + ", paySendTid=" + paySendTid
				+ ", paySendDate=" + paySendDate + ", paymentYn=" + paymentYn + "]";
	}
}
