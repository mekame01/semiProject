package everyBB.register.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import everyBB.car.model.dao.CarDao;
import everyBB.car.model.service.CarService;
import everyBB.car.model.vo.Car;
import everyBB.common.exception.DataAccessException;
import everyBB.common.exception.ToAlertException;
import everyBB.common.util.file.FileUtil;
import everyBB.common.util.file.FileVo;
import everyBB.member.model.vo.Member;
import everyBB.register.model.service.RegisterService;
import everyBB.register.model.vo.Register;



//import everyBB.common.code.ErrorCode;
//import everyBB.common.exception.ToAlertException;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register/*")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegisterService registerService = new RegisterService();
	private CarService carService = new CarService();  
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
				case "upload": uploadRegister(request,response);
					break;
				case "download": downloadFile(request,response);
					break;	
				
				case "rg_modify": rg_modify(request,response);
					break;	
				case "rg_modifyImpl": rg_modifyImpl(request,response);
					break;		
					
				case "rg_list": rg_list(request,response);
					break;
					
				case "rg_detail": rg_detail(request,response);
					break;
					
				case "rg_delete" : rg_delete(request,response);
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////	
	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/register/register.jsp")
		.forward(request, response);
	}
	
	private void uploadRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		
		registerService.insertRegister(member.getUserId(), request);
		
		request.setAttribute("msg", " 차량 등록이 완료되었습니다.");
		request.setAttribute("url", "/ ");
		request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
		.forward(request, response);
	}
	////////////////////////////////////////////////////////////////////////////////////////////////
	
		private void rg_detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int carIdx = Integer.parseInt(request.getParameter("carIdx")); //형변환
		
			Map<String,Object> commandMap = registerService.selectRegisterDetail(carIdx);
			request.setAttribute("data", commandMap);
			request.getRequestDispatcher("/WEB-INF/view/register/rg_detail.jsp")
			.forward(request, response);
		}
		
		private void downloadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String originFileName = request.getParameter("ofname");
			String renameFileName = request.getParameter("rfname");
			String subPath = request.getParameter("savePath");
			
			response.setHeader("content-disposition", "attachment; filename="+URLEncoder.encode(originFileName,"utf-8"));
			request.getRequestDispatcher("/upload/"+subPath+renameFileName)
			.forward(request, response);
		}
	
	///list/////////////////////////////////////////////////////////////////////////////////////////
	
		   private void rg_list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			      String userId = ((Member)request.getSession().getAttribute("user")).getUserId();
			      List<Car> carList = carService.selectByUserId(userId);
			      List<Map<String, Object>> dataList = new ArrayList<>();
			      
			      System.out.println("carList : " + carList);
			      
			      for (Car car : carList) {
			         Map<String, Object> commandMap = new HashMap<>();
			         Map<String, Object> tempMap = registerService.selectRegisterDetail(car.getCarIdx());
			         dataList.add(tempMap);
			      }
			      
			      request.setAttribute("dataList", dataList);
			      request.getRequestDispatcher("/WEB-INF/view/register/rg_list.jsp")
			      .forward(request, response);
			   } 
	
		 
	
	  
	  
	  
//////////수정///////////////////////////////////////////////////////////////////////////////////////오류남///
	private void rg_modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String userId = ((Member)request.getSession().getAttribute("user")).getUserId();
		int carIdx = Integer.parseInt(request.getParameter("carIdx")); 
		
		Map<String,Object> commandMap = registerService.selectRegisterDetail(carIdx);
		request.setAttribute("data", commandMap);
		
		request.getRequestDispatcher("/WEB-INF/view/register/rg_modify.jsp")
		.forward(request, response);
		
	}
	
	private void rg_modifyImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String,List> registerData = new FileUtil().fileUpload(request);
		Register register = new Register();
		register.setCarIdx(Integer.parseInt(registerData.get("carIdx").get(0).toString()));
		register.setCarParking(registerData.get("carParking").get(0).toString());
		register.setCarParkingLat(Double.parseDouble(registerData.get("carParkingLat").get(0).toString()));
		register.setCarParkingLng(Double.parseDouble(registerData.get("carParkingLng").get(0).toString()));
		register.setCarModel(registerData.get("carModel").get(0).toString());
		register.setCarNumber(registerData.get("carNumber").get(0).toString());
		register.setCarFuelType(registerData.get("carFuelType").get(0).toString());
		register.setCarFuelEffi(Integer.parseInt(registerData.get("carFuelEffi").get(0).toString()));
		register.setCarNavi(registerData.get("carNavi").get(0).toString());
		register.setCarBackCam(registerData.get("carBackCam").get(0).toString());
		register.setCarSeatNum(Integer.parseInt(registerData.get("carSeatNum").get(0).toString()));
		register.setCarDoorNum(Integer.parseInt(registerData.get("carDoorNum").get(0).toString()));
		register.setCarTransmission(registerData.get("carTransmission").get(0).toString());
		register.setCarFee(Integer.parseInt(registerData.get("carFee").get(0).toString()));
		register.setCarNote(registerData.get("carNote").get(0).toString());
		System.out.println(registerData);
		
		registerService.updateRegister(register);
	
		
		request.setAttribute("msg", " 차량 수정이 완료되었습니다.");
		request.setAttribute("url", "/ ");
		request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
		.forward(request, response);
	
		
	
	}

	/////삭제///////////////////////////////////////////////////////////////////////////
	private void rg_delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("user")).getUserId();
		int carIdx = Integer.parseInt(request.getParameter("carIdx"));
		
		Register register = new Register();
		register.setUserId(userId);
		register.setCarIdx(carIdx);
		
		registerService.deleteRegister(register);
		
		//파일삭제
		String typeIdx = request.getParameter("carIdx"); 
		FileVo fileVo = new FileVo();
		fileVo.setTypeIdx(typeIdx);

		registerService.deleteFile(fileVo);
		
		request.setAttribute("msg", " 차량 삭제가 완료되었습니다.");
		request.setAttribute("url", "/ ");
		request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
		.forward(request, response);
		
	}
}
