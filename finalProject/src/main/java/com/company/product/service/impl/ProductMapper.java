package com.company.product.service.impl;

import java.util.List;

import com.company.product.service.ProductVO;

public interface ProductMapper {
	public int insertMember(ProductVO vo);
	public ProductVO getMember(ProductVO vo);
	public List<ProductVO> getSearchMember(ProductVO vo);
	public int updateMember(ProductVO vo);
	public int deleteMember(ProductVO vo);
}
