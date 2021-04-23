package com.company.reservation.service.impl;

import java.util.List;
import java.util.Map;

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
	public List<ReservationVO> getViewReservation(ReservationVO vo) {
		return ReservationMapper.getViewReservation(vo);
	}
	// 사업자번호로 예약리스트 조회
	@Override
	public List<ReservationVO> getViewReservation2(ReservationVO vo) {
		return ReservationMapper.getViewReservation2(vo);
	}
	//캘린더조회 for 회원
	@Override
	public List<Map<String, String>> getSearchReservationCalendar(ReservationVO vo) {
		return ReservationMapper.getSearchReservationCalendar(vo);
	}
	//캘린더조회 for 사업자
	@Override
	public List<Map<String, String>> getSearchReservationCalendar2(ReservationVO vo) {
		return ReservationMapper.getSearchReservationCalendar2(vo);
	}

	@Override
	public int insertPayReservation(ReservationVO vo) {
		return ReservationMapper.insertPayReservation(vo);
	}
	//리뷰등록시 데이터 업데이트
	@Override
	public int insertReview2(ReservationVO vo) {
		return ReservationMapper.insertReview2(vo);
	}
	@Override
	public int getCount(ReservationVO vo) {
		return ReservationMapper.getCount(vo);
	}

}
