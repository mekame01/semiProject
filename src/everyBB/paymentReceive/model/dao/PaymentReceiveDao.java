package everyBB.paymentReceive.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import everyBB.common.template.JDBCTemplate;
import everyBB.paymentReceive.model.vo.PaymentReceive;

public class PaymentReceiveDao {
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public int insertPaymentReceive(Connection conn, PaymentReceive paymentReceive) {
		int res = 0;
		String sql = "insert into tb_payment_receive "
				+ "(pay_re_idx, res_idx, pay_re_tid, pay_re_fee, pay_re_date, pay_re_status, pay_re_error_msg, pay_re_error_cd, pay_re_yn) "
				+ "values(sc_pay_re_idx.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, paymentReceive.getResIdx());
			pstm.setString(2, paymentReceive.getPayReTid());
			pstm.setInt(3, paymentReceive.getPayReFee());
			pstm.setDate(4, paymentReceive.getPayReDate());
			pstm.setString(5, paymentReceive.getPayReStatus());
			pstm.setString(6, paymentReceive.getPayReErrorMsg());
			pstm.setString(7, paymentReceive.getPayReErrorCd());
			pstm.setString(8, paymentReceive.getPayReYn());
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	public PaymentReceive selectPaymentDetail(Connection conn, String payReTid) {
		PaymentReceive paymentReceive = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			String sql = "select "
					+ "(pay_re_idx, res_idx, pay_re_tid, pay_re_fee, pay_re_date, pay_re_status, pay_re_error_msg, pay_re_error_cd, pay_re_yn) "
					+ "from tb_payment_receive where pay_re_tid = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, payReTid);
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				paymentReceive = new PaymentReceive();
				paymentReceive.setPayReIdx(rset.getInt("pay_re_idx"));
				paymentReceive.setResIdx(rset.getInt("res_idx"));
				paymentReceive.setPayReTid(rset.getString("pay_re_tid"));
				paymentReceive.setPayReFee(rset.getInt("pay_re_fee"));
				paymentReceive.setPayReDate(rset.getDate("pay_re_date"));
				paymentReceive.setPayReStatus(rset.getString("pay_re_status"));
				paymentReceive.setPayReErrorMsg(rset.getString("pay_re_error_msg"));
				paymentReceive.setPayReErrorCd(rset.getString("pay_re_error_cd"));
				paymentReceive.setPayReYn(rset.getString("pay_re_yn"));
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			jdt.close(rset,pstm);
		}
		return paymentReceive;
	}
}
