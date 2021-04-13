package com.company.reservation.service.impl;

import java.util.List;

import com.company.reservation.service.ReservationVO;

public interface ReservationMapper {
	public ReservationVO getReservation(ReservationVO vo);
	public List<ReservationVO> getSearchReservation(ReservationVO vo); //회원별 예약리스트 조회
	public int updateReservation(ReservationVO vo);

	public int deleteReservation(ReservationVO vo);

	public ReservationVO getViewReservation(ReservationVO vo);
	public List<ReservationVO> getViewReservation2(ReservationVO vo);	// 사업자번호로 예약리스트 조회
 
	// 결제용 insert
	public int insertPayReservation(ReservationVO vo);
}
