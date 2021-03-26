package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Controller5 {
	// 마이페이지-사업자-본인정보수정 페이지
	@RequestMapping("/updateBusiness")
	public String businessInfo() {
		return "business/updateBusiness";
	}

	// 마이페이지-사업자-활동내역-문의내역 리스트
	@RequestMapping("/activity")
	public String activity() {
		return "business/activity";
	}
	// 마이페이지-사업자-활동내역-특정 문의내역

	// 마이페이지-사업자-활동내역-답변

	// 마이페이지-사업자-활동내역-답변리스트

	// 마이페이지-사업자-예약내역조회

	// 마이페이지-사업자-통계현황

	// 사업자-전체리스트

	// 사업자-상세리스트

	// 사업자-등록페이지

	// 장바구니-페이지

	// 나중에
	// 마이페이지-사업자-실시간화장진료 페이지
	// 택시-샘플페이지
	// 동물정보-샘플페이지
}