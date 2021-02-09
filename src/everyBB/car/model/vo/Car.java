package everyBB.car.model.vo;

import java.sql.Date;

public class Car {
	
	private int carIdx; //차 등록번호
	private String userId; //회원 아이디
	private String carNumber; //차 번호
	private String carModel; //차종
	private String carParking; //주차장소
	private double carParkingLat; //주차장소 위도
	private double carParkingLng; //주차장소 경도
	private int carFuelEffi; //차 연비
	private String carFuelType; //연료
	private int carDoorNum; //문 개수
	private int carSeatNum; //좌석 개수
	private String carTransmission; //자동/수동
	private String carNavi; //내비게이션 유무
	private String carBackCam; //후방카메라 유무
	private String carNote; //참고사항
	private int carFee; //가격
	private double carAvgScore; //평균평가점수
	private Date carDate; //등록날짜
	private String carState; //차 상태코드

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

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getCarParking() {
		return carParking;
	}

	public void setCarParking(String carParking) {
		this.carParking = carParking;
	}

	public double getCarParkingLat() {
		return carParkingLat;
	}

	public void setCarParkingLat(double carParkingLat) {
		this.carParkingLat = carParkingLat;
	}

	public double getCarParkingLng() {
		return carParkingLng;
	}

	public void setCarParkingLng(double carParkingLng) {
		this.carParkingLng = carParkingLng;
	}

	public int getCarFuelEffi() {
		return carFuelEffi;
	}

	public void setCarFuelEffi(int carFuelEffi) {
		this.carFuelEffi = carFuelEffi;
	}

	public String getCarFuelType() {
		return carFuelType;
	}

	public void setCarFuelType(String carFuelType) {
		this.carFuelType = carFuelType;
	}

	public int getCarDoorNum() {
		return carDoorNum;
	}

	public void setCarDoorNum(int carDoorNum) {
		this.carDoorNum = carDoorNum;
	}

	public int getCarSeatNum() {
		return carSeatNum;
	}

	public void setCarSeatNum(int carSeatNum) {
		this.carSeatNum = carSeatNum;
	}

	public String getCarTransmission() {
		return carTransmission;
	}

	public void setCarTransmission(String carTransmission) {
		this.carTransmission = carTransmission;
	}

	public String getCarNavi() {
		return carNavi;
	}

	public void setCarNavi(String carNavi) {
		this.carNavi = carNavi;
	}

	public String getCarBackCam() {
		return carBackCam;
	}

	public void setCarBackCam(String carBackCam) {
		this.carBackCam = carBackCam;
	}

	public String getCarNote() {
		return carNote;
	}

	public void setCarNote(String carNote) {
		this.carNote = carNote;
	}

	public int getCarFee() {
		return carFee;
	}

	public void setCarFee(int carFee) {
		this.carFee = carFee;
	}

	public double getCarAvgScore() {
		return carAvgScore;
	}

	public void setCarAvgScore(double carAvgScore) {
		this.carAvgScore = carAvgScore;
	}

	public Date getCarDate() {
		return carDate;
	}

	public void setCarDate(Date carDate) {
		this.carDate = carDate;
	}

	public String getCarState() {
		return carState;
	}

	public void setCarState(String carState) {
		this.carState = carState;
	}

	@Override
	public String toString() {
		return "Car [carIdx=" + carIdx + ", userId=" + userId + ", carNumber=" + carNumber + ", carModel=" + carModel
				+ ", carParking=" + carParking + ", carParkingLat=" + carParkingLat + ", carParkingLng=" + carParkingLng
				+ ", carFuelEffi=" + carFuelEffi + ", carFuelType=" + carFuelType + ", carDoorNum=" + carDoorNum
				+ ", carSeatNum=" + carSeatNum + ", carTransmission=" + carTransmission + ", carNavi=" + carNavi
				+ ", carBackCam=" + carBackCam + ", carNote=" + carNote + ", carFee=" + carFee + ", carAvgScore="
				+ carAvgScore + ", carDate=" + carDate + ", carState=" + carState + "]";
	}

}
