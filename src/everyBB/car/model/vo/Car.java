package everyBB.car.model.vo;

import java.sql.Date;

public class Car {
	
	private int car_idx; //차 등록번호
	private String user_id; //회원 아이디
	private String car_number; //차 번호
	private String car_model; //차종
	private String car_parking; //주차장소
	private int car_parking_lat; //주차장소 위도
	private int car_parking_lng; //주차장소 경도
	private int car_fuel_effi; //차 연비
	private String car_fuel_type; //연료
	private int car_door_num; //문 개수
	private int car_seat_num; //좌석 개수
	private String car_transmission; //자동/수동
	private String car_navi; //내비게이션 유무
	private String car_back_cam; //후방카메라 유무
	private String car_note; //참고사항
	private int car_fee; //가격
	private int car_avg_score; //평균평가점수
	private Date car_date; //등록날짜
	private String car_state; //차 상태코드
	
	public int getCar_idx() {
		return car_idx;
	}
	public void setCar_idx(int car_idx) {
		this.car_idx = car_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCar_number() {
		return car_number;
	}
	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}
	public String getCar_model() {
		return car_model;
	}
	public void setCar_model(String car_model) {
		this.car_model = car_model;
	}
	public String getCar_parking() {
		return car_parking;
	}
	public void setCar_parking(String car_parking) {
		this.car_parking = car_parking;
	}
	public int getCar_parking_lat() {
		return car_parking_lat;
	}
	public void setCar_parking_lat(int car_parking_lat) {
		this.car_parking_lat = car_parking_lat;
	}
	public int getCar_parking_lng() {
		return car_parking_lng;
	}
	public void setCar_parking_lng(int car_parking_lng) {
		this.car_parking_lng = car_parking_lng;
	}
	public int getCar_fuel_effi() {
		return car_fuel_effi;
	}
	public void setCar_fuel_effi(int car_fuel_effi) {
		this.car_fuel_effi = car_fuel_effi;
	}
	public String getCar_fuel_type() {
		return car_fuel_type;
	}
	public void setCar_fuel_type(String car_fuel_type) {
		this.car_fuel_type = car_fuel_type;
	}
	public int getCar_door_num() {
		return car_door_num;
	}
	public void setCar_door_num(int car_door_num) {
		this.car_door_num = car_door_num;
	}
	public int getCar_seat_num() {
		return car_seat_num;
	}
	public void setCar_seat_num(int car_seat_num) {
		this.car_seat_num = car_seat_num;
	}
	public String getCar_transmission() {
		return car_transmission;
	}
	public void setCar_transmission(String car_transmission) {
		this.car_transmission = car_transmission;
	}
	public String getCar_navi() {
		return car_navi;
	}
	public void setCar_navi(String car_navi) {
		this.car_navi = car_navi;
	}
	public String getCar_back_cam() {
		return car_back_cam;
	}
	public void setCar_back_cam(String car_back_cam) {
		this.car_back_cam = car_back_cam;
	}
	public String getCar_note() {
		return car_note;
	}
	public void setCar_note(String car_note) {
		this.car_note = car_note;
	}
	public int getCar_fee() {
		return car_fee;
	}
	public void setCar_fee(int car_fee) {
		this.car_fee = car_fee;
	}
	public int getCar_avg_score() {
		return car_avg_score;
	}
	public void setCar_avg_score(int car_avg_score) {
		this.car_avg_score = car_avg_score;
	}
	public Date getCar_date() {
		return car_date;
	}
	public void setCar_date(Date car_date) {
		this.car_date = car_date;
	}
	public String getCar_state() {
		return car_state;
	}
	public void setCar_state(String car_state) {
		this.car_state = car_state;
	}
	
	@Override
	public String toString() {
		return "Register [car_idx=" + car_idx + ", user_id=" + user_id + ", car_number=" + car_number + ", car_model="
				+ car_model + ", car_parking=" + car_parking + ", car_parking_lat=" + car_parking_lat
				+ ", car_parking_lng=" + car_parking_lng + ", car_fuel_effi=" + car_fuel_effi + ", car_fuel_type="
				+ car_fuel_type + ", car_door_num=" + car_door_num + ", car_seat_num=" + car_seat_num
				+ ", car_transmission=" + car_transmission + ", car_navi=" + car_navi + ", car_back_cam=" + car_back_cam
				+ ", car_note=" + car_note + ", car_fee=" + car_fee + ", car_avg_score=" + car_avg_score + ", car_date="
				+ car_date + ", car_state=" + car_state + "]";
	}

}
