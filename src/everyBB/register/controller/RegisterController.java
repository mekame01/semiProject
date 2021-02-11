package everyBB.register.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		request.setAttribute("alertMsg", " 차량 등록이 완료되었습니다.");
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
	
	////////////////////////////////////////////////////////////////////////////////////////////
	
	
	private void rg_list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		int carIdx = Integer.parseInt(request.getParameter("carIdx")); //형변환
		
		Map<String,Object> commandMap = registerService.selectRegisterDetail(carIdx);
		request.setAttribute("data", commandMap);
		
		request.getRequestDispatcher("/WEB-INF/view/register/rg_list.jsp")
		.forward(request, response);
		
		
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////
	private void rg_modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		int carIdx = Integer.parseInt(request.getParameter("carIdx")); 
		
		Map<String,Object> commandMap = registerService.selectRegisterDetail(carIdx);
		request.setAttribute("data", commandMap);
		
		request.getRequestDispatcher("/WEB-INF/view/register/rg_modify.jsp")
		.forward(request, response);
		
	}
	
	private void rg_modifyImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//HttpSession session = request.getSession();
		//Member member = (Member) session.getAttribute("user");
		//Register register = (Register) session.getAttribute("register");
		//registerService.UpdateRegister(register.getUserId(),register.getCarIdx(), request);
		
		int fIdx = Integer.parseInt(request.getParameter("fIdx"));
		String originFileName = request.getParameter("originFileName");
		String renameFileName = request.getParameter("renameFileName");
		String savePath = request.getParameter("savePath");
		int carIdx = Integer.parseInt(request.getParameter("carIdx"));
		String carParking = request.getParameter("carParking");
		Double carParkingLat = Double.parseDouble(request.getParameter("carParkingLat"));
		Double carParkingLng= Double.parseDouble(request.getParameter("carParkingLng"));
		String carModel= request.getParameter("carModel");
		String carNumber= request.getParameter("carNumber");
		String carFuelType= request.getParameter("carFuelType");
		int carFuelEffi= Integer.parseInt(request.getParameter("carFuelEffi"));
		String carNavi= request.getParameter("carNavi");
		String carBackCam= request.getParameter("carBackCam");
		int carSeatNum= Integer.parseInt(request.getParameter("carSeatNum"));
		int carDoorNum= Integer.parseInt(request.getParameter("carDoorNum"));
		String carTransmission= request.getParameter("carTransmission");
		int carFee= Integer.parseInt(request.getParameter("carFee"));
		String carNote= request.getParameter("carNote");
		
		Register register = new Register();
		FileVo fileVo = new FileVo();//////////
		fileVo.setfIdx(fIdx);
		fileVo.setOriginFileName(originFileName);
		fileVo.setRenameFileName(renameFileName);
		fileVo.setSavePath(savePath);
		register.setCarIdx(carIdx);
		register.setCarParking(carParking);
		register.setCarParkingLat(carParkingLat);
		register.setCarParkingLng(carParkingLng);
		register.setCarModel(carModel);
		register.setCarNumber(carNumber);
		register.setCarFuelType(carFuelType);
		register.setCarFuelEffi(carFuelEffi);
		register.setCarNavi(carNavi);
		register.setCarBackCam(carBackCam);
		register.setCarSeatNum(carSeatNum);
		register.setCarDoorNum(carDoorNum);
		register.setCarTransmission(carTransmission);
		register.setCarFee(carFee);
		register.setCarNote(carNote);
		
		System.out.println("updateRegister register " + register);
		
		
		request.setAttribute("msg", "차량이 수정되었습니다.");
		request.setAttribute("url", "/");
		
		registerService.updateRegister(register, fileVo);
		request.getRequestDispatcher("/WEB-INF/view/register/result.jsp")
		.forward(request, response);
	}

	////////////////////////////////////////////////////////////////////////////////
	private void rg_delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int carIdx = Integer.parseInt(request.getParameter("car_idx"));
		
		Register register = new Register();
		register.setCarIdx(carIdx);
		
		
		registerService.deleteRegister(register);
		
	}
}
