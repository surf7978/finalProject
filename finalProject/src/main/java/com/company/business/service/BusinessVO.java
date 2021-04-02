package com.company.business.service;

import lombok.Data;

@Data
public class BusinessVO {
	String businessNumber; //사업자번호
	String businessName; //대표이름
	String businessId; //아이디
	String password; //비밀번호
	String email; //이메일
	String phone; //핸드폰번호
	String startDate; //가입일
	String endDate; //탈퇴일
	String businessCode; //사업자코드
	String businessCompanyName; //사업자명
	String address; //주소
	String address2; //상세주소
	String post; //우편번호

}
