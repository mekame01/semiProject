package everyBB.paymentSend.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import everyBB.common.template.JDBCTemplate;
import everyBB.paymentSend.model.vo.PaymentSend;
import everyBB.reservation.model.vo.Reservation;

public class PaymentSendDao {
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public int insertPaymentSend(Connection conn, PaymentSend paymentSend) {
		int res = 0;
		PreparedStatement pstm = null;
		try {
			String sql = "insert into tb_payment_send "
					+ "(pay_send_idx, res_idx, pay_send_tid, pay_method, pay_fee, pay_user_phone) "
					+ "values(sc_pay_send_idx.nextval, ?, ?, ?, ?, ?)";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, paymentSend.getResIdx());
			pstm.setString(2, paymentSend.getPaySendTid());
			pstm.setString(3, paymentSend.getPayMethod());
			pstm.setInt(4, paymentSend.getPayFee());
			pstm.setString(5, paymentSend.getPayUserPhone());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	public List<Reservation> selectPayWithReserv(Connection conn, int resIdx){
		List<Reservation> res = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		try {
			String sql = "select "
					+ "(res_idx, car_idx, user_id, res_parking, res_date, res_pickup_date, res_return_date) "
					+ "from tb_reservation where resIdx = ?";
			res = new ArrayList<Reservation>();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, resIdx);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Reservation reservation = new Reservation();
				reservation.setResIdx(rset.getInt(1));
				reservation.setCarIdx(rset.getInt(2));
				reservation.setUserId(rset.getString(3));
				reservation.setResParking(rset.getString(4));
				reservation.setResDate(rset.getDate(5));
				reservation.setResPickupDate(rset.getDate(6));
				reservation.setResReturnDate(rset.getDate(7));
				res.add(reservation);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdt.close(rset, pstm);
		}
		return res;
	}
}
