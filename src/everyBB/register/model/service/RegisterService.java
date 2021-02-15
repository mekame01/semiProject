package everyBB.register.model.service;

import java.io.File;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import everyBB.common.code.Code;
import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.exception.ToAlertException;
import everyBB.common.template.JDBCTemplate;
import everyBB.common.util.file.FileUtil;
import everyBB.common.util.file.FileVo;
import everyBB.register.model.dao.RegisterDao;
import everyBB.register.model.vo.Register;



public class RegisterService {

		JDBCTemplate jdt = JDBCTemplate.getInstance(); 
		RegisterDao registerDao = new RegisterDao();

/////등록하기/////////////////////////////////////////////////////////////////////////////////
		
		public void insertRegister(String userId, HttpServletRequest request) {
			Connection conn = jdt.getConnection();
			//multipart/formdata 형식의 요청을 처리하고 파라미터와 파일정보를 반환
			Map<String,List> registerData = new FileUtil().fileUpload(request);
			Register register = new Register();
			register.setUserId(userId);
			//register.setCarIdx(Integer.parseInt(registerData.get("carIdx").get(0).toString()));
			register.setCarParking(registerData.get("carParking").get(0).toString());
			register.setCarParkingLat(Double.parseDouble(registerData.get("carParkingLat").get(0).toString()));
			register.setCarParkingLng(Double.parseDouble(registerData.get("carParkingLng").get(0).toString()));
			register.setCarModel(registerData.get("carModel").get(0).toString());
			register.setCarNumber(registerData.get("carNumber").get(0).toString());
			register.setCarFuelType(registerData.get("carFuelType").get(0).toString());
			register.setCarFuelEffi(Integer.parseInt(registerData.get("carFuelEffi").get(0).toString()));
			register.setCarNavi(registerData.get("carNavi").get(0).toString());
			register.setCarBackCam(registerData.get("carBackCam").get(0).toString());
			register.setCarSeatNum(Integer.parseInt(registerData.get("carSeatNum").get(0).toString()));
			register.setCarDoorNum(Integer.parseInt(registerData.get("carDoorNum").get(0).toString()));
			register.setCarTransmission(registerData.get("carTransmission").get(0).toString());
			register.setCarFee(Integer.parseInt(registerData.get("carFee").get(0).toString()));
			register.setCarNote(registerData.get("carNote").get(0).toString());
			System.out.println(registerData);
			
			
			try {
				registerDao.insertRegister(conn, register);
				List<FileVo> files = registerData.get("fileData");
				
				for(FileVo fileVo : files) {
					registerDao.insertFile(conn, fileVo);
				}
				jdt.commit(conn);
			}catch (DataAccessException e) {
				jdt.rollback(conn);
				throw new ToAlertException(e.error,e);
			}finally {
				jdt.close(conn);
			}
		}
		
//////상세보기////////////////////////////////////////////////////////////////////////////////////////
		
		public Map<String,Object> selectRegisterDetail(int carIdx){
			Map<String,Object> commandMap = new HashMap<String,Object>();
			Connection conn = jdt.getConnection();

			try {
				Register register = registerDao.selectRegisterDetail(conn, carIdx);
				List<FileVo> fileList = registerDao.selectFileWithRegister(conn, carIdx);
				commandMap.put("register", register);
				commandMap.put("fileList", fileList);
			}finally {
				jdt.close(conn);
			}
			
			return commandMap;
		}
		
		
		
//////수정하기//////////////////////////////////////////////////////////////////오류/////////////
		public int updateRegister(Register register) {
			Connection conn = jdt.getConnection();
			int res = 0;
			try {
				registerDao.updateRegister(conn, register);
				System.out.println(register);
				jdt.commit(conn);
			}catch (Exception e) {
				jdt.rollback(conn);
				throw new ToAlertException(ErrorCode.rg01,e); //에러코드 수정해야함
			}finally {
				jdt.close(conn);
			}
			return res;
		}
		//파일도 수정
	
		
		
		
		
//list//////////////////////////////////////////////////////////////////////////////////////		
		/* public List<Register> registerList(String userId, int carIdx) {
			Connection conn = jdt.getConnection();
			List<Register> registerList = null;
			
			try {
				registerList = registerDao.registerList(conn, userId, carIdx);
			
			} finally {
				jdt.close(conn);
			}
			return registerList;
		}
		
		*/
		
		
//////삭제////////////////////////////////////////////////////////////////		
		public int deleteRegister(Register register) {
			
			Connection conn = jdt.getConnection();
			int res =0;
			try {
				registerDao.deleteRegister(conn, register);
				
				jdt.commit(conn);
			}catch (Exception e) {
				jdt.rollback(conn);
			}finally {
				jdt.close(conn);
			}
			return res;
		}
		
	//파일삭제
		
		  public int deleteFile(FileVo fileVo) {
		      System.out.println(fileVo);
		      Connection conn = jdt.getConnection();
		      int res = 0;
		      List<FileVo> resList = null;
		      
		      resList = registerDao.selectFileWithRegister(conn, Integer.parseInt(fileVo.getTypeIdx()));
		      System.out.println(resList);
		      for (FileVo fv : resList) {
		         String path = Code.UPLOAD + fv.getSavePath() + fv.getRenameFileName(); 
		         File file = new File(path);
		         file.delete();
		         System.out.println(path);
		      }
		      
		      try {
		         registerDao.deleteFile(conn, fileVo);
		                  
		         jdt.commit(conn);
		      }catch (Exception e) {
		         jdt.rollback(conn);
		      }finally {
		         jdt.close(conn);
		      }
		      return res;
		   }
		
}
