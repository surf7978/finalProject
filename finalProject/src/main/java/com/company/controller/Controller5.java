package com.company.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.company.answer.service.AnswerService;
import com.company.answer.service.AnswerVO;
import com.company.bCart.service.BCartService;
import com.company.bCart.service.BCartVO;
import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.cafe.service.CafeSearchVO;
import com.company.cafe.service.CafeService;
import com.company.cafe.service.CafeVO;
import com.company.common.FileRenamePolicy;
import com.company.common.Paging;
import com.company.hotel.service.HotelSearchVO;
import com.company.hotel.service.HotelService;
import com.company.hotel.service.HotelVO;
import com.company.question.service.QuestionService;
import com.company.question.service.QuestionVO;
import com.company.taxi.service.TaxiService;

/*
 * @author 박세민
 * 21.03.29 마이페이지-사업자(Business,Question,Answer)
 * 21.03.30 장바구니 1차 수정/택시 API대용으로 T map API or Kakao map API 사용 생각중
 * 21.03.31 마이페이지-사업자-3차 수정
 * 21.04.01 마이페이지-사업자(본인정보,문의,답변 마무리)
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
	BCartService bCartService;
	// 사업자
	@Autowired
	CafeService cafeService;

	@Autowired
	HotelService hotelService;

	@Autowired
	TaxiService taxiService;

	// end of beans

	// start of business
	// 마이페이지-사업자-본인정보 페이지
	@GetMapping("/getBusiness")
	public String getBusiness() {
		return "business/getBusiness";
	}

	// 마이페이지-사업자-본인정보 기능
	@PostMapping("/getBusiness")
	@ResponseBody // json타입으로 변환
	public BusinessVO getBusinessProc(BusinessVO vo, Model model, HttpSession session) {
		// session값 조회
		vo.setBusinessId((String) session.getAttribute("loginID"));
		// 본인정보조회
		vo = businessService.getBusiness(vo);
		// null값 없애기(주소,사업자코드,사업자명)
		if (vo.getAddress() == null)
			vo.setAddress(" ");
		if (vo.getBusinessCode() == null)
			vo.setBusinessCode(" ");
		if (vo.getBusinessCompanyName() == null)
			vo.setBusinessCompanyName(" ");
		return vo;
	}// end of getBusiness

	// 마이페이지-사업자-본인정보수정 페이지 호출
	@GetMapping("/updateBusiness")
	public String updateBusiness(BusinessVO vo, Model model, HttpSession session) {
		// 본인정보 조회 후 vo 재사용 가능한지
		// session값 조회
		vo.setBusinessId((String) session.getAttribute("loginID"));
		// 본인정보조회
		vo = businessService.getBusiness(vo);
		model.addAttribute("vo", vo);
		return "business/updateBusiness";
	}// end of updateBusiness

	// 마이페이지-사업자-본인정보수정 기능
	@PostMapping("/updateBusiness")
	public void updateBusinessProc(BusinessVO vo, Model model, HttpServletResponse response) throws Exception {
		// 결과값이 1이면 업데이트 된 것
		int r = businessService.updateBusiness(vo);
		System.out.println("확인용:" + r);
		// alert
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (r == 1) {
			writer.println("<script>alert('수정되었습니다')");
		} else {
			writer.println("<script>alert('오류..다시입력해주세요..')");
		}
		writer.println("location.href='getBusiness'");
		writer.println("</script>");
		writer.close();
	}// end of updateBusiness

	// 마이페이지-사업자-문의내역 리스트
	@GetMapping("/getSearchQuestion")
	public String getSearchQuestion() {
		return "question/getSearchQuestion";
	}

	// 마이페이지-사업자-문의내역 리스트 ajax
	@PostMapping("/getSearchQuestion")
	@ResponseBody
	public List<QuestionVO> getSearchQuestionProc(QuestionVO vo, Model model, HttpSession session) {// 사업자 아이디로 조회
		// toPerson=사업자아이디를 의미함
		vo.setToPerson((String) session.getAttribute("loginID"));
		// 조회한 값 list형태로
		List<QuestionVO> list = questionService.getSearchQuestion(vo);
		model.addAttribute("list", list);
		return list;
	}// end of getSearchQuestion
		// end of business

	// start of question
	// 마이페이지-사업자-문의내역 단건조회
	@RequestMapping("/getQuestion")
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
	public String insertAnswer(QuestionVO vo, Model model) {
		vo = questionService.getQuestion(vo);
		// questionNumber,memberId가져와야함
		model.addAttribute("vo", vo);
		return "answer/insertAnswer";
	}// end of insertAnswer

	// 마이페이지-사업자-답변 등록 기능
	@PostMapping("/insertAnswer")
	public void insertAnswerProc(AnswerVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		// 작성자만 vo에 담기
		String id = session.getAttribute("loginID").toString();
		vo.setWriter(id);
		int r = answerService.insertAnswer(vo);
		// alert
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (r == 1) {
			writer.println(
					"<script>alert('답변이 등록되었습니다');opener.location.href='getSearchAnswer';window.close();</script>");
		} else {
			writer.println(
					"<script>alert('오류..다시 등록해주세요..');opener.location.href='getSearchAnswer';window.close();</script>");
		}
		writer.close();
	}// end of insertAnswerProc

	// 마이페이지-사업자-답변 수정 페이지
	@GetMapping("/updateAnswer")
	public String updateAnswer(AnswerVO vo, Model model) {
		vo = answerService.getAnswer(vo);
		model.addAttribute("vo", vo);
		return "answer/updateAnswer";
	}

	// 마이페이지-사업자-답변 수정 기능
	@PostMapping("/updateAnswer")
	public void updateAnswerProc(AnswerVO vo, HttpServletResponse response) throws Exception {
		int r = answerService.updateAnswer(vo);
		// alert
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (r == 1) {
			writer.println("<script>alert('수정되었습니다..');location.href='getSearchAnswer';</script>");
		} else {
			writer.println("<script>alert('오류..다시 수정해주세요..');location.href='getSearchAnswer';</script>");
		}
		writer.close();
		// 기능 처리 후 alert 박스 뜨게 하기
	}// end of updateAnswer

	// 마이페이지-사업자-답변 삭제
	@RequestMapping("/deleteAnswer")
	public void deleteAnswer(AnswerVO vo, HttpServletResponse response) throws Exception {
		int r = answerService.deleteAnswer(vo);
		// alert
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (r == 1) {
			writer.println("<script>alert('삭제되었습니다..');location.href='getSearchAnswer';window.close();</script>");
		} else {
			writer.println(
					"<script>alert('오류..다시 삭제해주세요..');location.href='getSearchAnswer';window.close();window.close();</script>");
		}
		writer.close();
	}// end of deleteAnswer

	// 마이페이지-사업자-답변 단건조회
	@GetMapping("/getAnswer")
	public String getAnswer(AnswerVO vo, Model model) {
		vo = answerService.getAnswer(vo);
		model.addAttribute("vo", vo);
		return "answer/getAnswer";
	}// end of getAnswer

	// 마이페이지-사업자-답변리스트
	@GetMapping("/getSearchAnswer")
	public String getSearchAnswer() {
		return "answer/getSearchAnswer";
	}

	// 마이페이지-사업자-답변리스트
	@PostMapping("/getSearchAnswer")
	@ResponseBody
	public List<AnswerVO> getSearchAnswer(AnswerVO vo, Model model, HttpSession session) {
		// 세션 ID 값
		String id = session.getAttribute("loginID").toString();
		vo.setWriter(id);
		// 값 조회 후 list에 담기
		List<AnswerVO> list = answerService.getSearchAnswer(vo);
		return list;
	}// end of getSearchAnswer
		// end of answer

	// start of Cafe
	// 사업체-카페-상품등록 페이지
	@GetMapping("/insertCafe")
	public String insertCafe() {
		return "cafe/insertCafe";
	}

	// 사업체-카페-상품등록 기능
	@PostMapping("/insertCafe")
	public void insertCafeProc(CafeVO vo, BusinessVO bvo, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws Exception {
		// 사업자 번호를 어디서 가져올 것인지
		// 1.session
		// 2. id로 businessTable 조회
		String id = session.getAttribute("loginID").toString();
		bvo.setBusinessId(id);
		bvo = businessService.getBusiness(bvo);
		// 3. business의 사업자 번호 가져와 넣기
		vo.setBusinessNumber(bvo.getBusinessNumber());
		// 첨부파일처리
		// 1.vo값 가져오기
		MultipartFile image1 = vo.getT_uploadFile();
		MultipartFile image2 = vo.getUploadFile();
		// 2.저장될path설정
		String path = request.getSession().getServletContext().getRealPath("/resources/images/business");
		// 3.중복채크
		if (image1 != null && !image1.isEmpty() && image1.getSize() > 0) {
			String filename = image1.getOriginalFilename();
			// 파일명
			File rename = FileRenamePolicy.rename(new File(path, filename));
			image1.transferTo(rename);
			vo.setImage1(rename.getName());
		} // end of if

		if (image2 != null && !image2.isEmpty() && image2.getSize() > 0) {
			String filename = image2.getOriginalFilename();
			// 파일명
			File rename = FileRenamePolicy.rename(new File(path, filename));
			image2.transferTo(rename);
			vo.setImage2(rename.getName());
		} // end of if
			// 등록처리
		int r = cafeService.insertCafe(vo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (r == 1) {
			writer.print("<script>alert('등록되었습니다');location.href='getSearchCafe'</script>");
		} else {
			writer.print("<script>alert('오류..다시등록해주세요');location.href='insertCafe'</script>");
		}
		writer.close();

	}// end of insertCafe

	// 사업자-카페-전체리스트(form)
	@GetMapping("/getSearchCafeForm")
	public String getSearchCafe(CafeSearchVO vo) {
		return "cafe/getSearchCafeForm";
	}// end of getSearchCafe

	// 사업자-카페-전체리스트(ajax)
	@GetMapping("/getSearchCafe")
	@ResponseBody
	public Map<String, Object> getSearchCafeProc(CafeSearchVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 1.페이지 설정
		paging.setPageUnit(5);//
		paging.setPageSize(3);// 페이지 번호 수
		// 2.초기페이지 설정
		if (paging.getPage() == null)
			paging.setPage(1);
		// 3. 값 추가
		paging.setTotalRecord(cafeService.getCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		List<CafeVO> list = cafeService.getSearchCafe(vo);
		// map에 넘겨주는 이유:model보다 사용이 편리해서
		map.put("paging", paging);
		map.put("list", list);
		// Cafe List
		return map;
	}// end of getSearchCafeProc

	// 사업자-카페-상세리스트 페이지 호출
	@GetMapping("/getCafe")
	public String getCafeProc(CafeVO vo, Model model) {
		// 카페 상세 정보조회
		vo = cafeService.getCafe(vo);
		model.addAttribute("vo", vo);
		return "cafe/getCafe";
	}
	//사업자-카페/호텔/택시 페이지 호출
	@RequestMapping("/getSearchListForm")
	public String getSearchBusinessForm() {
		return "business/getSearchListForm";
	}
	//

	// 사업자-통합리스트1
	@GetMapping("/getSearchList1")
	@ResponseBody
	public Map<String, Object> getSearchList1(CafeSearchVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 1.페이지 설정
		paging.setPageUnit(5);//
		paging.setPageSize(3);// 페이지 번호 수
		// 2.초기페이지 설정
		if (paging.getPage() == null)
			paging.setPage(1);
		// 3. 값 추가
		paging.setTotalRecord(cafeService.getCountList1(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		List<CafeVO> list = cafeService.getSearchList1(vo);
		// map에 넘겨주는 이유:model보다 사용이 편리해서
		map.put("paging", paging);
		map.put("list", list);
		// Cafe List
		return map;
	}// end of getSearchCafeProc
	
	//사업자-통합리스트2
	
	
	// start of bCart
	// 장바구니-페이지 호출
	@GetMapping("/getSearchBCart")
	public String getSearchBCart(BCartVO vo) {
		return "bCart/getSearchBCart";
	}

	// 장바구니-페이지 기능
	@PostMapping("/getSearchBCart")
	@ResponseBody
	public List<BCartVO> getSearchBCartProc(BCartVO vo) {
		List<BCartVO> list = bCartService.getSearchBCart(vo);
		return list;
	}

	// 장바구니-등록
	@RequestMapping("/insertBCart")
	public void insertBCart(BCartVO vo) {
		bCartService.insertBCart(vo);
	}

	// 장바구니-삭제
	@RequestMapping("/deleteBCart")
	public void deleteBCart(BCartVO vo) {
		bCartService.deleteBCart(vo);
	}

	// 지도-샘플페이지
	@RequestMapping("/map")
	public String map() {
		return "map/map";
	}

	// end of bCart
	// 나중에
	// 마이페이지-사업자-통계현황
	// 마이페이지-사업자-예약내역조회
	// 마이페이지-사업자-실시간화장진료 페이지
	// 동물정보-샘플페이지
}