package everyBB.index.controller;

import java.io.IOException;
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
import everyBB.register.model.service.RegisterService;

/**
 * Servlet implementation class IndexController
 */
@WebServlet("/index")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CarService carService = new CarService();
	private RegisterService registerService = new RegisterService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Car> carList = carService.selectCarOrderByAvgScore();
		List<List<FileVo>> fileList = new ArrayList<>();

		for (Car car : carList) {
			List<FileVo> tempFileList = registerService.selectFileList(car.getCarIdx());
			fileList.add(tempFileList);
		}

		request.setAttribute("carList", carList);
		request.setAttribute("fileList", fileList);

		request.getRequestDispatcher("/WEB-INF/view/index/index.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
