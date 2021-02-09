package everyBB.reservationHistory.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyBB.reservationHistory.model.service.ReservationHistoryService;
import everyBB.reservationHistory.model.vo.ReservationHistory;

/**
 * Servlet implementation class ReservationHistoryController
 */
@WebServlet("/reservationHistory/*")
public class ReservationHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationHistoryService reservationHistoryService = new ReservationHistoryService();
	
    public ReservationHistoryController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");
		switch (uriArr[uriArr.length-1]) {
			case "insert" : insertReservationHistory(request, response);
				break;
			default: response.setStatus(404);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void insertReservationHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReservationHistory reservationHistory = new ReservationHistory();
		
		int resIdx = Integer.parseInt(request.getParameter("res_idx"));
		String userId = request.getParameter("user_id");
		int carIdx = Integer.parseInt(request.getParameter("car_idx"));
		String resState = request.getParameter("res_state");
		
		reservationHistory.setResIdx(resIdx);
		reservationHistory.setUserId(userId);
		reservationHistory.setCarIdx(carIdx);
		reservationHistory.setResState(resState);
		
		System.out.println(reservationHistory);
		
		reservationHistoryService.insertReservationHistory(reservationHistory);
		
		if(resState.equals("RH04")) {
			request.setAttribute("msg", "예약 수락이 완료되었습니다.");
		}else if(resState.equals("RH09")) {
			request.setAttribute("msg", "예약 거절이 완료되었습니다.");
		}else {
			request.setAttribute("msg", "예약이 뭔가 잘못되었습니다.");
		}
		//마이페이지로 이동
		request.setAttribute("url", "/");
		request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
		.forward(request, response);
	}

}
