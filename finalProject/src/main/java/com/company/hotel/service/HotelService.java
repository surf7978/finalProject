package com.company.hotel.service;

import java.util.List;

public interface HotelService {
	public int insertHotel(HotelVO vo); // 화원등록

	public HotelVO getHotel(HotelVO vo); // 단건조회

	public List<HotelVO> getSearchHotel(HotelVO vo); // 전체조회

	public int updateHotel(HotelVO vo); // 회원수정

	public int deleteHotel(HotelVO vo); // 화원탈퇴
}
