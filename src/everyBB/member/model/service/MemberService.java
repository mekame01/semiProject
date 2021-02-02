package everyBB.member.model.service;

import java.sql.Connection;

import everyBB.common.template.JDBCTemplate;
import everyBB.member.model.dao.MemberDao;
import everyBB.member.model.vo.Member;


public class MemberService {

	MemberDao memberDao = new MemberDao();
	JDBCTemplate jdt = JDBCTemplate.getInstance(); //커넥션만들려면 필요
	
	public Member memberAuthenticate(String userId, String userPwd) {
		Connection conn = jdt.getConnection();
		
		Member member = null;
		try {
			member = memberDao.memberAuthenticate(conn, userId, userPwd);
		}finally {
			jdt.close(conn);
		}
		
		return member;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
