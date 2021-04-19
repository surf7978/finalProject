package com.company.bCart.service;

import java.util.List;

import com.company.cart.service.CartVO;

public interface BCartService {
	public int insertBCart(BCartVO vo); // 등록

	public int updateBCart(BCartVO vo); // 수정

	public int deleteBCart(BCartVO vo); // 삭제

	public BCartVO getBCart(BCartVO vo); // 단건조회

	public List<CartVO> getSearchTotalCart(CartVO vo); // 전체조회
}
