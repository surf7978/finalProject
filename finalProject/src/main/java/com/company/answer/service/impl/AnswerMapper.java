package com.company.answer.service.impl;

import java.util.List;

import com.company.answer.service.AnswerVO;

public interface AnswerMapper {
	// 답변-등록
	public void insertAnswer(AnswerVO vo);

	// 답변-수정
	public void updateAnswer(AnswerVO vo);

	// 답변-삭제
	public void deleteAnswer(AnswerVO vo);

	// 답변-조회
	public AnswerVO getAnswer(AnswerVO vo);

	// 답변-전체조회
	public List<AnswerVO> getSearchAnswer(AnswerVO vo);

}