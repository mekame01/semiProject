package everyBB.likey.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.exception.ToAlertException;
import everyBB.common.template.JDBCTemplate;
import everyBB.likey.model.dao.LikeyDao;
import everyBB.likey.model.vo.Likey;

public class LikeyService {

		LikeyDao likeyDao = new LikeyDao();
		JDBCTemplate jdt = JDBCTemplate.getInstance(); 
		
		public ArrayList<Likey> likeyListById(String userId){
			Connection conn = jdt.getConnection();
			
			ArrayList<Likey> likeyList  = null;
			
			try {
				likeyList = likeyDao.LikeyListById(conn, userId);
			} catch (Exception e) {
				throw new DataAccessException(ErrorCode.SM01, e);
			}finally {
				jdt.close(conn);
			}
			
			return likeyList;
		}
	
		public Likey selectLikeyById(String userId, int carIdx){
			Connection conn = jdt.getConnection();
			
			Likey likey = null;
			
			try {
				likey = likeyDao.selectLikeyById(conn, userId, carIdx);
			} catch (Exception e) {
				throw new DataAccessException(ErrorCode.SM01, e);
			}finally {
				jdt.close(conn);
			}
			
			return likey;
		}
	
		public int insertLikey(Likey likey) {
			Connection conn = jdt.getConnection();
			int res = 0;
			
			try {
				res = likeyDao.insertLikey(conn, likey);
				jdt.commit(conn);
			}catch(DataAccessException e) {
				jdt.rollback(conn);
				throw new ToAlertException(e.error);
			}finally {
				jdt.close(conn);
			}
			
			return res;
			
		}
	
		public int deleteLikey(Likey likey) {
			Connection conn = jdt.getConnection();
			int res = 0;
			try {
				res = likeyDao.deleteLikey(conn, likey);
				 jdt.commit(conn);
			} catch (DataAccessException e) {
				jdt.rollback(conn);
			} finally {
				jdt.close(conn);
			}
			return res;
		}
	
}
