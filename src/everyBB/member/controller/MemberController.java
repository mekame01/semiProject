package everyBB.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import everyBB.car.model.vo.Car;
import everyBB.likey.model.service.LikeyService;
import everyBB.likey.model.vo.Likey;
import everyBB.member.model.service.MemberService;
import everyBB.member.model.vo.Member;
import everyBB.reservation.model.vo.Reservation;

/**
 * Servlet implementation class Why
 */
@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	MemberService memberService = new MemberService();
	LikeyService likeyService = new LikeyService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");
		switch(uriArr[2]) {
		case "join" : join(request, response);
			break;
		case "idcheck" : confirmId(request, response);
			break;
		case "mailauth" : authenticateEmail(request, response);
			break;	
		case "joinimpl" : joinImpl(request, response);
			break;
		case "login" : login(request, response);
			break;
		case "loginimpl" : loginImpl(request, response);
			break;
		case "kakao" : kakaoLogin(request, response);
			break;
		case "mypage" : 
			switch(uriArr[uriArr.length-1]) {
			case "past" : pastTrip(request, response);
				break;
			case "current" : currentTrip(request, response);
				break;
			case "reservdetail" : reservDetail(request, response);
				break;
			case "wishlist" : wishList(request, response);
				break;
			case "userinfo" : userInfo(request, response);
				break;
			case "userinfomodify" : userInfoModify(request, response);
				break;
			case "userinfomodifyimpl" : userInfoModifyImpl(request, response);
				break;
			
			default : response.setStatus(404);
			} break;
			case "logout" : logout(request, response);
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
	
	private void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/member/join.jsp")
		.forward(request, response);
	}
	
	private void confirmId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		
		Member member = memberService.selectMemberById(userId);
		
		
		if(member != null) { 
			response.getWriter().print("fail"); //응답바디에 fail 작성
		}else { 
			response.getWriter().print("success"); //응답바디에 success 작성
		}
		
	}
	
private void authenticateEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("name");
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pw");
		String userPhone = request.getParameter("tell");
		String userEmail = request.getParameter("email");
		String userLicense = request.getParameter("license");
		
		Member member = new Member();
		member.setUserName(userName);
		member.setUserId(userId);
		member.setUserPwd(userPwd);
		member.setUserPhone(userPhone);
		member.setUserEmail(userEmail);
		member.setUserLicense(userLicense);
		
		
		memberService.authenticateEmail(member);
		
		request.getSession().setAttribute("persistUser", member);
		
		request.setAttribute("msg", "회원가입 완료를 위한 이메일이 발송되었습니다.");
		request.setAttribute("url", "/member/login");
		request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
		.forward(request, response);
		
	}
	
	
	private void joinImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member member = (Member) request.getSession().getAttribute("persistUser");
		
		memberService.insertMember(member);
		
		request.setAttribute("msg", "회원가입을 축하드립니다.");
		request.setAttribute("url", "/member/login");
		request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
		.forward(request, response);
		
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/member/login.jsp")
		.forward(request, response);
	}
	
	private void loginImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String jsonData = request.getParameter("data"); 
		
		Gson gson = new Gson();
		Map<String, Object> jsonMap = gson.fromJson(jsonData, Map.class); 
		String userId = (String) jsonMap.get("id");
		String userPwd = (String) jsonMap.get("pw");
		
		for(String key : jsonMap.keySet()) {
			System.out.println(key + " : " + jsonMap.get(key).getClass());
		} 
	
		Map<String, Object> jsonMapT = (Map<String, Object>)jsonMap.get("jsonObj");
		System.out.println(jsonMapT);
		
		
		
		Member member = memberService.memberAuthenticate(userId, userPwd);
		
				if(member != null) {
					request.getSession().setAttribute("user", member);
					response.getWriter().print("success");
				}else {
					response.getWriter().print("fail");
				}
			
	} 
	
	private void kakaoLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jsonData = request.getParameter("data"); 
		Gson gson = new Gson();
	      Map<String, Object> jsonMap = gson.fromJson(jsonData, Map.class);
	      
	      String userId = Double.toString((double)jsonMap.get("id"));
	      String userName = (String) jsonMap.get("name");
	      String userEmail = (String) jsonMap.get("email");
		
	      Member member = memberService.kakaoMemberAuthenticate(userId, userEmail);
			
			if(member != null) {
				
				request.getSession().setAttribute("user", member);
				response.getWriter().print("success");
			}else {
				
				member = new Member();
				member.setUserId(userId);
				member.setUserName(userName);
				member.setUserEmail(userEmail);
				
				memberService.insertKakaoMember(member);
				request.getSession().setAttribute("user", member);
				response.getWriter().print("success");

			}
	      
	      
		
	}
	
	
	private void pastTrip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		
		List<Reservation> pastList = memberService.selectPastTripById(member.getUserId());
		
		request.setAttribute("pastList", pastList);
		
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/past_trip.jsp")
		.forward(request, response);
	}
	
	private void currentTrip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		
		List<Reservation> currentList = memberService.selectCurrentTripById(member.getUserId());
		
		request.setAttribute("currentList", currentList);
		
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/current_trip.jsp")
		.forward(request, response);
	}
	
	private void reservDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/reserv_detail.jsp")
		.forward(request, response);
	}
	
	private void wishList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		
		List<Car> wishList = memberService.wishListById(member.getUserId());
		
		request.setAttribute("wishList", wishList);
		
		
		
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/wishlist.jsp")
		.forward(request, response);
	}
	
	
	
	private void userInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/user_info.jsp")
		.forward(request, response);
	}
	
	private void userInfoModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/user_info_modify.jsp")
		.forward(request, response);
	}
	
	private void userInfoModifyImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String userId = (String) Session.getAttribute("id"); 
		//((Member) request.getSession().getAttribute("user")).getUserId(); 
		String userPwd = request.getParameter("pw");
		String userPhone = request.getParameter("tell");
		String userLicense = request.getParameter("license");
		
		Member member = (Member) request.getSession().getAttribute("user"); 
		
		member.setUserPwd(userPwd);
		member.setUserPhone(userPhone);
		member.setUserLicense(userLicense);
		
		memberService.updateMember(member);
		
		request.setAttribute("msg", "회원정보 변경이 완료되었습니다.");
		request.setAttribute("url", "/member/mypage/userinfo");
		
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/user_info.jsp")
		.forward(request, response);
	}
	
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getSession().removeAttribute("user");
		response.sendRedirect("/");  
		
	}
	
	
	
	
}
