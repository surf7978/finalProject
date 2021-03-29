package com.company.reservation.service.impl;

import java.util.List;

import com.company.reservation.service.ReservationVO;

public interface ReservationMapper {
	public int insertMember(ReservationVO vo);
	public ReservationVO getMember(ReservationVO vo);
	public List<ReservationVO> getSearchMember(ReservationVO vo);
	public int updateMember(ReservationVO vo);
	public int deleteMember(ReservationVO vo);
}
