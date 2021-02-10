package everyBB.review.model.service;

import java.sql.Connection;
import java.util.List;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.reservationHistory.model.dao.ReservationHistoryDao;
import everyBB.reservationHistory.model.vo.ReservationHistory;
import everyBB.review.model.dao.ReviewDao;
import everyBB.review.model.vo.Review;

public class ReviewService {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	ReviewDao reviewDao = new ReviewDao();
	ReservationHistoryDao reservationHistoryDao = new ReservationHistoryDao(); 

	public ReviewService() {
		
	}
	
	public void insertReview(Review review) {
		Connection conn = jdt.getConnection();
		
		ReservationHistory reservationHistory = new ReservationHistory();
		reservationHistory.setResIdx(review.getResIdx());
		reservationHistory.setUserId(review.getUserId());
		reservationHistory.setCarIdx(review.getCarIdx());
		//리뷰남김
		reservationHistory.setResState("RH06");
		
		try {
			reviewDao.insertReview(conn, review);
			reviewDao.updateCarAvgScore(conn, review);
			reservationHistoryDao.insertReservationHistory(conn, reservationHistory);
			jdt.commit(conn);
		}catch (Exception e) {
			jdt.rollback(conn);
			throw new DataAccessException(ErrorCode.IW01, e);
		}finally {
			jdt.close(conn);
		}
	}

	public List<Review> selectReviewByCarIdx(int carIdx) {
		Connection conn = jdt.getConnection();
		List<Review> reviewList = null;
		try {
			reviewList = reviewDao.selectReviewByCarIdx(conn, carIdx);
		}catch (Exception e) {
			throw new DataAccessException(ErrorCode.SW01, e);
		}finally {
			jdt.close(conn);
		}
		return reviewList;
	}

	public void updateReview(Review review) {
		Connection conn = jdt.getConnection();
		
		try {
			reviewDao.updateReview(conn, review);
			reviewDao.updateCarAvgScore(conn, review);
			jdt.commit(conn);
		}catch (Exception e) {
			jdt.rollback(conn);
			throw new DataAccessException(ErrorCode.UW01, e);
		}finally {
			jdt.close(conn);
		}
	}

	public void deleteReview(Review review) {
		Connection conn = jdt.getConnection();
		
		try {
			reviewDao.deleteReview(conn, review);
			reviewDao.updateCarAvgScore(conn, review);
			jdt.commit(conn);
		}catch (Exception e) {
			jdt.rollback(conn);
			throw new DataAccessException(ErrorCode.UW01, e);
		}finally {
			jdt.close(conn);
		}
	}
}
