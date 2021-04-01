package com.company.question.service;

import java.util.List;

public interface QuestionService {
	public int insertQuestion(QuestionVO vo);	//화원탈퇴
	public QuestionVO getQuestion(QuestionVO vo);	//단건조회
	public List<QuestionVO> getSearchQuestion(QuestionVO vo);	//전체조회
	public List<QuestionVO> getSearchQuestionSelect1(QuestionVO vo);	// 문의하기항목 선택. 1번상품문의
	public List<QuestionVO> getSearchQuestionSelect2(QuestionVO vo);	// 문의하기항목 선택. 2번고객센터문의
	public List<QuestionVO> getSearchQuestionSelect3(QuestionVO vo);	// 문의하기항목 선택. 3번신고하기
	public int updateQuestion(QuestionVO vo);	//회원수정
	public int deleteQuestion(QuestionVO vo);	//화원탈퇴

	public int getCount(QuestionVO vo); // DB레코드 카운트
}
