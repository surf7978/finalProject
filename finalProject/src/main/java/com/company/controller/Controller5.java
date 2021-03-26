package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.service.BusinessVO;
import com.company.service.impl.BusinessMapper;

@Controller
public class Controller5 {

	@Autowired
	BusinessMapper dao;

	// 로그인 후 마이페이지 눌렀을 때의 상황
	// 세션의 id로 조회하기(Session.get사용하기)

	// 마이페이지-사업자-본인정보
	@RequestMapping("/getBusiness")
	public String getBusiness(BusinessVO vo, Model model) {
		// 본인 정보 조회
		vo = dao.getBusiness(vo);
		model.addAttribute("vo", vo);
		return "business/getBusiness";
	}

	// 마이페이지-사업자-본인정보수정 페이지
	@RequestMapping("/updateBusiness")
	public String updateBusiness(BusinessVO vo, Model model) {
		vo = dao.getBusiness(vo);
		model.addAttribute("vo", vo);
		return "business/updateBusiness";
	}

	// 마이페이지-사업자-문의내역 리스트
	@RequestMapping("/getSearchQuestion")
	public String getSearchQuestion(BusinessVO vo) {

		return "business/getSearchQuestion";
	}

	// 마이페이지-사업자-특정 문의내역조회
	@RequestMapping("/getQuestion")
	public String getQuestion(BusinessVO vo) {
		return "business/getQuestion";
	}
	// 마이페이지-사업자-답변

	// 마이페이지-사업자-답변리스트

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