package everyBB.reservation.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.reservation.model.vo.Reservation;

public class ReservationDao {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public ReservationDao() {
		
	}
	
	public void insertReservation(Connection conn, Reservation reservation){
		
		PreparedStatement pstm = null;
		
		try {
			String query = "insert into "
					+ " tb_reservation(res_idx, user_id, car_idx, res_parking, res_date, res_pickup_date, res_return_date, res_fee)"
					+ " values(sc_res_idx.nextval, ?, ?, ?, ?, ?, ?, ?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, reservation.getUserId());
			pstm.setInt(2, reservation.getCarIdx());
			pstm.setString(3, reservation.getResParking());
			pstm.setDate(4, reservation.getResDate());
			pstm.setDate(5, reservation.getResPickupDate());
			pstm.setDate(6, reservation.getResReturnDate());
			pstm.setInt(7, reservation.getResFee());
			pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.IR01,e);
		}finally {
			jdt.close(pstm);
		}
	}
	
	public int selectReservationResIdx(Connection conn, Reservation reservation){
		int res = 0;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			String query = "select res_idx from tb_reservation"
					+ " where car_idx = ? and user_id = ? and res_date = ?";
			
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, reservation.getCarIdx());
			pstm.setString(2, reservation.getUserId());
			pstm.setDate(3, reservation.getResDate());
			
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				res = rset.getInt("res_idx");
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SC01, e);
		} finally {
			jdt.close(rset, pstm);
		}
		return res;
	}
	

}
