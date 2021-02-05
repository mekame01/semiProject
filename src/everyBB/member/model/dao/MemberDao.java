package everyBB.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.member.model.vo.Member;

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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
