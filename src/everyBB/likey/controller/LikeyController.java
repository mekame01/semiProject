package everyBB.likey.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyBB.likey.model.service.LikeyService;
import everyBB.likey.model.vo.Likey;
import everyBB.member.model.vo.Member;

@WebServlet("/likey/*")
public class LikeyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LikeyService likeyService = new LikeyService();
       
    public LikeyController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");
		switch (uriArr[uriArr.length-1]) {
			case "insert" : insertLikey(request, response);
				break;
			case "delete" : deleteLikey(request, response);
				break;
			default: response.setStatus(404);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void insertLikey(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("user")).getUserId();
		int carIdx = Integer.parseInt(request.getParameter("car_idx"));
		
		Likey likey = new Likey();
		likey.setUserId(userId);
		likey.setCarIdx(carIdx);
		
		likeyService.insertLikey(likey);
		
		request.setAttribute("msg", "자동차 찜하기가 완료되었습니다.");
		//마이페이지로 이동
		request.setAttribute("back", "back");
		request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
		.forward(request, response);
	}

	private void deleteLikey(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("user")).getUserId();
		int carIdx = Integer.parseInt(request.getParameter("car_idx"));
		
		Likey likey = new Likey();
		likey.setUserId(userId);
		likey.setCarIdx(carIdx);
		
		likeyService.deleteLikey(likey);
		
		request.setAttribute("msg", "자동차 찜하기가 취소되었습니다.");
		//마이페이지로 이동
		request.setAttribute("back", "back");
		request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
		.forward(request, response);
	}

}
