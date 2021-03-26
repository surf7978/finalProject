package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.member.service.MemberVO;
import com.company.member.service.impl.MemberMapper;

@Controller
public class Controller4 {

	//서비스 
	@Autowired MemberMapper dao;
	
	//맴버전체조회
	@RequestMapping("/getMemberList")
	public String getMemberList(Model model) {
		model.addAttribute("list", dao.getMemberList());
		return "member/getMemberList";
	}
	@GetMapping("/getMember")
	public String getMember(MemberVO vo , Model model) {
		
		return "member/getMember";
	}
	@GetMapping("/insertMember")
	public String insertMember(MemberVO vo) {
		return "member/insertMember";
	}
	@PostMapping("/inserMember")
	public String insertMemberProc(MemberVO vo) {
		dao.insertMember(vo);
		return "redirect:getMemberList";
	}
	//여기더 추가하기
	
	
	
}//end
