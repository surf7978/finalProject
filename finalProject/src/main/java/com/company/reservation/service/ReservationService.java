package com.company.reservation.service;

import java.util.List;

public interface ReservationService {
	public int insertReservation(ReservationVO vo);	//예약하기
	public ReservationVO getReservation(ReservationVO vo);	//예약 단건 조회
	public List<ReservationVO> getSearchReservation(ReservationVO vo);	//예약리스트 전체조회
	public int updateReservation(ReservationVO vo);	//예약수정
	public int deleteReservation(ReservationVO vo);	//예약취소(환불과 연결)
	
	public ReservationVO getViewReservation(ReservationVO vo); //뷰 조회
	public ReservationVO getViewReservation2(ReservationVO vo);
}
