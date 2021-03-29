package com.company.member.service.impl;

import java.util.List;

import com.company.member.service.MemberVO;

public interface MemberMapper {
	public int insertMember(MemberVO vo); //일반사용자 등록
	public MemberVO getMember(MemberVO vo); //일반사용자 단건조회
	public List<MemberVO> getSearchMember(MemberVO vo); //일반사용자 전체조회
	public int updateMember(MemberVO vo); //일반사용자 수정
	public int deleteMember(MemberVO vo); //일반사용자 탈퇴
}
