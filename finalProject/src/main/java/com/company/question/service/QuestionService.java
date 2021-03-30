package com.company.question.service;

import java.util.List;

public interface QuestionService {

	public int getCount(QuestionVO vo); // DB레코드 카운트

	public int insertQuestion(QuestionVO vo); // 화원탈퇴

	public QuestionVO getQuestion(QuestionVO vo); // 단건조회

	public List<QuestionVO> getSearchQuestion(QuestionVO vo); // 전체조회

	public int updateQuestion(QuestionVO vo); // 회원수정

	public int deleteQuestion(QuestionVO vo); // 화원탈퇴
}
