package com.company.bCart.service.impl;

import java.util.List;

import com.company.bCart.service.BCartVO;

public interface BCartMapper {
	public int insertMember(BCartVO vo);
	public BCartVO getMember(BCartVO vo);
	public List<BCartVO> getSearchMember(BCartVO vo);
	public int updateMember(BCartVO vo);
	public int deleteMember(BCartVO vo);
}
