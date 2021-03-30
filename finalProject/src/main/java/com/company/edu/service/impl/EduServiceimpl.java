package com.company.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.edu.service.EduService;
import com.company.edu.service.EduVO;

@Service
public class EduServiceimpl implements EduService{
	
	@Autowired EduMapper EduMapper;
	//등록
	@Override
	public int insertEdu(EduVO vo) {
		return EduMapper.insertEdu(vo);
	}
	//단건조회
	@Override
	public EduVO getEdu(EduVO vo) {
		return EduMapper.getEdu(vo);
	}
	//전체조회
	@Override
	public List<EduVO> getSearchEdu(EduVO vo) {
		return EduMapper.getSearchEdu(vo);
	}
	//수정
	@Override
	public int updateEdu(EduVO vo) {
		return EduMapper.updateEdu(vo);
	}
	
	//탈퇴
	@Override
	public int deleteEdu(EduVO vo) {
		return EduMapper.deleteEdu(vo);
	}


}
