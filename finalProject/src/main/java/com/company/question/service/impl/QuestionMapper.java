package com.company.question.service.impl;

import java.util.List;

import com.company.question.service.QuestionVO;

public interface QuestionMapper {
	public int insertQuestion(QuestionVO vo);
	public QuestionVO getQuestion(QuestionVO vo);
	public List<QuestionVO> getSearchQuestion(QuestionVO vo);
	public List<QuestionVO> getSearchQuestionSelect(QuestionVO vo);	// 문의하기항목 선택.
	public int updateQuestion(QuestionVO vo);
	public int deleteQuestion(QuestionVO vo);
}
