package com.company.reservation.service;

import java.util.List;
import java.util.Map;


public interface ReservationService {
	public ReservationVO getReservation(ReservationVO vo);	//예약 단건 조회
	public List<ReservationVO> getSearchReservation(ReservationVO vo);	// 회원별 예약리스트 전체조회
	public int updateReservation(ReservationVO vo);	//예약하기(날짜선택 & 결제완료(예약 전)->예약완료로 변경)
	public int deleteReservation(ReservationVO vo);	//예약취소(환불과 연결)
	public int getCount(ReservationVO vo);// 레코드 조회
	
	public List<ReservationVO> getViewReservation(ReservationVO vo); //예약내역 view 조회 구매평등록하기 버튼 클릭시 필요한 값
	public List<ReservationVO> getViewReservation2(ReservationVO vo);	// 사업자번호로 예약리스트 조회
	public List<Map<String, String>> getSearchReservationCalendar(ReservationVO vo); //캘린더조회 for 회원
	public List<Map<String, String>> getSearchReservationCalendar2(ReservationVO vo); //캘린더조회 for 사업자
	
	public int insertReview2(ReservationVO vo);	//리뷰등록시 데이터 업데이트
	
	//결제용 insert
	public int insertPayReservation(ReservationVO vo);
}
