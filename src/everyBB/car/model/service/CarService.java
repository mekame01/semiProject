package everyBB.car.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import everyBB.car.model.dao.CarDao;
import everyBB.car.model.vo.Car;
import everyBB.common.template.JDBCTemplate;

public class CarService {

	private CarDao carDao = new CarDao();
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public CarService() {
		
	}
	
	public List<Car> selectByAddress(String address, Date pickupDate, Date returnDate) {
		Connection conn = jdt.getConnection();
		List<Car> carList = null;
		
		try {
			carList = carDao.selectByAddress(conn, address, pickupDate, returnDate);
		} finally {
			jdt.close(conn);
		}
		return carList;
	}

	public Car selectByCarIdx(int carIdx) {
		Connection conn = jdt.getConnection();
		Car car = null;
		
		try {
			car = carDao.selectByCarIdx(conn, carIdx);
		} finally {
			jdt.close(conn);
		}
		return car;
	}

	public List<Car> selectByUserId(String userId) {
		Connection conn = jdt.getConnection();
		List<Car> carList = null;
		
		try {
			carList = carDao.selectByUserId(conn, userId);
		} finally {
			jdt.close(conn);
		}
		return carList;
	}

}
