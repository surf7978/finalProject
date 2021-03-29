package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.board.service.BoardVO;
import com.company.board.service.impl.BoardMapper;
import com.company.member.service.MemberVO;
import com.company.member.service.impl.MemberMapper;

/*
 * @author 김찬영
 * 
 * 
 * */
@Controller
public class Controller4 {

	//서비스 
	@Autowired
	MemberMapper memberService;
	@Autowired
	BoardMapper boardService;
	
	
	// ####맴버에 관한 컨트롤러
	//맴버전체조회
	@RequestMapping("/getSearchMember")
	public String getSearchMember(Model model) {
		model.addAttribute("list", memberService.getSearchMember());
		return "member/getSearchMember";
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
		memberService.insertMember(vo);
		return "redirect:/getSearchMember";
	}
	//여기더 추가하기
//	@GetMapping("/deleteMember")
//	public String deleteMemeber(MemberVO vo , Model model) {
//		memberService.deleteMember(vo);
//		model.addAttribute("deleteMember" , memberService.deleteMember(vo));
//		return "member/getMemberList";
//		
//	}
	@PostMapping("/deleteMember")
	public String deleteMemberProc(MemberVO vo , Model model) {
		memberService.deleteMember(vo);
		model.addAttribute("deleteMember" , memberService.deleteMember(vo));
		return "redirect:getSearchMember";
	}
	
	// ###게시판에 관한 컨트롤러
	
	// 게시판 전체조회
	@RequestMapping("/getSearchBoard")
	public String getSearchBoard(Model model, BoardVO vo) {
		
		model.addAttribute("list" , boardService.getSearchBoard());
		System.out.println(vo);
		return "board/getSearchBoard";
		
	} 
	@GetMapping("/getBoard")
	public String getBoard(Model model, BoardVO vo) {
		model.addAttribute("board",boardService.getBoard(vo));
		return "board/getBoard";
	}
	
}//end
