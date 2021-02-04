package everyBB.paymentReceive.model.dao;

import java.sql.Connection;

import everyBB.common.template.JDBCTemplate;
import everyBB.paymentReceive.model.vo.PaymentReceive;

public class PaymentReceiveDao {
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public void insertPaymentReceive(Connection conn, PaymentReceive paymentReceive) {
		String sql = "insert into tb_payment_receive "
				+ "";
		
	}
}
