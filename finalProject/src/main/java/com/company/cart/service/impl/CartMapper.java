package com.company.cart.service.impl;

import java.util.List;

import com.company.cart.service.CartVO;

public interface CartMapper {
	public int insertCart(CartVO vo);
	public CartVO getCart(CartVO vo);
	public List<CartVO> getSearchCart(CartVO vo);
	public int updateCart(CartVO vo);
	public int deleteCart(CartVO vo);
}
