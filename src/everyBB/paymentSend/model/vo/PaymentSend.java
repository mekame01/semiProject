package everyBB.paymentSend.model.vo;

public class PaymentSend {

	private int paySendIdx;
	private int resIdx;
	private String paySendTid;
	private String payMethod;
	private int payFee;
	private String payUserPhone;
	
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

	public String getPayMethod() {
		return payMethod;
	}
	
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	
	public int getPayFee() {
		return payFee;
	}
	
	public void setPayFee(int payFee) {
		this.payFee = payFee;
	}
	
	public String getPayUserPhone() {
		return payUserPhone;
	}
	
	public void setPayUserPhone(String payUserPhone) {
		this.payUserPhone = payUserPhone;
	}

	@Override
	public String toString() {
		return "PaymentSend [paySendIdx=" + paySendIdx + ", resIdx=" + resIdx + ", paySendTid=" + paySendTid
				+ ", payMethod=" + payMethod + ", payFee=" + payFee + ", payUserPhone=" + payUserPhone + "]";
	}
}
