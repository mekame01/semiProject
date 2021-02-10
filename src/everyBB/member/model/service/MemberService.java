package everyBB.member.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import everyBB.common.code.Code;
import everyBB.common.exception.DataAccessException;
import everyBB.common.exception.ToAlertException;
import everyBB.common.mail.MailSender;
import everyBB.common.template.JDBCTemplate;
import everyBB.common.util.http.HttpUtil;
import everyBB.member.model.dao.MemberDao;
import everyBB.member.model.vo.Member;


public class MemberService {

	MemberDao memberDao = new MemberDao();
	JDBCTemplate jdt = JDBCTemplate.getInstance(); 
	
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
	
	public Member kakaoMemberAuthenticate(String userId, String userEmail) {
		Connection conn = jdt.getConnection();
		
		Member member = null;
		try {
			member = memberDao.memberAuthenticate(conn, userId, userEmail);
		}finally {
			jdt.close(conn);
		}
		
		return member;
	}
	
	public int insertMember(Member member){
		Connection conn = jdt.getConnection();
		int res = 0;
		
		try {
			 res = memberDao.insertMember(conn, member);
			jdt.commit(conn);
		}catch(DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		
		return res;
	}
	
	public int insertKakaoMember(Member member){
		Connection conn = jdt.getConnection();
		int res = 0;
		
		try {
			 res = memberDao.insertKakaoMember(conn, member);
			jdt.commit(conn);
		}catch(DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		
		return res;
	}
	
	public Member selectMemberById(String userId) {
		Connection conn = jdt.getConnection();
		Member member = null;
		try {
			member = memberDao.selectMemberById(conn,userId);

		}finally {
			jdt.close(conn);
		}
		return member;
	}
	
	public void authenticateEmail(Member member) {
		String subject = "회원가입을 완료해주세요!";
		String htmlText = "";
		
		HttpUtil http = new HttpUtil();
		String url = Code.DOMAIN+"/mail";
		
		Map<String, String> headers = new HashMap<>();
		headers.put("content-type", "application/x-www-form-urlencoded; charset=utf-8");
		//parameter 저장
		Map<String, String> params = new HashMap<>(); 
		params.put("mailTemplate", "temp_join");
		params.put("userId", member.getUserId());
		
		htmlText = http.post(url, headers, http.urlEncodedForm(params));
		new MailSender().sendEmail(member.getUserEmail(), subject, htmlText);
		
	    new MailSender().sendEmail(member.getUserEmail(), subject, htmlText);
		
	} 
	
	public int updateMember(Member member) {
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = memberDao.updateMember(conn, member);
			jdt.commit(conn);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		
		return res;
	}
	
	
	
	
	
	
	
}
