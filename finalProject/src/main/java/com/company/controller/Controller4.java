package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.board.service.BoardService;
import com.company.board.service.BoardVO;
import com.company.eventAndNotice.service.EventAndNoticeService;
import com.company.eventAndNotice.service.EventAndNoticeVO;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.question.service.QuestionService;
import com.company.question.service.QuestionVO;

/*
 * @author 김찬영
 * 
 * 
 * */
@Controller
public class Controller4 {

	//서비스 
	@Autowired
	MemberService memberService;	// 맴버
	@Autowired
	BoardService boardService;	// 게시판
	@Autowired
	EventAndNoticeService eventAndNoticeService;	// 이벤트 & 공지사항
	@Autowired 
	QuestionService questionService;	//신고하기 관리자가 확인.
	
	// ####★★맴버에 관한 컨트롤러★★
	//맴버전체조회
	@RequestMapping("/getSearchMember")
	public String getSearchMember(MemberVO vo, Model model) {
		model.addAttribute("list", memberService.getSearchMember(vo));
		return "member/getSearchMember";
	}
	//맴버 단건조회
	@GetMapping("/getMember")
	public String getMember(MemberVO vo , Model model) {
		memberService.getMember(vo);
		model.addAttribute("member",memberService.getMember(vo));
		System.out.println("이거슨 맴버 상세조회 페이지의 vo 이올시다 "+vo);
		return "member/getMember";
	}
//	//맴버 입력-> 내가만드는거 아님.
//	@GetMapping("/insertMember")
//	public String insertMember(MemberVO vo) {
//		return "member/insertMember";
//	}
//	//맴버입력 -> 내가 만드는거 아님.
//	@PostMapping("/inserMember")
//	public String insertMemberProc(MemberVO vo) {
//		memberService.insertMember(vo);
//		return "redirect:/getSearchMember";
//	}
	
//	@GetMapping("/deleteMember")
//	public String deleteMemeber(MemberVO vo , Model model) {
//		memberService.deleteMember(vo);
//		model.addAttribute("deleteMember" , memberService.deleteMember(vo));
//		return "member/getMemberList";
//		
//	}
	@PostMapping("/deleteMember")
	public String deleteMemberProc(MemberVO vo , Model model) {
		System.out.println("맴버삭제 vo "+ vo);
		memberService.deleteMember(vo);
		model.addAttribute("deleteMember" , memberService.deleteMember(vo));
		return "redirect:getSearchMember";
	}
	
	// ###★★게시판에 관한 컨트롤러★★
	
	//  게시판 전체조회
	@RequestMapping("/getSearchBoard")	//매퍼를 가져온다.
	public String getSearchBoard(Model model, BoardVO vo) {
		
		model.addAttribute("list" , boardService.getSearchBoard(vo));
		System.out.println(vo);
		return "board/getSearchBoard";
		
	} 
	//게시판 단건조회
	@GetMapping("/getBoard")
	public String getBoard(Model model, BoardVO vo) {
		model.addAttribute("board",boardService.getBoard(vo));
		return "board/getBoard";
	}
	
	//게시판 수정버튼 
	@GetMapping("/updateBoard")
	public String updateBoard(BoardVO vo , Model model) {
		System.out.println("관리자 게시판관리 수정 updateBoard의 vo "+ vo);
		boardService.getBoard(vo);
		model.addAttribute("board" , boardService.getBoard(vo));		
		return "board/updateBoard";
	}
	//수정 폼 
	@PostMapping("/updateBoard")
	public String updateBoardProc(BoardVO vo) {
		System.out.println("관리자 게시판관리 수정 updateBoard의 vo의 2 "+ vo);
		boardService.updateBoard(vo);
		return "redirect:getSearchBoard";
	}
	//게시판 삭제
	@PostMapping("/deleteBoard")
	public String deleteBoard(BoardVO vo , Model model ) {
		boardService.deleteBoard(vo);
		model.addAttribute("deleteBoard", boardService.deleteBoard(vo));
		return "redirect:getSearchBoard";
	}
	
	// ####★★이벤트&공지사항 에 관한 컨트롤러 ★★
	
	//이벤트&공지사항 조회
	@RequestMapping("/getSearchEventAndNotice")
	public String getSearchEventAndNotice(EventAndNoticeVO vo, Model model) {
		model.addAttribute("list", eventAndNoticeService.getSearchEventAndNotice(vo));
		return "eventAndNotice/getSearchEventAndNotice";
	}
	//이벤트 or 공지사항 게시판 선택
	@RequestMapping("/getSearchEventAndNoticeSelect")
	public String getSearchEventAndNoticeSelect(EventAndNoticeVO vo, Model model) {
		model.addAttribute("getSearchEventAndNoticeSelect", eventAndNoticeService.getSearchEventAndNoticeSelect(vo));
		return "eventAndNotice/getSearchEventAndNoticeSelect";
	}
	//이벤트 or 공지사항 단건조회
	@GetMapping("/getEventAndNotice")
	public String getEventAndNotice(EventAndNoticeVO vo, Model model) {
		eventAndNoticeService.getEventAndNotice(vo);
		model.addAttribute("getEventAndNotice" , eventAndNoticeService.getEventAndNotice(vo));
		return  "eventAndNotice/getEventAndNotice";
	}
	
	// ####★★문의하기-신고하기 에 관한 컨트롤러 ★★
	
	@RequestMapping("/getSearchQuestion")	//문의하기 전체조회
	public String getSearchQuestion(QuestionVO vo , Model model) {
		model.addAttribute("getSearchQuestion" , questionService.getSearchQuestion(vo));
		return "question/getSearchQuestion";
	}
	@RequestMapping("/getSearchQuestionSelect1")	//1번은 상품문의
	public String getSearchQuestionSelect1(QuestionVO vo, Model model) {
		model.addAttribute("getSearchQuestionSelect1", questionService.getSearchQuestionSelect1(vo));
		return "question/getSearchQuestionSelect1";
	}
	@RequestMapping("/getSearchQuestionSelect2")	//2번은 고객센터문의
	public String getSearchQuestionSelect2(QuestionVO vo, Model model) {
		model.addAttribute("getSearchQuestionSelect2", questionService.getSearchQuestionSelect2(vo));
		return "question/getSearchQuestionSelect2";
	}
	
	
	@RequestMapping("/getSearchQuestionSelect3")	//3번은 신고하기
	public String getSearchQuestionSelect3(QuestionVO vo, Model model) {
		model.addAttribute("getSearchQuestionSelect3", questionService.getSearchQuestionSelect3(vo));
		return "question/getSearchQuestionSelect3";
	}
	
	
	@GetMapping("/getQuestion")	// 문의하기 상세조회
	public String getQuestion(QuestionVO vo , Model model) {
		questionService.getQuestion(vo);
		model.addAttribute("getQuestion" , questionService.getQuestion(vo));
		return "question/getQuestion";
	}
	
	
}//end
