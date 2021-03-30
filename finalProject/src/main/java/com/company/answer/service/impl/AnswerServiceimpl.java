package com.company.answer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.answer.service.AnswerService;
import com.company.answer.service.AnswerVO;

@Service
public class AnswerServiceimpl implements AnswerService{
	
	@Autowired AnswerMapper AnswerMapper;
	//등록
	@Override
	public int insertAnswer(AnswerVO vo) {
		return AnswerMapper.insertAnswer(vo);
	}
	//단건조회
	@Override
	public AnswerVO getAnswer(AnswerVO vo) {
		return AnswerMapper.getAnswer(vo);
	}
	//전체조회
	@Override
	public List<AnswerVO> getSearchAnswer(AnswerVO vo) {
		return AnswerMapper.getSearchAnswer(vo);
	}
	//수정
	@Override
	public int updateAnswer(AnswerVO vo) {
		return AnswerMapper.updateAnswer(vo);
	}
	
	//탈퇴
	@Override
	public int deleteAnswer(AnswerVO vo) {
		return AnswerMapper.deleteAnswer(vo);
	}


}
