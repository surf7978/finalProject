package com.company.beauty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.beauty.service.BeautyService;
import com.company.beauty.service.BeautyVO;

@Service
public class BeautyServiceimpl implements BeautyService{
	
	@Autowired BeautyMapper beautyMapper;
	//등록
	@Override
	public int insertBeauty(BeautyVO vo) {
		return beautyMapper.insertBeauty(vo);
	}
	//단건조회
	@Override
	public BeautyVO getBeauty(BeautyVO vo) {
		return beautyMapper.getBeauty(vo);
	}
	//전체조회
	@Override
	public List<BeautyVO> getSearchBeauty(BeautyVO vo) {
		return beautyMapper.getSearchBeauty(vo);
	}
	//수정
	@Override
	public int updateBeauty(BeautyVO vo) {
		return beautyMapper.updateBeauty(vo);
	}
	
	//탈퇴
	@Override
	public int deleteBeauty(BeautyVO vo) {
		return beautyMapper.deleteBeauty(vo);
	}


}
