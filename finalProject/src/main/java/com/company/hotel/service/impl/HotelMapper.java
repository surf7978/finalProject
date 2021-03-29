package com.company.hotel.service.impl;

import java.util.List;

import com.company.hotel.service.HotelVO;

public interface HotelMapper {
	// 등록
	public void insertHotel(HotelVO vo);

	// 수정
	public void updateHotel(HotelVO vo);

	// 삭제
	public void deleteHotel(HotelVO vo);

	// 단건조회
	public HotelVO getHotel(HotelVO vo);

	// 전체조회
	public List<HotelVO> getSearchHotel(HotelVO vo);
}
