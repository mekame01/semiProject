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
				+ "(pay_re_idx, res_idx, pay_re_tid, pay_re_prog, pay_re_state_cd, pay_re_state_msg, pay_re_error_msg) "
				+ "values(sc_pay_re_idx.nextval ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, paymentReceive.getResIdx());
			pstm.setString(2, paymentReceive.getPayReTid());
			pstm.setString(3, paymentReceive.getPayReProg());
			pstm.setString(4, paymentReceive.getPayReStateCd());
			pstm.setString(5, paymentReceive.getPayReStateMsg());
			pstm.setString(6, paymentReceive.getPayReErrorMsg());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	public PaymentReceive selectPaymentDetail(Connection conn, int payReIdx) {
		PaymentReceive paymentReceive = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			String sql = "select "
					+ "(pay_re_idx, res_idx, pay_re_tid, pay_re_prog, pay_re_state_cd, pay_re_state_msg, pay_re_error_msg) "
					+ "from tb_payment_receive where pay_re_idx = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, payReIdx);
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				paymentReceive = new PaymentReceive();
				paymentReceive.setPayReIdx(rset.getInt("pay_re_idx"));
				paymentReceive.setResIdx(rset.getInt("res_idx"));
				paymentReceive.setPayReTid(rset.getString("pay_re_tid"));
				paymentReceive.setPayReProg(rset.getString("pay_re_prog"));
				paymentReceive.setPayReStateCd(rset.getString("pay_re_state_cd"));
				paymentReceive.setPayReStateMsg(rset.getString("pay_re_state_msg"));
				paymentReceive.setPayReErrorMsg(rset.getString("pay_re_error_msg"));
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
