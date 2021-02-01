package everyBB.likey.model.vo;

public class Likey {

	private int likeyIdx;
	private String userId;
	private int carIdx;
	private int state;

	public int getLikeyIdx() {
		return likeyIdx;
	}

	public void setLikeyIdx(int likeyIdx) {
		this.likeyIdx = likeyIdx;
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

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Likey [likeyIdx=" + likeyIdx + ", userId=" + userId + ", carIdx=" + carIdx + ", state=" + state + "]";
	}
	
}
