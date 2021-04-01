package com.company.bCart.service;

import java.util.List;

public interface BCartService {
	public int insertBCart(BCartVO vo); // 화원탈퇴

	public BCartVO getBCart(BCartVO vo); // 단건조회

	public List<BCartVO> getSearchBCart(BCartVO vo); // 전체조회

	public int updateBCart(BCartVO vo); // 회원수정

	public int deleteBCart(BCartVO vo); // 화원탈퇴
}
