package com.company.review.service;

import java.util.List;

public interface ReviewService {
	public int insertReview(ReviewVO vo);	//화원탈퇴
	public ReviewVO getReview(ReviewVO vo);	//단건조회
	public List<ReviewVO> getSearchReview(ReviewVO vo);	//전체조회
	public int updateReview(ReviewVO vo);	//회원수정
	public int deleteReview(ReviewVO vo);	//화원탈퇴
}
