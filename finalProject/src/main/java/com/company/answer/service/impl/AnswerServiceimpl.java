package com.company.answer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.answer.service.AnswerService;
import com.company.answer.service.AnswerVO;
import com.company.common.PagingVOCr4;
import com.company.question.service.QuestionVO;

@Service
public class AnswerServiceimpl implements AnswerService{
	
	@Autowired AnswerMapper answerMapper;
	//등록
	@Override
	public int insertAnswer(AnswerVO vo) {
		return answerMapper.insertAnswer(vo);
	}
	
	
	//고객센터 1 상품문의하기 답장등록
	@Override
	public int insertAnswer1Cr4(AnswerVO vo) {
		return answerMapper.insertAnswer1Cr4(vo);
	}
	
	
	
	//고객센터 2문의하기 답장등록
	@Override
	public int insertAnswer2Cr4(AnswerVO vo) {
		return answerMapper.insertAnswer2Cr4(vo);
	}
	
	//고객센터 3신고하기 답장등록
	@Override
	public int insertAnswer3Cr4(AnswerVO vo) {
		return answerMapper.insertAnswer3Cr4(vo);
	}
	
	
	
	
	
	
	
	
	//단건조회
	@Override
	public AnswerVO getAnswer(AnswerVO vo) {
		return answerMapper.getAnswer(vo);
	}
	
	
	
	
	
	
	
	//전체조회
	@Override
	public List<AnswerVO> getSearchAnswer(AnswerVO vo) {
		return answerMapper.getSearchAnswer(vo);
	}
	
	//전체조회 관리자 답장(찬영)
	@Override
	public List<AnswerVO> getSearchAnswerCr4(AnswerVO vo) {
		return answerMapper.getSearchAnswerCr4(vo);
		}
	
	
	
	
	
	
	
	//수정
	@Override
	public int updateAnswer(AnswerVO vo) {
		return answerMapper.updateAnswer(vo);
	}
	
	//탈퇴
	@Override
	public int deleteAnswer(AnswerVO vo) {
		return answerMapper.deleteAnswer(vo);
	}
	
	
	
	
	
	
	
	//관리자 답변 한건 삭제
	@Override
	public int deleteAnswerCr4(AnswerVO vo) {
		return answerMapper.deleteAnswerCr4(vo);
	}

	//페이징 처리하는것 관련 답변목록조회
	
	@Override
	public int countQuestion() {
		return answerMapper.countQuestion();
	}
	
	@Override
	public List<AnswerVO> getSearchAnswerCr4(PagingVOCr4 vo) {
		return answerMapper.getSearchAnswerCr4(vo);
	}

	//마이페이지-유저-답변 받은 내역
	@Override
	public AnswerVO getUserAnswer(AnswerVO vo) {
		return answerMapper.getUserAnswer(vo);
	}
	


}
