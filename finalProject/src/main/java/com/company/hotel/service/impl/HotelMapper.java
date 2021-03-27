package com.company.hotel.service.impl;

import java.util.List;

import com.company.hotel.service.HotelVO;

public interface HotelMapper {
	public int insertMember(HotelVO vo);
	public HotelVO getMember(HotelVO vo);
	public List<HotelVO> getSearchMember(HotelVO vo);
	public int updateMember(HotelVO vo);
	public int deleteMember(HotelVO vo);
}
