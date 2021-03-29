package com.company.hotel.service;

import java.util.List;

public interface HotelService {
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
