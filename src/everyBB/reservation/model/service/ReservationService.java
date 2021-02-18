package everyBB.reservation.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import everyBB.car.model.vo.Car;
import everyBB.common.code.Code;
import everyBB.common.code.ErrorCode;
import everyBB.common.exception.DataAccessException;
import everyBB.common.mail.MailSender;
import everyBB.common.template.JDBCTemplate;
import everyBB.common.util.http.HttpUtil;
import everyBB.member.model.vo.Member;
import everyBB.reservation.model.dao.ReservationDao;
import everyBB.reservation.model.vo.Reservation;
import everyBB.reservationHistory.model.dao.ReservationHistoryDao;
import everyBB.reservationHistory.model.vo.ReservationHistory;

public class ReservationService {
	private ReservationDao reservationDao = new ReservationDao();
	private ReservationHistoryDao reservationHistoryDao = new ReservationHistoryDao();
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public ReservationService() {
		
	}
	
	public void insertReservation(Reservation reservation) {
		ReservationHistory reservationHistory = new ReservationHistory();
		
		reservationHistory.setCarIdx(reservation.getCarIdx());
		reservationHistory.setUserId(reservation.getUserId());
		reservationHistory.setRegDate(reservation.getResDate());;
		//예약
		reservationHistory.setResState("RH01");
		
		Connection conn = jdt.getConnection();
		try {
			reservationDao.insertReservation(conn, reservation);
			int resIdx = reservationDao.selectReservationResIdx(conn, reservation);
			System.out.println("resIdx : " + resIdx);
			reservationHistory.setResIdx(resIdx);
			reservationHistoryDao.insertReservationHistory(conn, reservationHistory);
			jdt.commit(conn);
		} catch (Exception e) {
			jdt.rollback(conn);
			throw new DataAccessException(ErrorCode.IR01, e);
		} finally {
			jdt.close(conn);
		}
	}
	
	public void authenticateEmail(Member member, Reservation reservation) {
		
		Connection conn = jdt.getConnection();

		int resIdx = 0;
		try {
			resIdx = reservationDao.selectReservationResIdx(conn, reservation);
			System.out.println("resIdx : " + resIdx);
		} catch (Exception e) {
			throw new DataAccessException(ErrorCode.SR01, e);
		} finally {
			jdt.close(conn);
		}

		//POST방식으로 통신해보기
		String subject = "자동차 예약이 도착했습니다!";
		String htmlText = "";
		
		HttpUtil http = new HttpUtil();
		String url = Code.DOMAIN+"/mail";
		//header 저장
		Map<String, String> headers = new HashMap<>();
		headers.put("content-type", "application/x-www-form-urlencoded; charset=utf-8");
		//parameter 저장
		Map<String, String> params = new HashMap<>();
		params.put("mailTemplate", "reservation");
		params.put("resParking", reservation.getResParking());
		params.put("resPickupDate", reservation.getResPickupDate().toString());
		params.put("resReturnDate", reservation.getResReturnDate().toString());
		params.put("resFee", Integer.toString(reservation.getResFee()));
		params.put("resIdx", Integer.toString(resIdx));
		params.put("userId", reservation.getUserId());
		params.put("carIdx", Integer.toString(reservation.getCarIdx()));
		
		htmlText = http.post(url, headers, http.urlEncodedForm(params));
		System.out.println("메일발송 직전");
		System.out.println("member : " + member);
		System.out.println("subject : " + subject);
		System.out.println("htmlText : " + htmlText);
		new MailSender().sendEmail(member.getUserEmail(), subject, htmlText);
		System.out.println("메일발송 직후");
	}
	
	public List<Reservation> selectReservationByCarIdxDate(int carIdx, Date resPickupDate, Date resReturnDate) {
		Connection conn = jdt.getConnection();
		List<Reservation> reservationList = null;
		
		try {
			reservationList = reservationDao.selectReservationByCarIdxDate(conn, carIdx, resPickupDate, resReturnDate);
		} catch (Exception e) {
			throw new DataAccessException(ErrorCode.SR01, e);
		} finally {
			jdt.close(conn);
		}
		return reservationList;
	}
	
	public Reservation selectReservationByResIdx(int resIdx) {
		Connection conn = jdt.getConnection();
		Reservation reservation = null;
		
		try {
			reservation = reservationDao.selectReservationByResIdx(conn, resIdx);
		} catch (Exception e) {
			throw new DataAccessException(ErrorCode.SR01, e);
		} finally {
			jdt.close(conn);
		}
		return reservation;
	}
}
