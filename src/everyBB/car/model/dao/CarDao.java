package everyBB.car.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import everyBB.car.model.vo.Car;
import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;

public class CarDao {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public CarDao() {
		
	}
	
	public List<Car> selectByLatLng(Connection conn, double latMin, double latMax, double lngMin, double lngMax) {
		PreparedStatement pstm = null;
		ResultSet rset = null;
		List<Car> carList = new ArrayList<Car>();
	
		try {
		String query = "select * from tb_car "
				+ "where CAR_PARKING_LAT between ? and ?"
				+ "and CAR_PARKING_LNG between ? and ?" ;
		
		pstm = conn.prepareStatement(query);
		
		pstm.setDouble(1, latMin);
		pstm.setDouble(2, latMax);
		pstm.setDouble(3, lngMin);
		pstm.setDouble(4, lngMax);
		
		rset = pstm.executeQuery();
		
		
		while(rset.next()) {
			Car car = new Car(); 
			car.setCarIdx(rset.getInt("car_idx"));
			car.setUserId(rset.getString("user_id"));
			car.setCarNumber(rset.getString("car_number"));
			car.setCarModel(rset.getString("car_model"));
			car.setCarParking(rset.getString("car_parking"));
			car.setCarParkingLat(rset.getDouble("car_parking_lat"));
			car.setCarParkingLng(rset.getDouble("car_parking_lng"));
			car.setCarFuelEffi(rset.getInt("car_fuel_effi"));
			car.setCarFuelType(rset.getString("car_fuel_type"));
			car.setCarDoorNum(rset.getInt("car_door_num"));
			car.setCarSeatNum(rset.getInt("car_seat_num"));
			car.setCarTransmission(rset.getString("car_transmission"));
			car.setCarNavi(rset.getString("car_navi"));
			car.setCarBackCam(rset.getString("car_back_cam"));
			car.setCarNote(rset.getString("car_note"));
			car.setCarFee(rset.getInt("car_fee"));
			car.setCarAvgScore(rset.getInt("car_avg_score"));
			car.setCarDate(rset.getDate("car_date"));
			car.setCarState(rset.getString("car_state"));
			carList.add(car);
		}
		
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SC01, e); 
		} finally {
			jdt.close(rset, pstm);
		}
		return carList;
	}
}
