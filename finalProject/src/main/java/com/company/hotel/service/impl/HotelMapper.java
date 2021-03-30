package com.company.hotel.service.impl;

import java.util.List;

import com.company.hotel.service.HotelVO;

public interface HotelMapper {
	public int insertHotel(HotelVO vo);
	public HotelVO getHotel(HotelVO vo);
	public List<HotelVO> getSearchHotel(HotelVO vo);
	public int updateHotel(HotelVO vo);
	public int deleteHotel(HotelVO vo);
}
