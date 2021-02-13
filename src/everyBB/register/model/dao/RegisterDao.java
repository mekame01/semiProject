package everyBB.register.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.template.JDBCTemplate;
import everyBB.common.util.file.FileVo;
import everyBB.register.model.vo.Register;


public class RegisterDao {

JDBCTemplate jdt = JDBCTemplate.getInstance();

////등록//////////////////////////////////////////////////////////////////////////////////////
	//자동차 등록
	public void insertRegister(Connection conn, Register register) {
			String sql = "insert into tb_car "
					+ "(car_idx,user_id,car_parking,car_parking_lat,car_parking_lng,car_model,car_number,car_fuel_type,car_fuel_effi,car_navi,car_back_cam,car_seat_num,car_door_num,car_transmission,car_fee,car_note) "
					+ "values(sc_car_idx.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstm = null;
			try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, register.getUserId());
			pstm.setString(2, register.getCarParking());
			pstm.setDouble(3, register.getCarParkingLat());
			pstm.setDouble(4, register.getCarParkingLng());
			pstm.setString(5, register.getCarModel());
			pstm.setString(6, register.getCarNumber());
			pstm.setString(7, register.getCarFuelType());
			pstm.setInt(8, register.getCarFuelEffi());
			pstm.setString(9, register.getCarNavi());
			pstm.setString(10, register.getCarBackCam());
			pstm.setInt(11, register.getCarSeatNum());
			pstm.setInt(12, register.getCarDoorNum());
			pstm.setString(13, register.getCarTransmission());
			pstm.setInt(14, register.getCarFee());
			pstm.setString(15, register.getCarNote());
			
			pstm.executeUpdate();
		
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.rg02,e);
		}finally {
			jdt.close(pstm);
		}	
	}
	
	
	

	//파일테이블에 파일메타정보 저장
		public void insertFile(Connection conn, FileVo fileVo) {
			String typeIdx = "";
			//1. 새로 등록되는 게시글의 파일정보를 저장
			// typeIdx의 값이 sequence의 currval
			if(fileVo.getTypeIdx() == null) {
				typeIdx = "sc_car_idx.currval"; 
			}else {
				typeIdx = "'" + fileVo.getTypeIdx() + "'"; 
			}
			
			String sql = "insert into tb_file "
					+ "(f_idx,type_idx,origin_file_name,rename_file_name,save_path) "
					+ "values(sc_file_idx.nextval,"+typeIdx+",?,?,?)";
			
			PreparedStatement pstm = null;
			try {
				pstm = conn.prepareStatement(sql);
				pstm.setString(1,fileVo.getOriginFileName());
				pstm.setString(2,fileVo.getRenameFileName());
				pstm.setString(3,fileVo.getSavePath());
				pstm.executeUpdate();
			} catch (SQLException e) {
				throw new DataAccessException(ErrorCode.IF01, e);
			}finally {
				jdt.close(pstm);
			}
		}
		
/////상세보기////////////////////////////////////////////////////////////////////////////////////////	
		//자동차 상세
		public Register selectRegisterDetail(Connection conn, int carIdx) {
			Register register = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			String sql = "select "
					+ "car_idx,user_id,car_parking,car_model,car_number,car_fuel_type,car_fuel_effi,car_navi,car_back_cam,car_seat_num,car_door_num,car_transmission,car_fee,car_note "
					+ "from tb_car "
					+ "where car_idx = ? ";
			try {
				pstm = conn.prepareStatement(sql);
				pstm.setInt(1, carIdx);
				rs = pstm.executeQuery();
				
				if(rs.next()) {
					register = new Register();
					register.setCarIdx(rs.getInt(1));
					register.setUserId(rs.getString(2));
					register.setCarParking(rs.getString(3));
					register.setCarModel(rs.getString(4));
					register.setCarNumber(rs.getString(5));
					register.setCarFuelType(rs.getString(6));
					register.setCarFuelEffi(rs.getInt(7));
					register.setCarNavi(rs.getString(8));
					register.setCarBackCam(rs.getString(9));
					register.setCarSeatNum(rs.getInt(10));
					register.setCarDoorNum(rs.getInt(11));
					register.setCarTransmission(rs.getString(12));
					register.setCarFee(rs.getInt(13));
					register.setCarNote(rs.getString(14));
				
					
				}
			} catch (SQLException e) {
				throw new DataAccessException(ErrorCode.rg03, e);
			}finally {
				jdt.close(rs, pstm);
			}
			
			return register;
		}
		

	
		//자동차 파일 정보
		public List<FileVo> selectFileWithRegister(Connection conn, int carIdx){
			
			List<FileVo> res = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			String sql ="select "
					+ "f_idx,type_idx,origin_file_name,rename_file_name,save_path,reg_date,is_del "
					+ "from tb_file "
					+ "where type_idx = ?";
			
			try {
				res = new ArrayList<FileVo>();
				pstm = conn.prepareStatement(sql);
				pstm.setInt(1, carIdx);
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					FileVo fileVo = new FileVo();
					fileVo.setfIdx(rs.getInt(1));
					fileVo.setTypeIdx(rs.getString(2));
					fileVo.setOriginFileName(rs.getString(3));
					fileVo.setRenameFileName(rs.getString(4));
					fileVo.setSavePath(rs.getString(5));
					fileVo.setRegDate(rs.getDate(6));
					fileVo.setIsDel(rs.getInt(7));
					res.add(fileVo);
				}
			} catch (SQLException e) {
				throw new DataAccessException(ErrorCode.SF01,e);
			}finally {
				jdt.close(rs,pstm);
			}
			
			return res;
		}
		
	
