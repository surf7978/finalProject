package com.company.cart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.cart.service.CartService;
import com.company.cart.service.CartVO;

@Service
public class CartServiceimpl implements CartService{
	
	@Autowired CartMapper CartMapper;
	//등록
	@Override
	public int insertCart(CartVO vo) {
		return CartMapper.insertCart(vo);
	}
	//단건조회
	@Override
	public CartVO getCart(CartVO vo) {
		return CartMapper.getCart(vo);
	}
	//전체조회
	@Override
	public List<CartVO> getSearchCart(CartVO vo) {
		return CartMapper.getSearchCart(vo);
	}
	//수정
	@Override
	public int updateCart(CartVO vo) {
		return CartMapper.updateCart(vo);
	}
	
	//탈퇴
	@Override
	public int deleteCart(CartVO vo) {
		return CartMapper.deleteCart(vo);
	}


}
