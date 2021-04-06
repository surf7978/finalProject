package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.answer.service.AnswerService;
import com.company.answer.service.AnswerVO;
import com.company.answer.service.AnswerVO;
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
	@Autowired 
	AnswerService  answerService;
	
	//컨트롤러 4의 페이지로 가기
	@GetMapping("/getSearchCr4")
	public String getSearchCr4() {
		
		
		return "admin/getSearchCr4";
		
	}
	
	// ####★★맴버에 관한 컨트롤러★★
	//맴버전체조회
	@RequestMapping("/getSearchMember")
	public String getSearchMember(MemberVO vo, Model model) {
		model.addAttribute("list", memberService.getSearchMember(vo));
		return "member/getSearchMember";
	}
	//맴버 단건조회
	@GetMapping("/getMemberCr4")
	public String getMember(MemberVO vo , Model model, HttpSession session) {
		// session 값 조회
		System.out.println(vo);
		//맴버정보 조회
		memberService.getMemberCr4(vo);
		model.addAttribute("getMemberCr4",memberService.getMemberCr4(vo));
		return "member/getMemberCr4";
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
	@GetMapping("/insertEventAndNotice")
	public String insertEventAndNotice() {
		
		return "eventAndNotice/insertEventAndNotice";
		
	}
	@PostMapping("/insertEventAndNotice")
	public String insertEventAndNoticeProc(EventAndNoticeVO vo) {
		eventAndNoticeService.insertEventAndNotice(vo);
		System.out.println(vo);
		return "redirect:/getSearchEventAndNotice";
		
	}
	
	//이벤트 or 공지사항 단건조회
	@GetMapping("/getEventAndNotice")
	public String getEventAndNotice(EventAndNoticeVO vo, Model model) {
		eventAndNoticeService.getEventAndNotice(vo);
		model.addAttribute("getEventAndNotice" , eventAndNoticeService.getEventAndNotice(vo));
		return  "eventAndNotice/getEventAndNotice";
	}
	
	//이벤트  or 공지사항 수정 선택
	@GetMapping("/updateEventAndNotice")
	public String updateEventAndNotice(EventAndNoticeVO vo , Model model ) {
		System.out.println("updateEventAndNotice의 vo" + vo);
		eventAndNoticeService.getEventAndNotice(vo);
		model.addAttribute("getEventAndNotice" , eventAndNoticeService.getEventAndNotice(vo) );
		return "eventAndNotice/updateEventAndNotice";

	}
	//이벤트 or 공지사항 처리 
	@PostMapping("/updateEventAndNotice")
	public String updateEventAndNoticeProc(EventAndNoticeVO vo ) {
		System.out.println("updateEventAndNoticeProc의 vo" + vo);
		eventAndNoticeService.updateEventAndNotice(vo);
		return "redirect:/getSearchEventAndNotice";
	}
	@PostMapping("/deleteEventAndNotice")
	public String deleteEventAndNoticeProc(EventAndNoticeVO vo , Model model) {
		System.out.println("삭제 vo "+ vo);
		eventAndNoticeService.deleteEventAndNotice(vo);
		model.addAttribute("deleteEventAndNotice" , eventAndNoticeService.deleteEventAndNotice(vo));
		return "redirect:/";
	}
	
	
	// ####★★문의하기-신고하기 에 관한 컨트롤러 ★★ (question & answer 테이블 함께 사용)
	
	@GetMapping("/insertQuestion2")			//문의하기 2.고객센터문의 접수 	로그인해서 세션넘기기
	public String insertQuestion2(QuestionVO vo ) {
		return "admin/insertQuestion2";
	}
	@PostMapping("/insertQuestion2")		//문의하기 2.고객센터문의 접수 
	public String insertQuestion2Proc(QuestionVO vo) {
		System.out.println(vo);
		questionService.insertQuestion2(vo);
		return "redirect:/getSearchQuestionSelect2";
	}
	
	@GetMapping("/insertQuestion3")			//문의하기 3.신고접수 페이지 넘기기	
	public String insertQuestion3(QuestionVO vo ) {
		return "admin/insertQuestion3";
	}
	@PostMapping("/insertQuestion3")		//문의하기 3.신고접수 값 집어넣기
	public String insertQuestion3Proc(QuestionVO vo) {
		System.out.println(vo);
		questionService.insertQuestion3(vo);
		return "redirect:/getSearchQuestionSelect3";
	}
	
	@RequestMapping("/getSearchQuestionCr4")	//문의하기 전체조회
	public String getSearchQuestion(QuestionVO vo , Model model) {
		model.addAttribute("getSearchQuestionCr4" , questionService.getSearchQuestionCr4(vo));
		return "admin/getSearchQuestionCr4";
	}
	@RequestMapping("/getSearchQuestionSelect1")	//1번은 상품문의 전체조회
	public String getSearchQuestionSelect1(QuestionVO vo, Model model) {
		model.addAttribute("getSearchQuestionSelect1", questionService.getSearchQuestionSelect1(vo));
		return "admin/getSearchQuestionSelect1";
	}
	
	
	@GetMapping("/getQuestion1")	// 상품문의 상세조회 
	public String getQuestion1(QuestionVO vo , Model model) {
		System.out.println(vo);
		questionService.getQuestion1(vo);
		model.addAttribute("getQuestion1" , questionService.getQuestion1(vo));
		return "admin/getQuestion1";
	}
	
	
	@GetMapping("/getQuestion1Ans")	// 문의하기 상세조회 신고하기
	public String insertAnswer1Cr4(QuestionVO vo , Model model) {
		questionService.getQuestion1Ans(vo);
		model.addAttribute("getQuestion1Ans" , questionService.getQuestion1Ans(vo));
		return "admin/insertAnswer1Cr4";
	}
	
	@PostMapping("/insertAnswer1Cr4")	//문의하기 에 답장하기
	public String insertAnswer1Cr4Proc(AnswerVO vo) {
		System.out.println(vo);
		answerService.insertAnswer1Cr4(vo);
		return "redirect:/";
	}
	
	
	@RequestMapping("/getSearchQuestionSelect2")	//2번은 고객센터문의
	public String getSearchQuestionSelect2(QuestionVO vo, Model model) {
		model.addAttribute("getSearchQuestionSelect2", questionService.getSearchQuestionSelect2(vo));
		return "admin/getSearchQuestionSelect2";
	}
	
	@GetMapping("/getQuestion2")	// 문의하기 상세조회 신고하기
	public String getQuestion2(QuestionVO vo , Model model) {
		System.out.println(vo);
		questionService.getQuestion2(vo);
		model.addAttribute("getQuestion2" , questionService.getQuestion2(vo));
		return "admin/getQuestion2";
	}
	
	
	@GetMapping("/getQuestion2Ans")	// 문의하기 상세조회 신고하기
	public String insertAnswer2Cr4(QuestionVO vo , Model model) {
		questionService.getQuestion2Ans(vo);
		model.addAttribute("getQuestion2Ans" , questionService.getQuestion2Ans(vo));
		return "admin/insertAnswer2Cr4";
	}
	
	@PostMapping("/insertAnswer2Cr4")	//문의하기 에 답장하기
	public String insertAnswer2Cr4Proc(AnswerVO vo) {
		System.out.println(vo);
		answerService.insertAnswer2Cr4(vo);
		return "redirect:/";
	}
	
	@RequestMapping("/getSearchQuestionSelect3")	//3번은 신고하기
	public String getSearchQuestionSelect3(QuestionVO vo, Model model) {
		model.addAttribute("getSearchQuestionSelect3", questionService.getSearchQuestionSelect3(vo));
		return "admin/getSearchQuestionSelect3";
	}
	
	
	@GetMapping("/getQuestion3")	// 문의하기 상세조회 신고하기
	public String getQuestion3(QuestionVO vo , Model model) {
		System.out.println(vo);
		questionService.getQuestion3(vo);
		model.addAttribute("getQuestion3" , questionService.getQuestion3(vo));
		return "admin/getQuestion3";
	}
	@GetMapping("/getQuestion3Ans")	// 문의하기 상세조회 신고하기
	public String getQuestion3Ans(QuestionVO vo , Model model) {
		questionService.getQuestion3Ans(vo);
		model.addAttribute("getQuestion3Ans" , questionService.getQuestion3Ans(vo));
		return "admin/insertAnswer3Cr4";
	}
	@PostMapping("/insertAnswer3Cr4")	//신고에 답장하기
	public String insertAnswerCr4(AnswerVO vo) {
		System.out.println(vo);
		answerService.insertAnswer3Cr4(vo);
		return "redirect:/";
	}
	@RequestMapping("/getSearchAnswerCr4") //답장 전체보기
	public String getSearchAnswerCr4(AnswerVO  vo, Model model ) {
		answerService.getSearchAnswerCr4(vo);
		model.addAttribute("getSearchAnswerCr4" , answerService.getSearchAnswerCr4(vo));
		return "admin/getSearchAnswerCr4";	// 이기능이 작동이 안된다 월요일 해결.
		 
	}
	
	
	@PostMapping("/deleteAnswerCr4")
	public String deleteAnswerCr4(AnswerVO vo) {
		System.out.println("관리자 답변 삭제 vo "+ vo);
		answerService.deleteAnswerCr4(vo);
		return "redirect:/getSearchAnswerCr4";
	}

	
	
	
}//end
