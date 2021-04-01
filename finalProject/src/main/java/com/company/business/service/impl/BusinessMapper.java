
package com.company.business.service.impl;

import java.util.List;

import com.company.business.service.BusinessVO;

public interface BusinessMapper {
	public int insertBusiness(BusinessVO vo);

	public BusinessVO getBusiness(BusinessVO vo);

	public List<BusinessVO> getSearchBusiness(BusinessVO vo);

	public int updateBusiness(BusinessVO vo);

	public int deleteBusiness(BusinessVO vo);
}