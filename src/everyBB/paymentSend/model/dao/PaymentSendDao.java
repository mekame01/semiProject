package everyBB.paymentSend.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import everyBB.common.template.JDBCTemplate;
import everyBB.paymentSend.model.vo.PaymentSend;

public class PaymentSendDao {
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public void insertPaymentSend(Connection conn, PaymentSend paymentSend) {
		String sql = "insert into tb_payment_send "
				+ "(pay_send_idx, res_idx, pay_send_tid, pay_send_date, payment_yn) "
				+ "values(?, ?, ?, ?, ?)";
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, paymentSend.getPaySendIdx());
			pstm.setInt(2, paymentSend.getResIdx());
			pstm.setString(3, paymentSend.getPaySendTid());
			pstm.setDate(4, paymentSend.getPaySendDate());
			pstm.setString(5, paymentSend.getPaymentYn());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdt.close(pstm);
		}
		
	}
}
