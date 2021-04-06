package com.company.member.service;

import java.util.List;


public interface MemberService {
	public int insertMember(MemberVO vo);	//화원탈퇴
	public MemberVO getMember(MemberVO vo);	//단건조회
	public List<MemberVO> getSearchMember(MemberVO vo);	//전체조회
	public int updateMember(MemberVO vo);	//회원수정
	public int deleteMember(MemberVO vo);	//화원탈퇴
	
	public MemberVO getViewMember(MemberVO vo);	//뷰 단건조회
	
	public int idCheck(MemberVO vo);	//아이디 중복체크
	
	public String searchID(MemberVO vo);	//아이디 찾기
	public String searchPW(MemberVO vo);	//비밀번호 찾기
	
	public List<MemberVO> getSearchViewMember(MemberVO vo);	//뷰 전체조회
}
