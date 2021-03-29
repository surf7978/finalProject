package com.company.member.service.impl;

import java.util.List;

import com.company.member.service.MemberVO;

public interface MemberMapper {
	public int insertMember(MemberVO vo);
	public MemberVO getMember(MemberVO vo);
	public List<MemberVO> getSearchMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public int deleteMember(MemberVO vo);
}
=======
package com.company.member.service.impl;

import java.util.List;

import com.company.member.service.MemberVO;

public interface MemberMapper {
	public int insertMember(MemberVO vo);
	public MemberVO getMember(MemberVO vo);
	public List<MemberVO> getSearchMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public int deleteMember(MemberVO vo);
}
