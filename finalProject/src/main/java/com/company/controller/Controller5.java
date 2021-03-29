package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.answer.service.AnswerVO;
import com.company.answer.service.impl.AnswerMapper;
import com.company.business.service.BusinessVO;
import com.company.business.service.impl.BusinessMapper;
import com.company.common.Paging;
import com.company.question.service.QuestionVO;
import com.company.question.service.impl.QuestionMapper;

@Controller
public class Controller5 {

	// start of beans
	@Autowired
	BusinessMapper bMapper;

	@Autowired
	QuestionMapper qMapper;

	@Autowired
	AnswerMapper aMapper;
	// end of beans

	// 로그인 후 마이페이지 눌렀을 때의 상황
	// 세션의 id로 조회하기(Session.get사용하기)

	// start of business
	// 마이페이지-사업자-본인정보
	@RequestMapping("/getBusiness")
	public String getBusiness(BusinessVO vo, Model model) {
		// 본인 정보 조회
		vo = bMapper.getBusiness(vo);
		model.addAttribute("vo", vo);
		return "business/getBusiness";
	}// end of getBusiness

	// 마이페이지-사업자-본인정보수정 페이지
	@GetMapping("/updateBusiness")
	public String updateBusiness(BusinessVO vo, Model model) {
		vo = bMapper.getBusiness(vo);
		model.addAttribute("vo", vo);
		return "business/updateBusiness";
	}// end of updateBusiness
		// 마이페이지-사업자-본인정보수정 페이지

	// 마이페이지-사업자-본인정보수정 기능
	@PostMapping("/updateBusiness")
	public String updateBusinessProc(BusinessVO vo, Model model) {
		// 결과값이 1이면 업데이트 된 것
		bMapper.updateBusiness(vo);
		model.addAttribute("vo", vo);
		return "business/updateBusiness";
	}// end of updateBusiness

	// 마이페이지-사업자-문의내역 리스트
	@RequestMapping("/getSearchQuestion")
	public String getSearchQuestion(QuestionVO vo, Paging paging, Model model) {
		//
		paging.setPageUnit(5);// page record view
		paging.setPageSize(3);// page number
		// paging
		if (vo.getPage() == null)
			vo.setPage(1);

		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		// 전체 페이지 조회
		paging.setTotalRecord(qMapper.getCount(vo));
		model.addAttribute("paging", paging);
		// 조회한 값 list형태로
		List<QuestionVO> list = qMapper.getSearchQuestion(vo);
		model.addAttribute("list", list);
		return "question/getSearchQuestion";
	}// end of getSearchQuestion
	// end of business

	// start of question
	// 마이페이지-사업자-특정사용자-문의내역조회
	@GetMapping("/getQuestion")
	public String getQuestion(QuestionVO vo, Model model) {
		// 조회결과 vo에 담기
		vo = qMapper.getQuestion(vo);
		// model객체 사용하여 값 전달
		model.addAttribute("vo", vo);
		return "question/getQuestion";
	}// end of getQuestion
	//end of question
	
	
	//start of answer
	// 마이페이지-사업자-답변 등록 페이지
	@GetMapping("/insertAnswer")
	public String insertAnswer(AnswerVO vo) {
		vo = aMapper.getAnswer(vo);
		// return value 수정하기
		return "insertAnswer";
	}// end of insertAnswer

	// 마이페이지-사업자-답변 등록 기능
	@PostMapping("/insertAnswer")
	public void insertAnswerProc(AnswerVO vo) {
		aMapper.insertAnswer(vo);
	}// end of insertAnswerProc

	// 마이페이지-사업자-답변 수정
	@PostMapping("/updateAnswer")
	public void updateAnswer(AnswerVO vo) {
		aMapper.updateAnswer(vo);
		// 기능 처리 후 alert 박스 뜨게 하기
	}// end of updateAnswer

	// 마이페이지-사업자-답변 삭제
	@PostMapping("/deleteAnswer")
	public void deleteAnswer(AnswerVO vo) {
		aMapper.deleteAnswer(vo);
		// 기능 처리 후 alert 박스 뜨게 하기
	}// end of deleteAnswer

	// 마이페이지-사업자-특정답변조회
	@RequestMapping("/getAnswer")
	public String getAnswer(AnswerVO vo, Model model) {
		vo = aMapper.getAnswer(vo);
		model.addAttribute("vo", vo);
		return "answer/getAnswer";
	}// end of getAnswer

	// 마이페이지-사업자-답변리스트
	@RequestMapping("/getSearchAnswer")
	public String getSearchAnswer(AnswerVO vo, Model model) {
		// 값 조회 후 list에 담기
		List<AnswerVO> list = aMapper.getSearchAnswer(vo);
		model.addAttribute("list", list);
		return "answer/getSearchAnswer";
	}// end of getSearchAnswer
	//end of answer
	
	
	//start of reservation
	// 마이페이지-사업자-예약내역조회
	//end of reservation
	
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