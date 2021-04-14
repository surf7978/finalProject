package com.company.integrated.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.integrated.service.IntegratedService;
import com.company.integrated.service.IntegratedVO;

@Service
public class IntegratedServiceImpl implements IntegratedService {

	@Autowired
	IntegratedMapper integratedMapper;

	@Override // 등록
	public int insertIntegrated(IntegratedVO vo) {
		return integratedMapper.insertIntegrated(vo);
	}

	@Override // 수정
	public int updateIntegrated(IntegratedVO vo) {
		return integratedMapper.updateIntegrated(vo);
	}

	@Override // 삭제
	public int deleteIntegrated(IntegratedVO vo) {
		return integratedMapper.deleteIntegrated(vo);
	}

	@Override // 상세조회
	public IntegratedVO getIntegrated(IntegratedVO vo) {
		return integratedMapper.getIntegrated(vo);
	}

	@Override // 전체조회
	public List<IntegratedVO> getSearchIntegrated(IntegratedVO vo) {
		return integratedMapper.getSearchIntegrated(vo);
	}

	@Override // 레코드조회
	public int getCount(IntegratedVO vo) {
		return integratedMapper.getCount(vo);
	}

}
