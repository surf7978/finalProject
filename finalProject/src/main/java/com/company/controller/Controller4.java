package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.board.service.BoardService;
import com.company.board.service.BoardVO;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;

/*
 * @author 김찬영
 * 
 * 
 * */
@Controller
public class Controller4 {

	//서비스 
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	
	
	// ####맴버에 관한 컨트롤러
	//맴버전체조회
	@RequestMapping("/getSearchMember")
	public String getSearchMember(MemberVO vo, Model model) {
		model.addAttribute("list", memberService.getSearchMember(vo));
		return "member/getSearchMember";
	}
	@GetMapping("/getMember")
	public String getMember(MemberVO vo , Model model) {
		memberService.getMember(vo);
		model.addAttribute("member",memberService.getMember(vo));
		System.out.println("이거슨 맴버 상세조회 페이지의 vo 이올시다 "+vo);
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
	@RequestMapping("/getSearchBoard")	//매퍼를 가져온다.
	public String getSearchBoard(Model model, BoardVO vo) {
		
		model.addAttribute("list" , boardService.getSearchBoard(vo));
		System.out.println(vo);
		return "board/getSearchBoard";
		
	} 
	@GetMapping("/getBoard")
	public String getBoard(Model model, BoardVO vo) {
		model.addAttribute("board",boardService.getBoard(vo));
		return "board/getBoard";
	}
	
	//수정
	@GetMapping("/updateBoard")
	public String updateBoard(BoardVO vo , Model model) {
		System.out.println("관리자 게시판관리 수정 updateBoard의 vo "+ vo);
		boardService.getBoard(vo);
		model.addAttribute("board" , boardService.getBoard(vo));		
		return "board/updateBoard";
	}
	@PostMapping("/updateBoard")
	public String updateBoardProc(BoardVO vo) {
		System.out.println("관리자 게시판관리 수정 updateBoard의 vo의 2 "+ vo);
		boardService.updateBoard(vo);
		return "redirect:getSearchBoard";
	}
	
	@PostMapping("/deleteBoard")
	public String deleteBoard(BoardVO vo , Model model ) {
		boardService.deleteBoard(vo);
		model.addAttribute("deleteBoard", boardService.deleteBoard(vo));
		return "redirect:getSearchBoard";
	}
	
}//end
