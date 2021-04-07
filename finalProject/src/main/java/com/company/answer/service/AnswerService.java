package com.company.answer.service;

import java.util.List;

public interface AnswerService {

	public int insertAnswer(AnswerVO vo);	//화원탈퇴
	public int insertAnswer1Cr4(AnswerVO vo);	//관리자의 상품문의 답장
	public int insertAnswer2Cr4(AnswerVO vo);	//관리자의 고객센터문의하기 답장
	public int insertAnswer3Cr4(AnswerVO vo);	//관리자의 신고하기 답장
	public AnswerVO getAnswer(AnswerVO vo);	//단건조회						
	public List<AnswerVO> getSearchAnswer(AnswerVO vo);	//
	public List<AnswerVO> getSearchAnswerCr4(AnswerVO vo);	//전체조회 신고하기(찬)
	public int updateAnswer(AnswerVO vo);	//회원수정
	public int deleteAnswer(AnswerVO vo);	//화원탈퇴
	public int deleteAnswerCr4(AnswerVO vo);	//관리자 답변삭제
}
