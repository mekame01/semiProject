package everyBB.rent.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyBB.car.model.service.CarService;
import everyBB.car.model.vo.Car;
import everyBB.common.util.file.FileVo;
import everyBB.likey.model.service.LikeyService;
import everyBB.likey.model.vo.Likey;
import everyBB.member.model.vo.Member;
import everyBB.register.model.service.RegisterService;
import everyBB.reservationHistory.model.service.ReservationHistoryService;
import everyBB.reservationHistory.model.vo.ReservationHistory;
import everyBB.review.model.service.ReviewService;
import everyBB.review.model.vo.Review;

@WebServlet("/rent/*")
public class RentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CarService carService = new CarService();
	private ReservationHistoryService reservationHistoryService = new ReservationHistoryService();
	private ReviewService reviewService = new ReviewService();
	private LikeyService likeyService = new LikeyService();
	private RegisterService registerService = new RegisterService();
	
    public RentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");
		switch (uriArr[uriArr.length-1]) {
			case "load" : rentLoad(request, response);
				break;
			case "list" : rentList(request, response);
				break;
			case "detail" : rentDetail(request, response);
				break;
			default: response.setStatus(404);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void rentLoad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String from = "/index";
		selectRentList(request, from);
		request.getRequestDispatcher("/WEB-INF/view/rent/rent_list.jsp")
		.forward(request, response);
	}
	
	private void rentList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String from = "/rent/list";
		selectRentList(request, from);
		request.getRequestDispatcher("/WEB-INF/view/rent/rent_list.jsp")
		.forward(request, response);
	}


	private void rentDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int carIdx = Integer.parseInt(request.getParameter("car_idx"));
		System.out.println("carIdx : " + carIdx);
		Car car = carService.selectByCarIdx(carIdx);
		System.out.println("car : " + car);
		
		List<ReservationHistory> reservationHistoryList = null;
		
		//로그인 되어 있는지 확인
		Member member = ((Member)request.getSession().getAttribute("user"));
		if(member != null) {
			String userId = member.getUserId();
			
			//리뷰 등록이 가능한 상태인지 확인
			reservationHistoryList = reservationHistoryService.selectReservationById(userId, carIdx);
			System.out.println("reservationHistoryList : " + reservationHistoryList);
			
			//Likey 정보 있으면 세팅
			Likey likey = likeyService.selectLikeyById(userId, carIdx);
			System.out.println("likey : " + likey);
			request.setAttribute("likey", likey);
		}
		//등록 되어있는 리뷰목록 조회
		List<Review> reviewList = reviewService.selectReviewByCarIdx(carIdx);
		System.out.println("reviewList : " + reviewList);
		
		//enum 코드 등록
		//결과값에 따라 내비, 백캠 값 세팅 아니면 화면에서 처리
		request.setAttribute("car", car);
		//리뷰 남길 수 있는지 판단용 값 세팅
		request.setAttribute("reservationHistoryList", reservationHistoryList);
		//리뷰 화면에 출력용 값 세팅
		request.setAttribute("reviewList", reviewList);
		
		request.setAttribute("pickup_date", request.getParameter("pickup_date"));
		request.setAttribute("pickup_hour", request.getParameter("pickup_hour"));
		request.setAttribute("return_date", request.getParameter("return_date"));
		request.setAttribute("return_hour", request.getParameter("return_hour"));
		request.getRequestDispatcher("/WEB-INF/view/rent/rent_detail.jsp")
		.forward(request, response);
	}
	
	private void selectRentList(HttpServletRequest request, String from) throws ServletException, IOException {
		try {
			List<List<FileVo>> fileList = new ArrayList<>();
			String tempDate1 = request.getParameter("pickup_date");
			String tempDate2 = request.getParameter("return_date");
			if(from.equals("/index")) {
				//index로부터 넘어온 입력값을 다음 화면에 맞게 세팅
				request.setAttribute("from", "/index");
				String[] tempDate1Arr = tempDate1.split("/");
				tempDate1 = tempDate1Arr[2]+"-"+tempDate1Arr[0]+"-"+tempDate1Arr[1];
				String[] tempDate2Arr = tempDate2.split("/");
				tempDate2 = tempDate2Arr[2]+"-"+tempDate2Arr[0]+"-"+tempDate2Arr[1];
			}else if(from.equals("/rent/list")) {
				//rent입력값
				request.setAttribute("from", "/rent/list");
			}
			//String을 Date로 형변환
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddhh");
			String tempHour1 = request.getParameter("pickup_hour");
			if(tempHour1.length()==1) {
				tempHour1 = "0" + tempHour1;
			}
			String strDate1 = tempDate1 + tempHour1;
			System.out.println(strDate1);
			Date pickupDate = new Date(sdf.parse(strDate1).getTime());
			String tempHour2 = request.getParameter("return_hour");
			if(tempHour1.length()==1) {
				tempHour2 = "0" + tempHour2;
			}
			String strDate2 = tempDate2 + tempHour2;
			System.out.println(strDate2);
			Date returnDate = new Date(sdf.parse(strDate2).getTime());
			
			//입력받은 주소로 Car테이블 조회
			String address = request.getParameter("address");
			String kakaoAddress = request.getParameter("kakaoAddress");
			
			System.out.println("address : " + address);
			System.out.println("kakaoAddress : " + kakaoAddress);
			
			//로그인 되어 있다면 Likey 정보 세팅
			Member member = ((Member)request.getSession().getAttribute("user"));
			if(member != null) {
				String userId = member.getUserId();
				
				List<Likey> likeyList = likeyService.likeyListById(userId);
				System.out.println("likeyList : " + likeyList);
				request.setAttribute("likeyList", likeyList);
			}
			
			//카카오 주소로 찾은 자동차들 정보 세팅
			List<Car> carList = carService.selectByAddress(kakaoAddress, pickupDate, returnDate);
			for (Car car : carList) {
				List<FileVo> tempFileList = registerService.selectFileList(car.getCarIdx());
				fileList.add(tempFileList);
			}
			
			System.out.println(carList);
			request.setAttribute("carList", carList);
			request.setAttribute("fileList", fileList);
			
			//화면에서 필요한 값 초기화용
			request.setAttribute("address", address);
			request.setAttribute("kakaoAddress", kakaoAddress);
			request.setAttribute("pickup_date", tempDate1);
			request.setAttribute("pickup_hour", tempHour1);
			request.setAttribute("return_date", tempDate2);
			request.setAttribute("return_hour", tempHour2);
			request.setAttribute("centerLat", request.getParameter("centerLat"));
			request.setAttribute("centerLng", request.getParameter("centerLng"));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
