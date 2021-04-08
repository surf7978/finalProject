package com.company.product.service.impl;

import java.util.List;

import com.company.product.service.ProductVO;

public interface ProductMapper {
	public int insertProduct(ProductVO vo);
	public ProductVO getProduct(ProductVO vo);
	public List<ProductVO> getSearchProduct(ProductVO vo);
	public int updateProduct(ProductVO vo);
	public int deleteProduct(ProductVO vo);
	public int getCount(ProductVO vo);// 레코드 조회
}
