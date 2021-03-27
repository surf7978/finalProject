package com.company.cart.service.impl;

import java.util.List;

import com.company.cart.service.CartVO;

public interface CartMapper {
	public int insertMember(CartVO vo);
	public CartVO getMember(CartVO vo);
	public List<CartVO> getSearchMember(CartVO vo);
	public int updateMember(CartVO vo);
	public int deleteMember(CartVO vo);
}
