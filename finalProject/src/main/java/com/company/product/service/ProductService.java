package com.company.product.service;

import java.util.List;

public interface ProductService {
	public int insertProduct(ProductVO vo);	//제품등록
	public ProductVO getProduct(ProductVO vo);	//단건조회
	public List<ProductVO> getSearchProduct(ProductSearchVO vo);//전체조회
	public int updateProduct(ProductVO vo);	//제품수정
	public int deleteProduct(ProductVO vo);	//제품삭제
	public int getCount(ProductVO vo);// 레코드 조회
	
	public List<ProductVO> getSearchProduct99(ProductVO vo);//홈화면용 전체조회
}
