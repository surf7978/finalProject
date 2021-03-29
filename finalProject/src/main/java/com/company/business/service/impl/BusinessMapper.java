package com.company.business.service.impl;

import java.util.List;

import com.company.business.service.BusinessVO;

public interface BusinessMapper {
	public int insertMember(BusinessVO vo);
	public BusinessVO getMember(BusinessVO vo);
	public List<BusinessVO> getSearchMember(BusinessVO vo);
	public int updateMember(BusinessVO vo);
	public int deleteMember(BusinessVO vo);
}
