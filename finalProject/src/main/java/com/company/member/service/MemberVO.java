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