/////////수정/////////////////////////////////////////////////////////////////////////////////////////////////
		//자동차 수정
		
		public int updateRegister(Connection conn, Register register) {
			int res = 0;
			PreparedStatement pstm = null;
			
			try {
				String sql = "update tb_car set "
						+ "(car_parking = ?,car_parking_lat = ?,car_parking_lng = ?,car_model = ?,car_number = ?,car_fuel_type = ?,car_fuel_effi = ?,car_navi = ?,car_back_cam = ?,car_seat_num = ?,car_door_num = ?,car_transmission = ?,car_fee = ?,car_note = ? ) "
						+ "where car_Idx = ?";
				
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, register.getCarParking());
			pstm.setDouble(2, register.getCarParkingLat());
			pstm.setDouble(3, register.getCarParkingLng());
			pstm.setString(4, register.getCarModel());
			pstm.setString(5, register.getCarNumber());
			pstm.setString(6, register.getCarFuelType());
			pstm.setInt(7, register.getCarFuelEffi());
			pstm.setString(8, register.getCarNavi());
			pstm.setString(9, register.getCarBackCam());
			pstm.setInt(10, register.getCarSeatNum());
			pstm.setInt(11, register.getCarDoorNum());
			pstm.setString(12, register.getCarTransmission());
			pstm.setInt(13, register.getCarFee());
			pstm.setString(14, register.getCarNote());
			pstm.setInt(15, register.getCarIdx());
			
			res = pstm.executeUpdate();
		
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.rg02,e); //
		}finally {
			jdt.close(pstm);
		}	
		return res;
	}
	
	
	//파일 수정.. 다시.. Map..????????????????
		public void updateFile(Connection conn, FileVo fileVo) {
			String typeIdx = "";
			//1. 새로 등록되는 게시글의 파일정보를 저장
			// typeIdx의 값이 sequence의 currval
			if(fileVo.getTypeIdx() == null) {
				typeIdx = "sc_car_idx.currval"; /////////////////////////////
			}else {
				typeIdx = "'" + fileVo.getTypeIdx() + "'"; 
			}
			
			String sql = "update tb_file set "
		               + "(origin_file_name = ?,rename_file_name = ?,save_path = ?) "
		               + "where f_idx = ?";
					
			PreparedStatement pstm = null;
			try {
				pstm = conn.prepareStatement(sql);
				pstm.setString(1,fileVo.getOriginFileName());
				pstm.setString(2,fileVo.getRenameFileName());
				pstm.setString(3,fileVo.getSavePath());
				pstm.setInt(4, fileVo.getfIdx()); /////////??
				
				pstm.executeUpdate();
			} catch (SQLException e) {
				throw new DataAccessException(ErrorCode.rg01, e);
			}finally {
				jdt.close(pstm);
			}
		}
		
		
		
		
	////list///////////////////////////////////////////////////////////////////////////////////////////
		public List<Register> registerList(Connection conn, String userId, int carIdx) {
			PreparedStatement pstm = null;
			ResultSet rset = null;
			List<Register> registerList = new ArrayList<>();
			
			try {
				String query = "select *"
						+ " from tb_car "
						+ " where userId = ?";//////////////오류
						
				pstm = conn.prepareStatement(query);
				
				pstm.setString(1, userId);
				pstm.setInt(2,carIdx);
				
				rset = pstm.executeQuery();
				
				while(rset.next()) {
					Register register = new Register();
					register.setCarIdx(rset.getInt("car_idx"));
					register.setUserId(rset.getString("user_id"));
					register.setCarModel(rset.getString("car_model"));
					register.setCarDoorNum(rset.getInt("car_door_num"));
					register.setCarSeatNum(rset.getInt("car_seat_num"));
					register.setCarFee(rset.getInt("car_fee"));
					
				}
				
			} catch (SQLException e) {
				throw new DataAccessException(ErrorCode.rg01, e);//에러코드 고쳐야함
			} finally {
				jdt.close(rset, pstm);
			}
			return registerList;
		}
		
		
	////삭제//////////////////////////////////////////////////////////////////////////////////////////	
		//차량등록 삭제
		public int deleteRegister(Connection conn, Register register) {
			int res = 0;
			PreparedStatement pstm = null;
			
			try {
			String sql = "delete from tb_car where user_id = ? and car_idx = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, register.getUserId());
			pstm.setInt(2, register.getCarIdx());
			
			res = pstm.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(ErrorCode.rg02,e); //오류 고쳐야함
		}finally {
			jdt.close(pstm);
		}	
			return res;
	}

	//파일삭제 //흠..........아닌거같음 Map..
		
public int deleteFile(Connection conn, FileVo fileVo){
			
			int res = 0;
			PreparedStatement pstm = null;
			
			try {
				String sql ="delete from tb_file where type_idx = ?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, fileVo.getTypeIdx());
				
				res = pstm.executeUpdate();
				
			} catch (SQLException e) {
				throw new DataAccessException(ErrorCode.rg02,e);
			}finally {
				jdt.close(pstm);
			}
			return res;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
	


