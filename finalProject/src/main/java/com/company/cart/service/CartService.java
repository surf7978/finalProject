package com.company.cart.service;

import java.util.List;

public interface CartService {
	public int insertCart(CartVO vo);	//화원탈퇴
	public CartVO getCart(CartVO vo);	//단건조회
	public List<CartVO> getSearchCart(CartVO vo);	//전체조회
	public int updateCart(CartVO vo);	//회원수정
	public int deleteCart(CartVO vo);	//화원탈퇴
}
