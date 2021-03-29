package com.company.answer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.answer.service.AnswerService;
import com.company.answer.service.AnswerVO;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	AnswerMapper aMapper;

	// 등록
	@Override
	public void insertAnswer(AnswerVO vo) {
		aMapper.insertAnswer(vo);
	}

	// 수정
	@Override
	public void updateAnswer(AnswerVO vo) {
		aMapper.updateAnswer(vo);
	}

	// 삭제
	@Override
	public void deleteAnswer(AnswerVO vo) {
		aMapper.deleteAnswer(vo);
	}

	// 단건조회
	@Override
	public AnswerVO getAnswer(AnswerVO vo) {
		return aMapper.getAnswer(vo);
	}

	// 전체조회
	@Override
	public List<AnswerVO> getSearchAnswer(AnswerVO vo) {
		return aMapper.getSearchAnswer(vo);
	}

}
