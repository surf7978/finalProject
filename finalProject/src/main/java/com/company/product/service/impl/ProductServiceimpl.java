package com.company.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.product.service.ProductSearchVO;
import com.company.product.service.ProductService;
import com.company.product.service.ProductVO;

@Service
public class ProductServiceimpl implements ProductService{
	
	@Autowired ProductMapper ProductMapper;
	//등록
	@Override
	public int insertProduct(ProductVO vo) {
		return ProductMapper.insertProduct(vo);
	}
	//단건조회
	@Override
	public ProductVO getProduct(ProductVO vo) {
		return ProductMapper.getProduct(vo);
	}
	//전체조회
	@Override
	public List<ProductVO> getSearchProduct(ProductSearchVO vo) {
		return ProductMapper.getSearchProduct(vo);
	}
	//수정
	@Override
	public int updateProduct(ProductVO vo) {
		return ProductMapper.updateProduct(vo);
	}
	
	//탈퇴
	@Override
	public int deleteProduct(ProductVO vo) {
		return ProductMapper.deleteProduct(vo);
	}
	@Override
	public int getCount(ProductVO vo) {
		return ProductMapper.getCount(vo);
	}
	//홈화면용 전체조회
	@Override
	public List<ProductVO> getSearchProduct99(ProductVO vo) {
		return ProductMapper.getSearchProduct99(vo);
	}


}
