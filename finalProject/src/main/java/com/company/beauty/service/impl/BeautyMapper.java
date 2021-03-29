package com.company.beauty.service.impl;

import java.util.List;

import com.company.beauty.service.BeautyVO;

public interface BeautyMapper {
	public int insertBeauty(BeautyVO vo);
	public BeautyVO getBeauty(BeautyVO vo);
	public List<BeautyVO> getSearchBeauty(BeautyVO vo);
	public int updateBeauty(BeautyVO vo);
	public int deleteBeauty(BeautyVO vo);
}
