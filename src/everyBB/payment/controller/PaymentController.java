package everyBB.payment.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyBB.paymentReceive.model.service.PaymentReceiveService;
import everyBB.paymentReceive.model.vo.PaymentReceive;
import everyBB.paymentSend.model.service.PaymentSendService;
import everyBB.paymentSend.model.vo.PaymentSend;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/payment/*")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PaymentSendService paymentSendService = new PaymentSendService();
	PaymentReceiveService paymentReceiveService = new PaymentReceiveService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] uriArr = request.getRequestURI().split("/");
		switch(uriArr[uriArr.length - 1]) {
			case "payment" : payment(request, response);
				break;
			case "payDetail" : payDetail(request, response);
				break;
			default : response.setStatus(404);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void payment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PaymentSend paymentSend = new PaymentSend();
		//int resIdx = Integer.parseInt(request.getParameter("res_idx"));
		String paySendTid = request.getParameter("merchant_uid");
		String payMethod = request.getParameter("pay_method");
		int payFee = Integer.parseInt(request.getParameter("amount"));
		String payUserPhone = request.getParameter("buyer_phone");
		
		//paymentSend.setResIdx(resIdx);
		paymentSend.setPaySendTid(paySendTid);
		paymentSend.setPayMethod(payMethod);
		paymentSend.setPayFee(payFee);
		paymentSend.setPayUserPhone(payUserPhone);
		
		paymentSendService.insertPaymentSend(paymentSend);
		//paymentSendService.selectPayWithReserv(resIdx);
		
		request.getRequestDispatcher("/WEB-INF/view/payment/payment.jsp")
		.forward(request, response);
	}
	
	private void payDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PaymentReceive paymentReceive = new PaymentReceive();
		String payReTid = request.getParameter("imp_uid");
		int payReFee = Integer.parseInt(request.getParameter("paid_amount"));
		Date payReDate = Date.valueOf(request.getParameter("paid_at"));
		String payReStatus = request.getParameter("status");
		String payReErrorCd = request.getParameter("error_code");
		String payReErrorMsg = request.getParameter("error_msg");
		String payReYn = request.getParameter("success");
		
		paymentReceive.setPayReTid(payReTid);
		paymentReceive.setPayReFee(payReFee);
		paymentReceive.setPayReDate(payReDate);
		paymentReceive.setPayReStatus(payReStatus);
		paymentReceive.setPayReErrorCd(payReErrorCd);
		paymentReceive.setPayReErrorMsg(payReErrorMsg);
		if(payReYn.equals("true")) {
			paymentReceive.setPayReYn("Y");
		}else {
			paymentReceive.setPayReYn("N");
		}
		
		request.getRequestDispatcher("/WEB-INF/view/payment/payDetail.jsp")
		.forward(request, response);
	}

}
