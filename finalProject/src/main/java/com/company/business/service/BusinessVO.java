package com.company.business.service;

import lombok.Data;

@Data
public class BusinessVO {
	// 사업자 테이블
	private String businessNumber;// 사업자번호 PK
	private String businessName;// 대표이름
	private String businessId;// 아이디
	private String password;// 비밀번호
	private String email;// 이메일
	private String phone;// 핸드폰번호
	private String startCalender;// 가입일
	private String endCalender;// 탈퇴일
	private String businessCode;// 사업자코드
	private String businessCompanyName;// 사업자명
	private String address;// 주소
	private String address2;// 상세주소
	private String post;// 우편번호
}
