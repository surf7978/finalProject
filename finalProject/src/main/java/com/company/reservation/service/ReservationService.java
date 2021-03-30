package com.company.reservation.service;

import java.util.List;

public interface ReservationService {
	public int insertReservation(ReservationVO vo);	//화원탈퇴
	public ReservationVO getReservation(ReservationVO vo);	//단건조회
	public List<ReservationVO> getSearchReservation(ReservationVO vo);	//전체조회
	public int updateReservation(ReservationVO vo);	//회원수정
	public int deleteReservation(ReservationVO vo);	//화원탈퇴
}
