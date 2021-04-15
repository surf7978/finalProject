package com.company.review.service.impl;

import java.util.List;

import com.company.review.service.ReviewVO;

public interface ReviewMapper {
	public int insertReview(ReviewVO vo);
	public ReviewVO getReview(ReviewVO vo);
	public List<ReviewVO> getSearchReview(ReviewVO vo);
	public int updateReview(ReviewVO vo);
	public int deleteReview(ReviewVO vo);
	
	public List<ReviewVO> getSearchReview99(ReviewVO vo);	//일반사용자 후기내역
}
