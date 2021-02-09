package everyBB.paymentSend.model.service;

import java.sql.Connection;

import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.paymentSend.model.dao.PaymentSendDao;
import everyBB.paymentSend.model.vo.PaymentSend;

public class PaymentSendService {
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	PaymentSendDao paymentSendDao = new PaymentSendDao();
	
	public int insertPaymentSend(PaymentSend paymentSend) {
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = paymentSendDao.insertPaymentSend(conn, paymentSend);
			jdt.commit(conn);
		} catch(DataAccessException e) {
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}
		return res;
	}
}
