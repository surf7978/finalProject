package com.company.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;

@Service("memberService")
public class MemberServiceimpl implements MemberService, UserDetailsService, PasswordEncoder{
	
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
	
	// spring Security
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO vo = new MemberVO();
		vo.setMemberId(username);
		vo = memberMapper.getViewMember(vo);
		if(vo == null) {
			throw new UsernameNotFoundException("NO USER!!!");
		}
		return vo;
	}
	
	//아이디 중복체크
	@Override
	public int idCheck(MemberVO vo) {
		int result = memberMapper.idCheck(vo);
		return result;
	}
	
	// spring Security의 암호화된 패스워드와 일치하는지 확인하는 기능
	PasswordEncoder passwordEncoder;
	public MemberServiceimpl() {
		this.passwordEncoder = new BCryptPasswordEncoder();
	}

	public MemberServiceimpl(PasswordEncoder passwordEncoder) {
	   this.passwordEncoder = passwordEncoder;
	}

	@Override
	public String encode(CharSequence rawPassword) {
	   return passwordEncoder.encode(rawPassword);
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
	   return passwordEncoder.matches(rawPassword, encodedPassword);
	}
}
