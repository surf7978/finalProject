package com.company.edu.service;

import java.util.List;

public interface EduService {
	public int insertEdu(EduVO vo);	//화원탈퇴
	public EduVO getEdu(EduVO vo);	//단건조회
	public List<EduVO> getSearchEdu(EduVO vo);	//전체조회
	public int updateEdu(EduVO vo);	//회원수정
	public int deleteEdu(EduVO vo);	//화원탈퇴
}
