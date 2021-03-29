package com.company.buy.service.impl;

import java.util.List;

import com.company.buy.service.BuyVO;

public interface BuyMapper {
	public int insertMember(BuyVO vo);
	public BuyVO getMember(BuyVO vo);
	public List<BuyVO> getSearchMember(BuyVO vo);
	public int updateMember(BuyVO vo);
	public int deleteMember(BuyVO vo);
}
