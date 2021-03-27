package com.company.beauty.service.impl;

import java.util.List;

import com.company.beauty.service.BeautyVO;

public interface BeautyMapper {
	public int insertMember(BeautyVO vo);
	public BeautyVO getMember(BeautyVO vo);
	public List<BeautyVO> getSearchMember(BeautyVO vo);
	public int updateMember(BeautyVO vo);
	public int deleteMember(BeautyVO vo);
}
