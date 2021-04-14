package com.company.cart.service.impl;

import java.util.List;

import com.company.cart.service.CartVO;

public interface CartMapper {
	public int insertCart(CartVO vo); // 장바구니 등록

	public int updateCart(CartVO vo); // 장바구니 수정

	public int deleteCart(CartVO vo); // 장바구니 삭제

	public CartVO getCart(CartVO vo); // 장바구니 상세조회

	public List<CartVO> getSearchCart(CartVO vo); // 장바구니전체조회
}
