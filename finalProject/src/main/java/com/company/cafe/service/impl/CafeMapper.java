package com.company.cafe.service.impl;

import java.util.List;

import com.company.cafe.service.CafeVO;

public interface CafeMapper {
	public int insertMember(CafeVO vo);
	public CafeVO getMember(CafeVO vo);
	public List<CafeVO> getSearchMember(CafeVO vo);
	public int updateMember(CafeVO vo);
	public int deleteMember(CafeVO vo);
}
