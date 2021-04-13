package com.company.cart.service;

import java.util.List;

public interface CartService {
	public int insertCart(CartVO vo); // 장바구니 등록

	public int updateCart(CartVO vo); // 장바구니 수정

	public int deleteCart(CartVO vo); // 장바구니 삭제

	public CartVO getCart(CartVO vo); // 장바구니 상세조회

	public List<CartVO> getSearchCart(CartVO vo); // 장바구니전체조회
}
