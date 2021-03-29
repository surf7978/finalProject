package com.company.question.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.question.service.QuestionService;
import com.company.question.service.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionMapper qMapper;

	// 단건조회
	@Override
	public QuestionVO getQuestion(QuestionVO vo) {
		return qMapper.getQuestion(vo);
	}

	// 전체조회
	@Override
	public List<QuestionVO> getSearchQuestion(QuestionVO vo) {
		return qMapper.getSearchQuestion(vo);
	}

	// 레코드 총갯수 산출
	@Override
	public int getCount(QuestionVO vo) {
		return qMapper.getCount(vo);
	}
}
