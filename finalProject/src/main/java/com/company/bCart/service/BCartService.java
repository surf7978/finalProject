package com.company.bCart.service;

public interface BCartService {
	// 사업자 장바구니
	// 등록
	public void insertBCart(BCartVO vo);

	// 삭제
	public void deleteBCart(BCartVO vo);

	// 단건조회
	public BCartVO getBCart(BCartVO vo);
}
