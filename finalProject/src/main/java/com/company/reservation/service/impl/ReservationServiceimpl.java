package com.company.reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.reservation.service.ReservationService;
import com.company.reservation.service.ReservationVO;

@Service
public class ReservationServiceimpl implements ReservationService{
	
	@Autowired ReservationMapper ReservationMapper;

	@Override
	public ReservationVO getReservation(ReservationVO vo) {
		return ReservationMapper.getReservation(vo);
	}
	//회원별 예약리스트 조회
	@Override
	public List<ReservationVO> getSearchReservation(ReservationVO vo) {
		return ReservationMapper.getSearchReservation(vo);
	}
	//예약수정(날짜선택 & 결제완료(예약 전)->예약완료로 변경)
	@Override
	public int updateReservation(ReservationVO vo) {
		return ReservationMapper.updateReservation(vo);
	}
	
	@Override
	public int deleteReservation(ReservationVO vo) {
		return ReservationMapper.deleteReservation(vo);
	}
	@Override
	public ReservationVO getViewReservation(ReservationVO vo) {
		return ReservationMapper.getViewReservation(vo);
	}
	// 사업자번호로 예약리스트 조회
	@Override
	public List<ReservationVO> getViewReservation2(ReservationVO vo) {
		return ReservationMapper.getViewReservation2(vo);
	}

}
