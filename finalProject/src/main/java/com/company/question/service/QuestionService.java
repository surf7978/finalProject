package com.company.question.service;

import java.util.List;

import com.company.business.service.BusinessVO;

public interface QuestionService {

	public int insertQuestion(QuestionVO vo); // 등록

	public int updateQuestion(QuestionVO vo); // 수정

	public int deleteQuestion(QuestionVO vo); // 삭제

	public QuestionVO getQuestion(QuestionVO vo); // 단건조회

	public List<QuestionVO> getSearchQuestion(BusinessVO vo); // 전체조회

	public int getCount(QuestionVO vo); // DB레코드 카운트
}
