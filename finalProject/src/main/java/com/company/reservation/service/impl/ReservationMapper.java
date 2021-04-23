package com.company.reservation.service.impl;

import java.util.List;
import java.util.Map;

import com.company.reservation.service.ReservationVO;

public interface ReservationMapper {
	public ReservationVO getReservation(ReservationVO vo);
	public int getCount(ReservationVO vo);// 레코드 조회


	public List<ReservationVO> getSearchReservation(ReservationVO vo); //회원별 예약리스트 조회
	public int updateReservation(ReservationVO vo);

	public int deleteReservation(ReservationVO vo);

	public List<ReservationVO> getViewReservation(ReservationVO vo);
	public List<ReservationVO> getViewReservation2(ReservationVO vo);	// 사업자번호로 예약리스트 조회
	public List<Map<String, String>> getSearchReservationCalendar(ReservationVO vo); //캘린더조회 for 회원
	public List<Map<String, String>> getSearchReservationCalendar2(ReservationVO vo); //캘린더조회 for 사업자
	
	public int insertReview2(ReservationVO vo);	//리뷰등록시 데이터 업데이트
	// 결제용 insert
	public int insertPayReservation(ReservationVO vo);
}
