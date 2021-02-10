package everyBB.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyBB.member.model.vo.Member;
import everyBB.review.model.service.ReviewService;
import everyBB.review.model.vo.Review;

/**
 * Servlet implementation class ReviewController
 */
@WebServlet("/review/*")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReviewService reviewService = new ReviewService();
       
    public ReviewController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");
		switch (uriArr[uriArr.length-1]) {
			case "insert" : insertReview(request, response);
				break;
			case "update" : updateReview(request, response);
				break;
			case "delete" : deleteReview(request, response);
				break;
			default: response.setStatus(404);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void insertReview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("user")).getUserId();
		int resIdx = Integer.parseInt(request.getParameter("res_idx"));
		int carIdx = Integer.parseInt(request.getParameter("car_idx"));
		double reviewScore = Double.parseDouble(request.getParameter("review_score"));
		String reviewContent = request.getParameter("review_content");
		
		Review review = new Review();
		review.setResIdx(resIdx);
		review.setUserId(userId);
		review.setCarIdx(carIdx);
		review.setReviewScore(reviewScore);
		review.setReviewContent(reviewContent);
		
		System.out.println("insertReview review " + review);
		
		reviewService.insertReview(review);
	}

	private void updateReview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewIdx = Integer.parseInt(request.getParameter("review_idx"));
		int carIdx = Integer.parseInt(request.getParameter("car_idx"));
		Double reviewScore = Double.parseDouble(request.getParameter("review_score"));
		String reviewContent = request.getParameter("review_content");
		
		Review review = new Review();
		review.setReviewIdx(reviewIdx);
		review.setCarIdx(carIdx);
		review.setReviewScore(reviewScore);
		review.setReviewContent(reviewContent);
		
		System.out.println("updateReview review " + review);
		
		reviewService.updateReview(review);
	}

	private void deleteReview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewIdx = Integer.parseInt(request.getParameter("review_idx"));
		int carIdx = Integer.parseInt(request.getParameter("car_idx"));
		
		Review review = new Review();
		review.setReviewIdx(reviewIdx);
		review.setCarIdx(carIdx);
		
		System.out.println("deleteReview review " + review);
		
		reviewService.deleteReview(review);
	}
}
