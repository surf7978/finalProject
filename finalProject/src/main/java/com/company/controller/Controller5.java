package com.company.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.answer.service.AnswerService;
import com.company.answer.service.AnswerVO;
import com.company.bCart.service.BCartService;
import com.company.bCart.service.BCartVO;
import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.common.Paging;
import com.company.hotel.service.HotelService;
import com.company.hotel.service.HotelVO;
import com.company.question.service.QuestionService;
import com.company.question.service.QuestionVO;

/*
 * @author 박세민
 * 21.03.29 마이페이지-사업자(Business,Question,Answer)
 */
@Controller
public class Controller5 {

	// start of beans
	@Autowired
	BusinessService businessService;

	@Autowired
	QuestionService questionService;

	@Autowired
	AnswerService answerService;

	@Autowired
	HotelService hotelService;

	@Autowired
	BCartService bCartService;
	// end of beans

	// 로그인 후 마이페이지 눌렀을 때의 상황
	// 세션의 id로 조회하기(Session.get사용하기)

	// start of business
	// 마이페이지-사업자-본인정보
	@RequestMapping("/getBusiness")
	public String getBusiness(BusinessVO vo, Model model) {
		// 본인 정보 조회
		vo = businessService.getBusiness(vo);
		model.addAttribute("vo", vo);
		return "business/getBusiness";
	}// end of getBusiness

	// 마이페이지-사업자-본인정보수정 페이지
	@GetMapping("/updateBusiness")
	public String updateBusiness(BusinessVO vo, Model model) {
		vo = businessService.getBusiness(vo);
		model.addAttribute("vo", vo);
		return "business/updateBusiness";
	}// end of updateBusiness
		// 마이페이지-사업자-본인정보수정 페이지

	// 마이페이지-사업자-본인정보수정 기능
	@PostMapping("/updateBusiness")
	public String updateBusinessProc(BusinessVO vo, Model model) {
		// 결과값이 1이면 업데이트 된 것
		businessService.updateBusiness(vo);
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
		paging.setTotalRecord(questionService.getCount(vo));
		model.addAttribute("paging", paging);
		// 조회한 값 list형태로
		List<QuestionVO> list = questionService.getSearchQuestion(vo);
		model.addAttribute("list", list);
		return "question/getSearchQuestion";
	}// end of getSearchQuestion
		// end of business

	// start of question
	// 마이페이지-사업자-문의내역 단건조회
	@GetMapping("/getQuestion")
	public String getQuestion(QuestionVO vo, Model model) {
		// 조회결과 vo에 담기
		vo = questionService.getQuestion(vo);
		// model객체 사용하여 값 전달
		model.addAttribute("vo", vo);
		return "question/getQuestion";
	}// end of getQuestion
		// end of question

	// start of answer
	// 마이페이지-사업자-답변 등록 페이지
	@GetMapping("/insertAnswer")
	public String insertAnswer(AnswerVO vo) {
		vo = answerService.getAnswer(vo);
		// return value 수정하기
		return "insertAnswer";
	}// end of insertAnswer

	// 마이페이지-사업자-답변 등록 기능
	@PostMapping("/insertAnswer")
	public void insertAnswerProc(AnswerVO vo) {
		answerService.insertAnswer(vo);
	}// end of insertAnswerProc

	// 마이페이지-사업자-답변 수정
	@PostMapping("/updateAnswer")
	public void updateAnswer(AnswerVO vo) {
		answerService.updateAnswer(vo);
		// 기능 처리 후 alert 박스 뜨게 하기
	}// end of updateAnswer

	// 마이페이지-사업자-답변 삭제
	@PostMapping("/deleteAnswer")
	public void deleteAnswer(AnswerVO vo) {
		answerService.deleteAnswer(vo);
		// 기능 처리 후 alert 박스 뜨게 하기
	}// end of deleteAnswer

	// 마이페이지-사업자-답변 단건조회
	@RequestMapping("/getAnswer")
	public String getAnswer(AnswerVO vo, Model model) {
		vo = answerService.getAnswer(vo);
		model.addAttribute("vo", vo);
		return "answer/getAnswer";
	}// end of getAnswer

	// 마이페이지-사업자-답변리스트
	@RequestMapping("/getSearchAnswer")
	public String getSearchAnswer(AnswerVO vo, Model model) {
		// 값 조회 후 list에 담기
		List<AnswerVO> list = answerService.getSearchAnswer(vo);
		model.addAttribute("list", list);
		return "answer/getSearchAnswer";
	}// end of getSearchAnswer
		// end of answer

	// start of hotel
	// 사업자-전체리스트(호텔)
	@RequestMapping("/getSearchHotel")
	public String getSearchHotel(HotelVO vo, Model model) {
		List<HotelVO> list = hotelService.getSearchHotel(vo);
		model.addAttribute("list", list);
		return "hotel/getSearchHotel";
	}// end of getSearchHotel

	// 사업자-상세리스트
	@RequestMapping("/getHotel")
	public String getHotel(HotelVO vo, Model model) {
		// 결과 vo
		vo = hotelService.getHotel(vo);
		// 페이지에 전달
		model.addAttribute("vo", vo);
		return "hotel/getHotel";
	}// end of getHotel

	// 사업자-호텔제품등록 페이지
	@GetMapping("/insertHotel")
	public String insertHotel(HotelVO vo) {
		return "hotel/insertHotel";
	}// end of insertHotel

	// 사업자-호텔제품등록 기능
	@PostMapping("/insertHotel")
	public String insertHotelProc(HotelVO vo) {
		hotelService.insertHotel(vo);
		return "redirect:/";
		// 기능 처리 후 등록여부 alert로 알려주기
	}// end of insertHotelProc
		// end of hotel

	// 장바구니-페이지
	@RequestMapping("/getBCart")
	public String getBCart(BCartVO vo, Model model) {
		vo = bCartService.getBCart(vo);
		model.addAttribute("vo", vo);
		return "bCart/getBCart";
	}
	// 장바구니-제품등록 기능
	// 마이페이지-사업자-통계현황

	// 마이페이지-사업자-예약내역조회

	// 나중에
	// 마이페이지-사업자-실시간화장진료 페이지
	// 택시-샘플페이지
	// 동물정보-샘플페이지
}