package everyBB.car.model.dao;

import java.sql.Connection;
import java.sql.Date;
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
	
	public List<Car> selectByLatLng(Connection conn, String address, Date pickupDate, Date returnDate) {
		PreparedStatement pstm = null;
		ResultSet rset = null;
		List<Car> carList = new ArrayList<Car>();
	
		try {
		String query = "select c.* "
				+ " from tb_car c "
				+ " left join tb_reservation r on(c.car_idx=r.car_idx) "
				+ " where c.car_parking like ?||'%' "
				+ " and not (case when r.res_pickup_date != null "
				+ "               then r.res_pickup_date "
				+ "               else sysdate end) between ? and ? "
				+ " and not (case when r.res_return_date != null  "
				+ "               then r.res_return_date "
				+ "               else sysdate end) between ? and ? ";
		
		pstm = conn.prepareStatement(query);
		/*
		pstm.setDouble(1, latMin);
		pstm.setDouble(2, latMax);
		pstm.setDouble(3, lngMin);
		pstm.setDouble(4, lngMax);
		pstm.setDate(5, pickupDate);
		pstm.setDate(6, returnDate);
		pstm.setDate(7, pickupDate);
		pstm.setDate(8, returnDate);
		*/
		
		pstm.setString(1, address);
		pstm.setDate(2, pickupDate);
		pstm.setDate(3, returnDate);
		pstm.setDate(4, pickupDate);
		pstm.setDate(5, returnDate);

		
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
	
	public Car selectByCarIdx(Connection conn, int carIdx) {
		Car car = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			String query = "select * from tb_car "
					+ "where car_idx = ? ";
			
			//3. 쿼리 실행용 객체 생성
			pstm = conn.prepareStatement(query);
			
			//4. prepareStatement의 쿼리를 완성
			// setString(int idx, String val) : idx번째 물음표에 val를 넣겠다.
			pstm.setInt(1, carIdx);
			
			rset = pstm.executeQuery();
			
			if(rset.next()) {
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
			}
			
		//SQLException : db와 통신 중에 발생하는 모든 예외를 담당하는 Exception
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SC01, e);
		} finally {
			jdt.close(rset, pstm);
		}
		return car;
	}
}
