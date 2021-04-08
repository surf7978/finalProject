package com.company.hotel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.hotel.service.HotelService;
import com.company.hotel.service.HotelVO;

@Service
public class HotelServiceimpl implements HotelService {

	@Autowired
	HotelMapper HotelMapper;

	// 등록
	@Override
	public int insertHotel(HotelVO vo) {
		return HotelMapper.insertHotel(vo);
	}

	// 수정
	@Override
	public int updateHotel(HotelVO vo) {
		return HotelMapper.updateHotel(vo);
	}

	// 삭제
	@Override
	public int deleteHotel(HotelVO vo) {
		return HotelMapper.deleteHotel(vo);
	}

	// 상세조회
	@Override
	public HotelVO getHotel(HotelVO vo) {
		return HotelMapper.getHotel(vo);
	}

	// 전체조회
	@Override
	public List<HotelVO> getSearchHotel(HotelVO vo) {
		return HotelMapper.getSearchHotel(vo);
	}

	@Override
	public int getCount(HotelVO vo) {
		return HotelMapper.getCount(vo);
	}
}
