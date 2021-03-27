package com.company.review.service.impl;

import java.util.List;

import com.company.review.service.ReviewVO;

public interface ReviewMapper {
	public int insertMember(ReviewVO vo);
	public ReviewVO getMember(ReviewVO vo);
	public List<ReviewVO> getSearchMember(ReviewVO vo);
	public int updateMember(ReviewVO vo);
	public int deleteMember(ReviewVO vo);
}
