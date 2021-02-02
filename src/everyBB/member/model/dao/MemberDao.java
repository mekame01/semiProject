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
		String query = "select * from tb_user where user_id = ? and user_pwd = ?" ;
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
		}
		return member;
	}
	
	
	
}
