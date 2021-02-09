package everyBB.paymentReceive.model.service;

import java.sql.Connection;

import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.paymentReceive.model.dao.PaymentReceiveDao;
import everyBB.paymentReceive.model.vo.PaymentReceive;

public class PaymentReceiveService {
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	PaymentReceiveDao paymentReceiveDao = new PaymentReceiveDao();
		
	public int insertPaymentReceive(PaymentReceive paymentReceive) {
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = paymentReceiveDao.insertPaymentReceive(conn, paymentReceive);
			jdt.commit(conn);
		} catch(DataAccessException e) {
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}
		return res;
	}
	
	public PaymentReceive selectPaymentDetail(int payReIdx){
		Connection conn = jdt.getConnection();
		PaymentReceive paymentReceive = null;
		try {
			paymentReceive = paymentReceiveDao.selectPaymentDetail(conn, payReIdx);
		} finally {
			jdt.close(conn);
		}
		return paymentReceive;
	}
}
