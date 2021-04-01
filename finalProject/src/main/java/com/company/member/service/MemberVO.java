package com.company.member.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class MemberVO implements UserDetails{ //implements UserDetails = spring Security 추가용
	String memberId; //아이디
	String password; //패스워드
	String email; //이메일
	String name; //이름
	String post; //우편번호
	String address; //주소
	String address2; //상세주소
	String phone; //핸드폰번호
	String auth; //권한(일반사용자, 관리자)
	String startDate; //가입일
	String endDate; //탈퇴일
	
	//spring Security
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> AUTH = new ArrayList<>();
		AUTH.add(new SimpleGrantedAuthority("ROLE_"+auth.toUpperCase()));
		return AUTH;
	}
	@Override
	public String getUsername() {
		return memberId;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
}
