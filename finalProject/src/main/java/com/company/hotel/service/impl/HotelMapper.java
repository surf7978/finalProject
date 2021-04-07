package com.company.hotel.service.impl;

import java.util.List;

import com.company.hotel.service.HotelVO;

public interface HotelMapper {

	public int insertHotel(HotelVO vo);// 상품등록

	public int updateHotel(HotelVO vo);// 상품수정

	public int deleteHotel(HotelVO vo);// 상품삭제

	public HotelVO getHotel(HotelVO vo);// 상세조회

	public List<HotelVO> getSearchHotel(HotelVO vo);// 전체조회

	public int getCount(HotelVO vo);// 레코드 조회

}
