package everyBB.reservationHistory.model.service;

import java.sql.Connection;
import java.util.List;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.reservationHistory.model.dao.ReservationHistoryDao;
import everyBB.reservationHistory.model.vo.ReservationHistory;

public class ReservationHistoryService {
	
	private ReservationHistoryDao reservationHistoryDao = new ReservationHistoryDao();
	JDBCTemplate jdt = JDBCTemplate.getInstance();

	public ReservationHistoryService() {
		
	}
	
	public void insertReservationHistory(ReservationHistory reservationHistory) {
		Connection conn = jdt.getConnection();
		try {
			reservationHistoryDao.insertReservationHistory(conn, reservationHistory);
			jdt.commit(conn);
		}catch (Exception e) {
			jdt.rollback(conn);
			throw new DataAccessException(ErrorCode.IH01, e);
		}finally {
			jdt.close(conn);
		}
	}
	
	public List<ReservationHistory> selectReservationById(String userId, int carIdx) {
		List<ReservationHistory> reservationHistoryList = null; 
		Connection conn = jdt.getConnection();
		try {
			reservationHistoryList = reservationHistoryDao.selectReservationById(conn, userId, carIdx);
		}catch (Exception e) {
			throw new DataAccessException(ErrorCode.IH01, e);
		}finally {
			jdt.close(conn);
		}
		return reservationHistoryList;
	}
}
