package com.company.product.service.impl;

import java.util.List;

import com.company.product.service.ProductSearchVO;
import com.company.product.service.ProductVO;

public interface ProductMapper {
	public int insertProduct(ProductVO vo);
	public ProductVO getProduct(ProductVO vo);
	public List<ProductVO> cartGetProduct(ProductVO vo);	//cart단건조회
	public List<ProductVO> getSearchProduct(ProductSearchVO vo);
	public int updateProduct(ProductVO vo);
	public int deleteProduct(ProductVO vo);
	public int getCount(ProductVO vo);// 레코드 조회
	public List<ProductVO> getSearchProduct99(ProductVO vo);//홈화면용 전체조회
}
