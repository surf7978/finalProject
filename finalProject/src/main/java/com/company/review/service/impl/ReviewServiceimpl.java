package com.company.review.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.review.service.ReviewService;
import com.company.review.service.ReviewVO;

@Service
public class ReviewServiceimpl implements ReviewService{
	
	@Autowired ReviewMapper reviewMapper;
	//등록
	@Override
	public int insertReview(ReviewVO vo) {
		return reviewMapper.insertReview(vo);
	}
	//단건조회
	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewMapper.getReview(vo);
	}
	//전체조회
	@Override
	public List<ReviewVO> getSearchReview(ReviewVO vo) {
		return reviewMapper.getSearchReview(vo);
	}
	//수정
	@Override
	public int updateReview(ReviewVO vo) {
		return reviewMapper.updateReview(vo);
	}
	
	//탈퇴
	@Override
	public int deleteReview(ReviewVO vo) {
		return reviewMapper.deleteReview(vo);
	}


}
