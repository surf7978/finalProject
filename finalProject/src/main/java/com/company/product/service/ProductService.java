package com.company.product.service;

import java.util.List;

public interface ProductService {
	public int insertProduct(ProductVO vo);	//화원탈퇴
	public ProductVO getProduct(ProductVO vo);	//단건조회
	public List<ProductVO> getSearchProduct(ProductVO vo);	//전체조회
	public int updateProduct(ProductVO vo);	//회원수정
	public int deleteProduct(ProductVO vo);	//화원탈퇴
}
