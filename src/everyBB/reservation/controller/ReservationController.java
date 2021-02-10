package everyBB.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.ToAlertException;
import everyBB.member.model.service.MemberService;
import everyBB.member.model.vo.Member;
import everyBB.reservation.model.service.ReservationService;
import everyBB.reservation.model.vo.Reservation;

@WebServlet("/reservation/*")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationService reservationService = new ReservationService();
	
    public ReservationController() {
        super();
    }

    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");
		switch (uriArr[uriArr.length-1]) {
			case "insert" : insertReservation(request, response);
				break;
			default: response.setStatus(404);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void insertReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력값 초기화
		Reservation reservation = new Reservation();
		int carIdx = Integer.parseInt(request.getParameter("car_idx"));
		System.out.println("carIdx : " + carIdx);
		String userId = ((Member)request.getSession().getAttribute("user")).getUserId();
		String resParking = request.getParameter("parking");
		Date resDate = new Date(new java.util.Date().getTime());
		
		//Date형식으로 변환
		Date resPickupDate = null;
		Date resReturnDate = null;
		try {
			String tempDate1 = request.getParameter("pickup_date");
			String tempDate2 = request.getParameter("return_date");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddhh");
			String tempHour1 = request.getParameter("pickup_hour");
			if(tempHour1.length()==1) {
				tempHour1 = "0" + tempHour1;
			}
			String strDate1 = tempDate1 + tempHour1;
			System.out.println(strDate1);
			resPickupDate = new Date(sdf.parse(strDate1).getTime());
			
			System.out.println("resPickupDate : " + resPickupDate);
			
			String tempHour2 = request.getParameter("return_hour");
			if(tempHour2.length()==1) {
				tempHour2 = "0" + tempHour2;
			}
			String strDate2 = tempDate2 + tempHour2;
			resReturnDate = new Date(sdf.parse(strDate2).getTime());
			
			System.out.println("resReturnDate : " + resReturnDate);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			throw new ToAlertException(ErrorCode.DATE01, e);
		}
		
		int resFee = Integer.parseInt(request.getParameter("price"));
		String carUserId = request.getParameter("user_id");
		
		reservation.setUserId(userId);
		reservation.setCarIdx(carIdx);
		reservation.setResParking(resParking);
		reservation.setResDate(resDate);
		reservation.setResPickupDate(resPickupDate);
		reservation.setResReturnDate(resReturnDate);
		reservation.setResFee(resFee);
		
		System.out.println("reservation : " + reservation);
		System.out.println("carUserId : " + carUserId);
		
		//예약 가능한지 검증
		List<Reservation> reservationList = reservationService.selectReservationByCarIdxDate(carIdx, resPickupDate, resReturnDate);
		if(reservationList.size() > 0) {
			throw new ToAlertException(ErrorCode.RSRV01);
		}
		
		reservationService.insertReservation(reservation);
		Member member = new MemberService().selectMemberById(carUserId);
		reservationService.authenticateEmail(member, reservation);
		
		request.setAttribute("msg", "예약 등록이 완료되었습니다.");
		//마이페이지로 이동
		request.setAttribute("url", "/");
		request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
		.forward(request, response);
	}
	
}
