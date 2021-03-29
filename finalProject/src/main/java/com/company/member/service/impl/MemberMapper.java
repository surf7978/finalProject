package com.company.member.service.impl;

import java.util.List;

import com.company.member.service.MemberVO;

public interface MemberMapper {

	public List<MemberVO> getSearchMember();
	
	public MemberVO getMember( MemberVO vo);
	
	public int insertMember(MemberVO vo);
	
	public int deleteMember(MemberVO vo);
	
	public int updateMember(MemberVO vo);
}
