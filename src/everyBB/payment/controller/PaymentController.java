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
		//int paySendIdx = Integer.parseInt(request.getParameter("pay_send_idx"));
		//int resIdx = Integer.parseInt(request.getParameter("res_idx"));
		//String paySendTid = request.getParameter("pay_send_tid");
		//Date paySendDate = Date.valueOf(request.getParameter("pay_send_date"));
		
		//paymentSend.setPaySendIdx(paySendIdx);
		//paymentSend.setResIdx(resIdx);
		//paymentSend.setPaySendTid(paySendTid);
		//paymentSend.setPaySendDate(paySendDate);
		
		paymentSendService.insertPaymentSend(paymentSend);
		//paymentSendService.selectPayWithReserv(resIdx);
		
		request.getRequestDispatcher("/WEB-INF/view/payment/payment.jsp")
		.forward(request, response);
	}
	
	private void payDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PaymentReceive paymentReceive = new PaymentReceive();
		
		request.getRequestDispatcher("/WEB-INF/view/payment/payDetail.jsp")
		.forward(request, response);
	}

}
