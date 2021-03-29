package com.company.question.service.impl;

import java.util.List;

import com.company.question.service.QuestionVO;

public interface QuestionMapper {
	public int insertMember(QuestionVO vo);
	public QuestionVO getMember(QuestionVO vo);
	public List<QuestionVO> getSearchMember(QuestionVO vo);
	public int updateMember(QuestionVO vo);
	public int deleteMember(QuestionVO vo);
}
