package com.company.answer.service;

import java.util.List;

public interface AnswerService {
	// 답변-등록
	public void insertAnswer(AnswerVO vo);

	// 답변-수정
	public void updateAnswer(AnswerVO vo);

	// 답변-삭제
	public void deleteAnswer(AnswerVO vo);

	// 답변-단건조회
	public AnswerVO getAnswer(AnswerVO vo);

	// 답변-전체조회
	public List<AnswerVO> getSearchAnswer(AnswerVO vo);
}
