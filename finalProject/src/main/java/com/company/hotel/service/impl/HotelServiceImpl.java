package com.company.hotel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.hotel.service.HotelService;
import com.company.hotel.service.HotelVO;

@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	HotelMapper hotelMapper;

	// 등록
	@Override
	public void insertHotel(HotelVO vo) {
		hotelMapper.insertHotel(vo);
	}

	// 수정
	@Override
	public void updateHotel(HotelVO vo) {
		hotelMapper.updateHotel(vo);
	}

	// 삭제
	@Override
	public void deleteHotel(HotelVO vo) {
		hotelMapper.deleteHotel(vo);
	}

	// 단건조회
	@Override
	public HotelVO getHotel(HotelVO vo) {
		return hotelMapper.getHotel(vo);
	}

	// 전체조회
	@Override
	public List<HotelVO> getSearchHotel(HotelVO vo) {
		return hotelMapper.getSearchHotel(vo);
	}

}
