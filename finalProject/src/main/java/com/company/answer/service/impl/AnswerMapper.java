package com.company.answer.service.impl;

import java.util.List;

import com.company.answer.service.AnswerVO;

public interface AnswerMapper {
	public int insertAnswer(AnswerVO vo);
	public AnswerVO getAnswer(AnswerVO vo);
	public List<AnswerVO> getSearchAnswer(AnswerVO vo);
	public int updateAnswer(AnswerVO vo);
	public int deleteAnswer(AnswerVO vo);
}
