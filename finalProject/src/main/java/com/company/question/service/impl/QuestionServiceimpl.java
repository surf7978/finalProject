package com.company.question.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.company.common.PagingVOCr4;
import com.company.question.service.QuestionService;
import com.company.question.service.QuestionVO;

@Service
public class QuestionServiceimpl implements QuestionService {

	@Autowired
	QuestionMapper QuestionMapper;

	
	
	
	
	
	
	// 등록
	@Override
	public int insertQuestion(QuestionVO vo) {
		return QuestionMapper.insertQuestion(vo);
	}
	//고객센터 문의 - 상품문의 등록
	@Override
	public int insertQuestion1(QuestionVO vo) {
		return QuestionMapper.insertQuestion1(vo);
		}
	// 고객센터 문의-고객센터 문의 하기 등록
	
	@Override
	public int insertQuestion2(QuestionVO vo) {
		return QuestionMapper.insertQuestion2(vo);
	}
	// 고객센터 문의-신고하기 등록
	
	@Override
	public int insertQuestion3(QuestionVO vo) {
		return QuestionMapper.insertQuestion3(vo);
		}

	
	
	
	
	
	
	
	// 단건조회
	@Override
	public QuestionVO getQuestion(QuestionVO vo) {
		return QuestionMapper.getQuestion(vo);
	}
	
	
	// 문의하기항목 1번 상품문의 단건조회
	@Override
	public QuestionVO getQuestion1(QuestionVO vo) {
		return QuestionMapper.getQuestion1(vo);
	}	
	
	// 문의하기항목 2번 문의하기 단건조회
	@Override
	public QuestionVO getQuestion2(QuestionVO vo) {
		return QuestionMapper.getQuestion2(vo);
	}
	
	
	
	// 문의하기항목 3번 신고 단건조회

	@Override
	public QuestionVO getQuestion3(QuestionVO vo) {
		return QuestionMapper.getQuestion3(vo);
	}
	
 	
	
	
	
	
	
	// 문의하기항목 1번 상품 문의 답장하기로 넘기기 by 관리자
	@Override
	public QuestionVO getQuestion1Ans(QuestionVO vo) {
		return QuestionMapper.getQuestion1Ans(vo);
	}
	
	// 문의하기항목 2번고객센터 문의 답장하기로 넘기기 by 관리자
	@Override
	public QuestionVO getQuestion2Ans(QuestionVO vo) {
		return QuestionMapper.getQuestion2Ans(vo);
	}

 
 
	// 문의하기항목 3번 신고 단건조회-신고 답장하기로 넘기기 by 관리자
	@Override
	public QuestionVO getQuestion3Ans(QuestionVO vo) {
		return QuestionMapper.getQuestion3Ans(vo);
	}

	
	
	
	
	
	
	// 전체조회
	@Override
	public List<QuestionVO> getSearchQuestion(QuestionVO vo) {
		return QuestionMapper.getSearchQuestion(vo);
	}

	// 전체조회 - Cr4(김찬영)
	@Override
	public List<QuestionVO> getSearchQuestionCr4(QuestionVO vo) {
		return QuestionMapper.getSearchQuestionCr4(vo);
	}
	
	// 문의하기 항목 하나 전체조회 1 상품문의
	/*
	 * @Override public List<QuestionVO> getSearchQuestionSelect1(QuestionVO vo) {
	 * return QuestionMapper.getSearchQuestionSelect1(vo); }
	 */


	
	
	// 수정
	@Override
	public int updateQuestion(QuestionVO vo) {
		return QuestionMapper.updateQuestion(vo);
	}

	// 탈퇴
	@Override
	public int deleteQuestion(QuestionVO vo) {
		return QuestionMapper.deleteQuestion(vo);
	}

	
	
	//나경
	//병원, 카페 등 상품 상세보기에서 상품문의글 등록
	@Override
	public int insertQuestionBusi(QuestionVO vo) {
		return QuestionMapper.insertQuestionBusi(vo);
	}
	//병원, 카페 등 상품 상세보기에서 상품문의글 리스트조회
	@Override
	public List<QuestionVO> getSearchQuestionProbis(QuestionVO vo) {
		return QuestionMapper.getSearchQuestionProbis(vo);
	}
	//병원, 카페 등 상품 상세보기에서 상품문의글 단건조회
	@Override
	public QuestionVO getQuestionProbis(QuestionVO vo) {
		return QuestionMapper.getQuestionProbis(vo);	
	}
	
	//쇼핑몰 상품 상세보기에서 상품문의글 상품문의글 등록
	@Override
	public int insertQuestionPro(QuestionVO vo) {
		return QuestionMapper.insertQuestionPro(vo);
	}

	
	// 레코드
	@Override
	public int getCount(QuestionVO vo) {
		return QuestionMapper.getCount(vo);
	}
	
	

	//마이페이지-유저-문의내역
	@Override
	public List<QuestionVO> getSearchQuestion99(PagingVOCr4 vo) {
		return QuestionMapper.getSearchQuestion99(vo);
	}

	
	//페이징 처리 하는 것.
	
	
	
	@Override
	public int countQuestion1() {
		return QuestionMapper.countQuestion1();
	}
	
	@Override
	public int countQuestion2() {
		return QuestionMapper.countQuestion2();
	}
	@Override
	public int countQuestion3() {
		return QuestionMapper.countQuestion3();
	}
	@Override
	public int countQuestion4(PagingVOCr4 vo) {
		return QuestionMapper.countQuestion4(vo);
	}


	@Override
	public List<QuestionVO> getSearchQuestionSelect1(PagingVOCr4 vo) {
		return QuestionMapper.getSearchQuestionSelect1(vo);
	}
	@Override
	public List<QuestionVO> getSearchQuestionSelect2(PagingVOCr4 vo) {
		return QuestionMapper.getSearchQuestionSelect2(vo);
	}
	@Override
	public List<QuestionVO> getSearchQuestionSelect3(PagingVOCr4 vo) {
		return QuestionMapper.getSearchQuestionSelect3(vo);
	}
	
	
	
	

}
