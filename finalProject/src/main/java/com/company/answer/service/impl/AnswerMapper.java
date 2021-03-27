package com.company.answer.service.impl;

import java.util.List;

import com.company.answer.service.AnswerVO;

public interface AnswerMapper {
	public int insertMember(AnswerVO vo);
	public AnswerVO getMember(AnswerVO vo);
	public List<AnswerVO> getSearchMember(AnswerVO vo);
	public int updateMember(AnswerVO vo);
	public int deleteMember(AnswerVO vo);
}
