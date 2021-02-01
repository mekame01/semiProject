package everyBB.paymentReceive.model.vo;

public class PaymentReceive {

	private int payReIdx;
	private int resIdx;
	private String payReTid;
	private String payReProg;
	private String payReStateCd;
	private String payReStateMsg;
	private String payReErrorMsg;

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

	public String getPayReProg() {
		return payReProg;
	}

	public void setPayReProg(String payReProg) {
		this.payReProg = payReProg;
	}

	public String getPayReStateCd() {
		return payReStateCd;
	}

	public void setPayReStateCd(String payReStateCd) {
		this.payReStateCd = payReStateCd;
	}

	public String getPayReStateMsg() {
		return payReStateMsg;
	}

	public void setPayReStateMsg(String payReStateMsg) {
		this.payReStateMsg = payReStateMsg;
	}

	public String getPayReErrorMsg() {
		return payReErrorMsg;
	}

	public void setPayReErrorMsg(String payReErrorMsg) {
		this.payReErrorMsg = payReErrorMsg;
	}

	@Override
	public String toString() {
		return "PaymentReceive [payReIdx=" + payReIdx + ", resIdx=" + resIdx + ", payReTid=" + payReTid + ", payReProg="
				+ payReProg + ", payReStateCd=" + payReStateCd + ", payReStateMsg=" + payReStateMsg + ", payReErrorMsg="
				+ payReErrorMsg + "]";
	}
}
