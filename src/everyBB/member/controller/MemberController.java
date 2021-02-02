package everyBB.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import everyBB.member.model.service.MemberService;
import everyBB.member.model.vo.Member;

/**
 * Servlet implementation class Why
 */
@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	MemberService memberService = new MemberService();
	
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
		switch(uriArr[uriArr.length-1]) {
		case "join" : join(request, response);
			break;
		case "login" : login(request, response);
			break;
		case "loginimpl" : loginImpl(request, response);
			break;
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
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/member/login.jsp")
		.forward(request, response);
	}
	
	private void loginImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String jsonData = request.getParameter("data"); 
		
		System.out.println("json형식으로 넘어온 데이터 : " + jsonData); 
		
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
	
	
	private void pastTrip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/past_trip.jsp")
		.forward(request, response);
	}
	
	private void currentTrip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/current_trip.jsp")
		.forward(request, response);
	}
	
	private void reservDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/member/mypage/reserv_detail.jsp")
		.forward(request, response);
	}
	
	private void wishList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
	
	
}
