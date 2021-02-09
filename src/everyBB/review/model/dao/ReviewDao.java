package everyBB.review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.review.model.vo.Review;

public class ReviewDao {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public void insertReview(Connection conn, Review review){
		
		PreparedStatement pstm = null;
		
		try {
			String query = "insert into "
					+ " tb_review(review_idx, res_idx, user_id, car_idx, review_score, review_content, review_date)"
					+ " values(sc_rev_idx.nextval, ?, ?, ?, ?, ?, sysdate)";
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, review.getResIdx());
			pstm.setString(2, review.getUserId());
			pstm.setInt(3, review.getCarIdx());
			pstm.setDouble(4, review.getReviewScore());
			pstm.setString(5, review.getReviewContent());
			
			pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.IW01,e);
		}finally {
			jdt.close(pstm);
		}
	}
	
	public List<Review> selectReviewByCarIdx(Connection conn, int carIdx) {
		List<Review> reviewList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			String query = "select *"
					+ " from tb_review"
					+ " where car_idx = ?"
					+ " order by review_date desc";
			
			//3. 쿼리 실행용 객체 생성
			pstm = conn.prepareStatement(query);
			
			//4. prepareStatement의 쿼리를 완성
			// setString(int idx, String val) : idx번째 물음표에 val를 넣겠다.
			pstm.setInt(1, carIdx);
			
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Review review = new Review();
				review.setReviewIdx(rset.getInt("review_idx"));
				review.setResIdx(rset.getInt("res_idx"));
				review.setUserId(rset.getString("user_id"));
				review.setCarIdx(rset.getInt("car_idx"));
				review.setReviewScore(rset.getDouble("review_score"));
				review.setReviewContent(rset.getString("review_content"));
				review.setReviewDate(rset.getDate("review_date"));
				reviewList.add(review);
			}
			
		//SQLException : db와 통신 중에 발생하는 모든 예외를 담당하는 Exception
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SW01, e);
		} finally {
			jdt.close(rset, pstm);
		}
		return reviewList;
	}
	
	public void updateCarAvgScore(Connection conn, Review review) {
		
		PreparedStatement pstm = null;
		
		try {
			String query = "UPDATE tb_car c"
					+ " SET c.car_avg_score = (SELECT AVG(r.review_score)"
					+ "                          FROM tb_review r "
					+ "                         WHERE r.car_idx = ?"
					+ "                         GROUP BY r.car_idx)"
					+ " WHERE c.car_idx = ?";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, review.getCarIdx());
			pstm.setInt(2, review.getCarIdx());
			
			pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UC01,e);
		}finally {
			jdt.close(pstm);
		}
	}
}
