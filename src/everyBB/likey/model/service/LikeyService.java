package everyBB.likey.model.service;

import java.sql.Connection;
import java.util.ArrayList;

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
			ArrayList<Likey> likeyList = likeyDao.LikeyListById(conn, userId);
			jdt.close(conn);
			return likeyList;
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
