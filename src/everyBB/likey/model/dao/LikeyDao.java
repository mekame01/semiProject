package everyBB.likey.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.likey.model.vo.Likey;
import everyBB.member.model.vo.Member;

public class LikeyDao {

JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public LikeyDao() {
	}
	
	//찜 누르면 tb에 insert되고 찜해제하면 tb에서 delete되고...
	//같은 대상을 반복적으로 할거같다면 update가 좋을거 같고 별로 그런일이 없을거라면 delete가 좋아보이네요
	
	public ArrayList<Likey> LikeyListById(Connection conn,String userId) { //DQL
		ArrayList<Likey> likeyList = new ArrayList<Likey>();
		
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			
			String query = "select * from tb_likey where user_id = ?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Likey likey = new Likey();
				likey.setUserId(rset.getString("user_id"));
				likey.setLikeyIdx(rset.getInt("likey_idx"));
				likey.setCarIdx(rset.getInt("car_idx"));
			
				likeyList.add(likey);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SM01, e);
		}finally {
			jdt.close(rset, pstm);
		}
		return likeyList;
	}
	
	public int insertLikey(Connection conn, Likey likey){
		
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String query = "insert into tb_likey(likey_idx, user_id, car_idx) "
					+"values(sc_likey_idx.nextVal, ?, ?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, likey.getUserId()); //로그인하고 있는 사용자 id
			pstm.setInt(2, likey.getCarIdx()); //클릭한 차 idx
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.IM01,e);
		}finally {
			jdt.close(pstm);
		}
		
		return res;
	}
	
	public int deleteLikey(Connection conn, Likey likey) {
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String query = "delete from tb_likey where user_id = ? and car_idx = ?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, likey.getUserId());
			pstm.setInt(2, likey.getCarIdx());
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(ErrorCode.DM01, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
}
