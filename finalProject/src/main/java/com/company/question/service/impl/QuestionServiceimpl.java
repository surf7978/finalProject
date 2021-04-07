package com.company.question.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	// 문의하기항목 3번 신고 단건조회
	@Override
	public QuestionVO getQuestion3(QuestionVO vo) {
		return QuestionMapper.getQuestion3(vo);
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
	@Override
	public List<QuestionVO> getSearchQuestionSelect1(QuestionVO vo) {
		return QuestionMapper.getSearchQuestionSelect1(vo);
	}

	// 문의하기 항목 하나 전체조회 2 고객센터 문의
	@Override
	public List<QuestionVO> getSearchQuestionSelect2(QuestionVO vo) {
		return QuestionMapper.getSearchQuestionSelect2(vo);
	}

	// 문의하기 항목 하나 전체조회 3 신고하기
	@Override
	public List<QuestionVO> getSearchQuestionSelect3(QuestionVO vo) {
		return QuestionMapper.getSearchQuestionSelect3(vo);
	}

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

	// 레코드
	@Override
	public int getCount(QuestionVO vo) {
		return QuestionMapper.getCount(vo);
	}
	
	//병원, 카페 등 상품 상세보기에서 상품문의글 등록
	@Override
	public int insertQuestionBusi(QuestionVO vo) {
		return QuestionMapper.insertQuestionBusi(vo);
	}

}
