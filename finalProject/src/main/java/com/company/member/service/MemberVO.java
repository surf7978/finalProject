package com.company.member.service;

import lombok.Data;

@Data
public class MemberVO {
	String memberId;
	String password;
	String email;
	String name;
	String post;
	String address;
	String address2;
	String phone;
	String auth;
	String startDate;
	String endDate;
}
=======
package com.company.member.service;

import lombok.Data;

@Data
public class MemberVO { //일반사용자, 관리자
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
}
