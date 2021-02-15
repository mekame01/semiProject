package everyBB.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import everyBB.car.model.vo.Car;
import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.likey.model.vo.Likey;
import everyBB.member.model.vo.Member;
import everyBB.reservation.model.vo.Reservation;

public class MemberDao {

JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public MemberDao() {
	}
	
	public Member memberAuthenticate(Connection conn, String userId, String userPwd) {
		Member member = null;
		
		PreparedStatement pstm = null;
		ResultSet rset = null;
	
		try {
		String query = "select * from tb_member where user_id = ? and user_pwd = ?" ;
		pstm = conn.prepareStatement(query);
		
		pstm.setString(1, userId);
		pstm.setString(2, userPwd);
		
		rset = pstm.executeQuery();
		
		
		if(rset.next()) {
			member = new Member(); 

			member.setUserId(rset.getString("user_id"));
			member.setUserPwd(rset.getString("user_pwd"));
			
			member.setUserName(rset.getString("user_name"));
			
			member.setUserPhone(rset.getString("user_phone"));
			member.setUserEmail(rset.getString("user_email"));
			member.setUserLicense(rset.getString("user_license"));
			member.setUserRegDate(rset.getDate("user_reg_date"));
			
			member.setUserIsLeave(rset.getInt("user_is_leave"));
		} 
		
		
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SM01, e); 
		}finally {
			jdt.close(rset, pstm);
		}
		return member;
	}
	
	public Member kakaoMemberAuthenticate(Connection conn, String userId, String userEmail) {
		Member member = null;
		
		PreparedStatement pstm = null;
		ResultSet rset = null;
	
		try {
		String query = "select * from tb_member where user_id = ? and user_email = ?" ;
		pstm = conn.prepareStatement(query);
		
		pstm.setString(1, userId);
		pstm.setString(2, userEmail);
		
		rset = pstm.executeQuery();
		
		
		if(rset.next()) {
			member = new Member(); 

			member.setUserId(rset.getString("user_id"));
			member.setUserPwd(rset.getString("user_pwd"));
			
			member.setUserName(rset.getString("user_name"));
			
			member.setUserPhone(rset.getString("user_phone"));
			member.setUserEmail(rset.getString("user_email"));
			member.setUserLicense(rset.getString("user_license"));
			member.setUserRegDate(rset.getDate("user_reg_date"));
			
			member.setUserIsLeave(rset.getInt("user_is_leave"));
		} 
		
		
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SM01, e); 
		}finally {
			jdt.close(rset, pstm);
		}
		return member;
	}
	
	
	public int insertMember(Connection conn, Member member){
			
			int res = 0;
			PreparedStatement pstm = null;
			
			try {
				String query = "insert into tb_member(user_name, user_id, user_pwd, user_email, user_phone, user_license) "
						+"values(?,?,?,?,?,?)";
				pstm = conn.prepareStatement(query);
				pstm.setString(1, member.getUserName());
				pstm.setString(2, member.getUserId());
				pstm.setString(3,member.getUserPwd());
				pstm.setString(4, member.getUserEmail());
				pstm.setString(5, member.getUserPhone());
				pstm.setString(6, member.getUserLicense());
				
				res = pstm.executeUpdate();
			} catch (SQLException e) {
				throw new DataAccessException(ErrorCode.IM01,e);
			}finally {
				jdt.close(pstm);
			}
			
			return res;
		}
		
	
	public int insertKakaoMember(Connection conn, Member member){
		
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String query = "insert into tb_member(user_name, user_id, user_email) "
					+"values(?,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, member.getUserName());
			pstm.setString(2, member.getUserId());
			pstm.setString(3, member.getUserEmail());
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.IM01,e);
		}finally {
			jdt.close(pstm);
		}
		
		return res;
	}
	
	
	
	public Member selectMemberById(Connection conn,String userId) { //DQL
		Member member = null;
		
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			
			String query = "select * from tb_member where user_id = ?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				member = new Member(); 
				
				member.setUserId(rset.getString("user_id"));
				member.setUserPwd(rset.getString("user_pwd"));
				member.setUserName(rset.getString("user_name"));
				member.setUserPhone(rset.getString("user_phone"));
				member.setUserEmail(rset.getString("user_email"));
				member.setUserLicense(rset.getString("user_license"));
				member.setUserRegDate(rset.getDate("user_reg_date"));
				member.setUserIsLeave(rset.getInt("user_is_leave"));
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SM01, e);
		}finally {
			jdt.close(rset, pstm);
		}
		return member;
	}

	
	
	public int updateMember(Connection conn, Member member) {
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String query = "update tb_member set user_pwd = ?, user_phone = ?, user_license = ? where user_id = ?";
					
			pstm = conn.prepareStatement(query); //쿼리 실행용 객체
			pstm.setString(1, member.getUserPwd());
			pstm.setString(2, member.getUserPhone());
			pstm.setString(3, member.getUserLicense());
			pstm.setString(4, member.getUserId());
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UM01, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	
	

	public List<Car> wishListById(Connection conn,String userId) {
		List<Car> wishList = new ArrayList<>();
		
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			
			String query = "SELECT CAR_IDX, USER_ID, CAR_MODEL, CAR_FEE, CAR_PARKING, CAR_AVG_SCORE FROM TB_CAR "
					+ "WHERE CAR_IDX IN (SELECT CAR_IDX FROM TB_LIKEY WHERE USER_ID = ? )";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Car car = new Car();
				
				car.setCarIdx(rset.getInt("car_idx"));
				car.setUserId(rset.getString("user_id"));
				car.setCarModel(rset.getString("car_model"));
				car.setCarFee(rset.getInt("car_fee"));
				car.setCarParking(rset.getString("car_parking"));
				car.setCarAvgScore(rset.getInt("car_avg_score"));
				
				wishList.add(car);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SC01, e);
		}finally {
			jdt.close(rset, pstm);
		}
		return wishList;
	}
	
	
	
	public List<Reservation> selectPastTripById(Connection conn,String userId) {
		List<Reservation> resPastList= new ArrayList<>();
		
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			
			String query = "select car_idx, res_parking, res_pickup_date, res_return_date, res_fee from tb_reservation where res_idx in "
					+ "(select res_idx from tb_reservation_history where user_id = ? and res_state='RH06')";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Reservation res = new Reservation();
				
				res.setCarIdx(rset.getInt("car_idx"));
				res.setResParking(rset.getString("res_parking"));
				res.setResPickupDate(rset.getDate("res_pickup_date"));
				res.setResReturnDate(rset.getDate("res_return_date"));
				res.setResFee(rset.getInt("res_fee"));
				
				resPastList.add(res);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SC01, e);
		}finally {
			jdt.close(rset, pstm);
		}
		return resPastList;
	}
	
	
	public List<Reservation> selectCurrentTripById(Connection conn,String userId) {
		List<Reservation> resCurrentList= new ArrayList<>();
		
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			
			String query = "select car_idx, res_parking, res_pickup_date, res_return_date, res_fee from tb_reservation where res_idx in "
					+ "(select res_idx from tb_reservation_history where user_id = ? and res_state='RH05')";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Reservation res = new Reservation();
				
				res.setCarIdx(rset.getInt("car_idx"));
				res.setResParking(rset.getString("res_parking"));
				res.setResPickupDate(rset.getDate("res_pickup_date"));
				res.setResReturnDate(rset.getDate("res_return_date"));
				res.setResFee(rset.getInt("res_fee"));
				
				resCurrentList.add(res);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SC01, e);
		}finally {
			jdt.close(rset, pstm);
		}
		return resCurrentList;
	}
	
	
	
	
	
}
