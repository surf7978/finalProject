package com.company.edu.service.impl;

import java.util.List;

import com.company.edu.service.EduVO;

public interface EduMapper {
	public int insertEdu(EduVO vo);
	public EduVO getEdu(EduVO vo);
	public List<EduVO> getSearchEdu(EduVO vo);
	public int updateEdu(EduVO vo);
	public int deleteEdu(EduVO vo);
}
