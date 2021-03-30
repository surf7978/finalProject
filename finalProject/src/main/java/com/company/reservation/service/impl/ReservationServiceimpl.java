package com.company.reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.reservation.service.ReservationService;
import com.company.reservation.service.ReservationVO;

@Service
public class ReservationServiceimpl implements ReservationService{
	
	@Autowired ReservationMapper ReservationMapper;
	//등록
	@Override
	public int insertReservation(ReservationVO vo) {
		return ReservationMapper.insertReservation(vo);
	}
	//단건조회
	@Override
	public ReservationVO getReservation(ReservationVO vo) {
		return ReservationMapper.getReservation(vo);
	}
	//전체조회
	@Override
	public List<ReservationVO> getSearchReservation(ReservationVO vo) {
		return ReservationMapper.getSearchReservation(vo);
	}
	//수정
	@Override
	public int updateReservation(ReservationVO vo) {
		return ReservationMapper.updateReservation(vo);
	}
	
	//탈퇴
	@Override
	public int deleteReservation(ReservationVO vo) {
		return ReservationMapper.deleteReservation(vo);
	}


}
