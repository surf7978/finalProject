package com.company.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;

@Service
public class MemberServiceimpl implements MemberService{
	
	@Autowired MemberMapper memberMapper;
	//등록
	@Override
	public int insertMember(MemberVO vo) {
		return memberMapper.insertMember(vo);
	}
	//단건조회
	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberMapper.getMember(vo);
	}
	//전체조회
	@Override
	public List<MemberVO> getSearchMember(MemberVO vo) {
		return memberMapper.getSearchMember(vo);
	}
	//수정
	@Override
	public int updateMember(MemberVO vo) {
		return memberMapper.updateMember(vo);
	}
	
	//탈퇴
	@Override
	public int deleteMember(MemberVO vo) {
		return memberMapper.deleteMember(vo);
	}
	
	//전체회원 단건조회
	@Override
	public MemberVO getViewMember(MemberVO vo) {
		return memberMapper.getViewMember(vo);
	}


}
