package everyBB.car.model.service;

import java.sql.Connection;
import java.util.List;

import everyBB.car.model.dao.CarDao;
import everyBB.car.model.vo.Car;
import everyBB.common.template.JDBCTemplate;

public class CarService {

	private CarDao carDao = new CarDao();
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public CarService() {
		
	}
	
	public List<Car> selectByLatLng(double latMin, double latMax, double lngMin, double lngMax) {
		Connection conn = jdt.getConnection();
		List<Car> carList = null;
		
		try {
			carList = carDao.selectByLatLng(conn, latMin, latMax, lngMin, lngMax);
		} finally {
			jdt.close(conn);
		}
		return carList;
	}

}
