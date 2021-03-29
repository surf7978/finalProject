package com.company.question.service;

import java.util.List;

public interface QuestionService {

	// 특정리스트조회
	public QuestionVO getQuestion(QuestionVO vo);

	// 전체리스트조회
	public List<QuestionVO> getSearchQuestion(QuestionVO vo);

	// DB레코드 카운트
	public int getCount(QuestionVO vo);
}
