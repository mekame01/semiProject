package everyBB.reservationHistory.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.reservationHistory.model.vo.ReservationHistory;

public class ReservationHistoryDao {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public ReservationHistoryDao() {
		
	}
	
	public void insertReservationHistory(Connection conn, ReservationHistory reservationHistory){
		
		PreparedStatement pstm = null;
		
		try {
			String query = "insert into "
					+ " tb_reservation_history(res_history_idx, res_idx, user_id, car_idx, reg_date, res_state)"
					+ " values(sc_rh_idx.nextval, ?, ?, ?, sysdate, ?)";
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, reservationHistory.getResIdx());
			pstm.setString(2, reservationHistory.getUserId());
			pstm.setInt(3, reservationHistory.getCarIdx());
			pstm.setString(4, reservationHistory.getResState());
			pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.IM01,e);
		}finally {
			jdt.close(pstm);
		}
	}
	
	public List<ReservationHistory> selectReservationById(Connection conn, String userId, int carIdx) {
		List<ReservationHistory> reservationHistoryList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			String query = "select *"
					+ " from tb_reservation_history"
					+ " where res_history_idx in (select res_history_idx"
					+ "                             from(select res_idx, max(res_history_idx) as res_history_idx"
					+ "                                    from tb_reservation_history"
					+ "                                   where user_id = ?"
					+ "                                     and car_idx = ?"
					+ "                                group by res_idx))"
					+ " and res_state = 'RH05'";
			
			//3. 쿼리 실행용 객체 생성
			pstm = conn.prepareStatement(query);
			
			//4. prepareStatement의 쿼리를 완성
			// setString(int idx, String val) : idx번째 물음표에 val를 넣겠다.
			pstm.setString(1, userId);
			pstm.setInt(2, carIdx);
			
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				ReservationHistory reservationHistory = new ReservationHistory();
				reservationHistory.setResHistoryIdx(rset.getInt("res_history_idx"));
				reservationHistory.setResIdx(rset.getInt("res_idx"));
				reservationHistory.setUserId(rset.getString("user_id"));
				reservationHistory.setCarIdx(rset.getInt("car_idx"));
				reservationHistory.setRegDate(rset.getDate("reg_date"));
				reservationHistory.setResState(rset.getString("res_state"));
				reservationHistoryList.add(reservationHistory);
			}
			
		//SQLException : db와 통신 중에 발생하는 모든 예외를 담당하는 Exception
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SC01, e);
		} finally {
			jdt.close(rset, pstm);
		}
		return reservationHistoryList;
	}

}
