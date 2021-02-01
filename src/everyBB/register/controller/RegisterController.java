package everyBB.register.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import everyBB.common.code.ErrorCode;
//import everyBB.common.exception.ToAlertException;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register/*")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				String[] uriArr = request.getRequestURI().split("/");
				switch (uriArr[uriArr.length-1]) {
				case "guide": guide(request,response);
					break;
				case "host": host(request,response);
					break;
				case "guest": guest(request,response);
					break;	
				case "register": register(request,response);
					break;	
				case "rg_list": rg_list(request,response);
					break;
				case "rg_detail": rg_detail(request,response);
					break;
				case "rg_modify": rg_modify(request,response);
					break;
				
				default: response.setStatus(404);
				}
				}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void guide(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/register/guide.jsp")
		.forward(request, response);
	}
	
	private void host(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/register/host.jsp")
		.forward(request, response);
	}
	
	private void guest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/register/guest.jsp")
		.forward(request, response);
	}
	
	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/register/register.jsp")
		.forward(request, response);
	}
	
	private void rg_list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/register/rg_list.jsp")
		.forward(request, response);
	}
	
	private void rg_detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/register/rg_detail.jsp")
		.forward(request, response);
	}
	
	private void rg_modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/register/rg_modify.jsp")
		.forward(request, response);
	}

}
