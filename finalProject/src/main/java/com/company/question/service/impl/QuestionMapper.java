package com.company.question.service.impl;

import java.util.List;

import com.company.question.service.QuestionVO;

public interface QuestionMapper {
	public int insertQuestion(QuestionVO vo);
	public QuestionVO getQuestion(QuestionVO vo);
	public List<QuestionVO> getSearchQuestion(QuestionVO vo);
	public List<QuestionVO> getSearchQuestionSelect1(QuestionVO vo);	// 문의하기항목 선택. 1번상품문의
	public List<QuestionVO> getSearchQuestionSelect2(QuestionVO vo);	// 문의하기항목 선택. 2번고객센터문의
	public List<QuestionVO> getSearchQuestionSelect3(QuestionVO vo);	// 문의하기항목 선택. 3번신고하기
	public int updateQuestion(QuestionVO vo);
	public int deleteQuestion(QuestionVO vo);
}
