package com.company.answer.service;

import java.util.List;

import com.company.common.PagingVOCr4;
import com.company.question.service.QuestionVO;

public interface AnswerService {

	public int insertAnswer(AnswerVO vo);	//화원탈퇴
	
	
	
	public int insertAnswer1Cr4(AnswerVO vo);	//관리자의 상품문의 답장
	public int insertAnswer2Cr4(AnswerVO vo);	//관리자의 고객센터문의하기 답장
	public int insertAnswer3Cr4(AnswerVO vo);	//관리자의 신고하기 답장
	
	
	
	public AnswerVO getAnswer(AnswerVO vo);	//단건조회	
	
	
	public List<AnswerVO> getSearchAnswer(AnswerVO vo);
	public List<AnswerVO> getSearchAnswerCr4(AnswerVO vo);	//관리자 답변 전체조회(찬)
	
	
	
	public int updateAnswer(AnswerVO vo);	//회원수정
	public int deleteAnswer(AnswerVO vo);	//화원탈퇴
	
	
	public int deleteAnswerCr4(AnswerVO vo);	//관리자 답변삭제
	
	
	///페이징 관련 관리자의 답변목록조회
	// 게시물 총 갯수
	public int countQuestion();
	
	// 페이징 처리 
	public List<AnswerVO> getSearchAnswerCr4(PagingVOCr4 vo); 
	
}
