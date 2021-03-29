package com.company.edu.service.impl;

import java.util.List;

import com.company.edu.service.EduVO;

public interface EduMapper {
	public int insertMember(EduVO vo);
	public EduVO getMember(EduVO vo);
	public List<EduVO> getSearchMember(EduVO vo);
	public int updateMember(EduVO vo);
	public int deleteMember(EduVO vo);
}
