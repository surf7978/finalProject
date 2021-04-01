package com.company.question.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.business.service.BusinessVO;
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

	// 단건조회
	@Override
	public QuestionVO getQuestion(QuestionVO vo) {
		return QuestionMapper.getQuestion(vo);
	}

	// 전체조회
	@Override
	public List<QuestionVO> getSearchQuestion(QuestionVO vo) {
		return QuestionMapper.getSearchQuestion(vo);
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

}
