package com.company.beauty.service;

import java.util.List;

public interface BeautyService {
	public int insertBeauty(BeautyVO vo);	//화원탈퇴
	public BeautyVO getBeauty(BeautyVO vo);	//단건조회
	public List<BeautyVO> getSearchBeauty(BeautyVO vo);	//전체조회
	public int updateBeauty(BeautyVO vo);	//회원수정
	public int deleteBeauty(BeautyVO vo);	//화원탈퇴
}
