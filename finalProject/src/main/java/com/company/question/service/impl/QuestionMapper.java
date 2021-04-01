package com.company.question.service.impl;

import java.util.List;

import com.company.question.service.QuestionVO;

public interface QuestionMapper {
	public int insertQuestion(QuestionVO vo);

	public QuestionVO getQuestion(QuestionVO vo);

	public List<QuestionVO> getSearchQuestion(QuestionVO vo);

	public int updateQuestion(QuestionVO vo);

	public int deleteQuestion(QuestionVO vo);
	
	public int getCount(QuestionVO vo); // DB레코드 카운트
}
