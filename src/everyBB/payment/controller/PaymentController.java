package everyBB.payment.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyBB.car.model.service.CarService;
import everyBB.car.model.vo.Car;
import everyBB.common.util.file.FileVo;
import everyBB.paymentReceive.model.service.PaymentReceiveService;
import everyBB.paymentReceive.model.vo.PaymentReceive;
import everyBB.paymentSend.model.service.PaymentSendService;
import everyBB.paymentSend.model.vo.PaymentSend;
import everyBB.register.model.service.RegisterService;
import everyBB.reservation.model.service.ReservationService;
import everyBB.reservation.model.vo.Reservation;
import everyBB.reservationHistory.model.service.ReservationHistoryService;
import everyBB.reservationHistory.model.vo.ReservationHistory;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/payment/*")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PaymentSendService paymentSendService = new PaymentSendService();
	PaymentReceiveService paymentReceiveService = new PaymentReceiveService();
	private ReservationHistoryService reservationHistoryService = new ReservationHistoryService();
	private ReservationService reservationService = new ReservationService();
	private RegisterService registerService = new RegisterService();
	private CarService carService = new CarService();
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
			case "insertPaymentSend" : insertPaymentSend(request, response);
				break;
			case "insertPaymentReceive" : insertPaymentReceive(request, response);
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
		int resIdx = Integer.parseInt(request.getParameter("resIdx"));
		//List<Reservation> resList = null;
		//resList = paymentSendService.selectPayWithReserv(resIdx);
		//System.out.println(resList);
		//request.setAttribute("resList", resList);
		//insertPayment(request, response);
		
		Reservation reservation = reservationService.selectReservationByResIdx(resIdx);
		Car car = carService.selectByCarIdx(reservation.getCarIdx());
		
		List<FileVo> fileList = registerService.selectFileList(car.getCarIdx());

		request.setAttribute("car", car);
		request.setAttribute("resIdx", resIdx);
		request.setAttribute("fileList", fileList);
		
		request.getRequestDispatcher("/WEB-INF/view/payment/payment.jsp")
		.forward(request, response);
	}
	
	private void insertPaymentSend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resIdx = Integer.parseInt(request.getParameter("resIdx"));
		String paySendTid = request.getParameter("paySendTid");
		String payMethod = request.getParameter("payMethod");
		int payFee = Integer.parseInt(request.getParameter("payFee"));
		String payUserPhone = request.getParameter("payUserPhone");
		
		PaymentSend paymentSend = new PaymentSend();
		
		paymentSend.setResIdx(resIdx);
		paymentSend.setPaySendTid(paySendTid);
		paymentSend.setPayMethod(payMethod);
		paymentSend.setPayFee(payFee);
		paymentSend.setPayUserPhone(payUserPhone);
		
		paymentSendService.insertPaymentSend(paymentSend);
	}
	
	private void payDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/view/payment/payDetail.jsp")
		.forward(request, response);
	}
	
	private void insertPaymentReceive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resIdx = Integer.parseInt(request.getParameter("resIdx"));
		String payReTid = request.getParameter("payReTid");
		int payReFee = Integer.parseInt(request.getParameter("payReFee"));
		Date payReDate = new Date(Long.parseLong(request.getParameter("payReDate"))*1000);
		String payReStatus = request.getParameter("payReStatus");
		String payReErrorCd = request.getParameter("payReErrorCd");
		String payReErrorMsg = request.getParameter("payReErrorMsg");
		String payReYn = request.getParameter("payReYn");
		
		PaymentReceive paymentReceive = new PaymentReceive();
		paymentReceive.setResIdx(resIdx);
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
		
		paymentReceiveService.insertPaymentReceive(paymentReceive);
		
		Reservation reservation = reservationService.selectReservationByResIdx(resIdx);
		
		ReservationHistory reservationHistory = new ReservationHistory();
		reservationHistory.setResIdx(reservation.getResIdx());
		reservationHistory.setUserId(reservation.getUserId());
		reservationHistory.setCarIdx(reservation.getCarIdx());
		reservationHistory.setResState("RH05");	//바로 반납되도록 처리
		
		reservationHistoryService.insertReservationHistory(reservationHistory);
	}

}
