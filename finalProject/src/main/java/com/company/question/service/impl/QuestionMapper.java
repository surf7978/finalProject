package com.company.question.service.impl;

import java.util.List;

import com.company.business.service.BusinessVO;
import com.company.question.service.QuestionVO;

public interface QuestionMapper {
	public int insertQuestion(QuestionVO vo);

	public QuestionVO getQuestion(QuestionVO vo);

	public List<QuestionVO> getSearchQuestion(BusinessVO vo);

	public int updateQuestion(QuestionVO vo);

	public int deleteQuestion(QuestionVO vo);
}
