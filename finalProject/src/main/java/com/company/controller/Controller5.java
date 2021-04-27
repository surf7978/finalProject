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

import com.company.animal.service.AnimalService;
import com.company.animal.service.AnimalVO;
import com.company.answer.service.AnswerService;
import com.company.answer.service.AnswerVO;
import com.company.bCart.service.BCartService;
import com.company.bCart.service.BCartVO;
import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.cafe.service.CafeSearchVO;
import com.company.cafe.service.CafeService;
import com.company.cafe.service.CafeVO;
import com.company.cart.service.CartService;
import com.company.cart.service.CartVO;
import com.company.common.FileRenamePolicy;
import com.company.common.Paging;
import com.company.integrated.service.IntegratedSearchVO;
import com.company.integrated.service.IntegratedService;
import com.company.integrated.service.IntegratedVO;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;
import com.company.question.service.QuestionService;
import com.company.question.service.QuestionVO;
import com.company.reservation.service.ReservationService;
import com.company.reservation.service.ReservationVO;
import com.company.review.service.ReviewService;
import com.company.review.service.ReviewVO;

/*
 * @author 박세민
 * 21.03.29 마이페이지-사업자(Business,Question,Answer)
 * 21.03.30 장바구니 1차 수정/택시 API대용으로 T map API or Kakao map API 사용 생각중
 * 21.03.31 마이페이지-사업자-3차 수정
 * 21.04.01 마이페이지-사업자(본인정보,문의,답변 마무리)
 * 21.04.02 사업체-카페-전체리스트 1차 수정
 * 21.04.05 사업체-카페-전체리스트 2차 수정
 * 21.04.06 사업체-카페-전체리스트 3차 수정(Ajax,paging)
 * 21.04.07 사업체-통합 리스트(Ajax,paging,search,checkbox)
 * 21.04.08 사업체-통합 리스트 세분화(카테고리 별 검색 완)
 * 21.04.09 Oracle Cloud DB 설정 / 사업자-통합 리스트(checkbox 여러개 채크시 포함되는 결과 전부 나오도록 변경) / 사업자 통합 등록 페이지 폼,기능 완
 * 21.04.11 통합 페이지 4차 수정(mapper)
 * 21.04.12 통합 페이지 동적테스트 / 사업자-게시글CRUD 1차 수정(동적 테이블 생성 script)
 * 21.04.13 장바구니 1차 / 사업자-게시글CRUD 2차(전체조회,삭제,등록)
 * 21.04.14 장바구니 2차 / 사업자-게시글CRUD 3차(단건조회,수정)
 * 21.04.15 장바구니 3차(토탈 장바구니로 변경) / 사업자-게시글CRUD 3차 수정(조회,삭제)
 * 21.04.16 장바구니 4차(채크박스) 
 * 21.04.17 장바구니 5차(하단 총액부분)
 * 21.04.19 장바구니 6차 수정(단건 삭제 ok, 여러건 삭제, 전체합계금액, 데이터 값 정상 출력),결제내역차트 1차 수정
 * 21.04.20 결제내역차트 1차 수정 
 * 21.04.22 차트 최종수정
 * 21.04.23 화상통화 1차 완료
 */
@Controller
public class Controller5 {
	// 사업자
	@Autowired
	BusinessService businessService;
	// 질문
	@Autowired
	QuestionService questionService;
	// 답변
	@Autowired
	AnswerService answerService;
	// 카페
	@Autowired
	CafeService cafeService;
	// 사업체 통합
	@Autowired
	IntegratedService integratedService;
	// 장바구니
	@Autowired
	CartService cartService;
	@Autowired
	BCartService bCartService;
	// 예약
	@Autowired
	ReservationService reservationService;
	// 리뷰
	@Autowired
	ReviewService reviewService;
	// 결제
	@Autowired
	PayAndDeliveryService payAndDeliveryService;
	// 맴버
	@Autowired
	MemberService memberService;
	// 동물정보
	@Autowired
	AnimalService animalService;

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

	// 마이페이지-사업자-문의내역 단건조회
	@RequestMapping("/getQuestion")
	public String getQuestion(QuestionVO vo, Model model) {
		// 조회결과 vo에 담기
		vo = questionService.getQuestion(vo);
		// model객체 사용하여 값 전달
		model.addAttribute("vo", vo);
		return "question/getQuestion";
	}// end of getQuestion

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

	// 사업자-통합 페이지 호출
	@RequestMapping("/getSearchListForm")
	public String getSearchBusinessForm() {
		return "business/getSearchListForm";
	}

	// 사업자-통합리스트
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
		// System.out.println("값:" + vo.getMenu());
		// map에 넘겨주는 이유:model보다 사용이 편리해서
		map.put("paging", paging);
		map.put("list", list);
		// Cafe List
		return map;
	}// end of getSearchCafeProc

	// 사업자-통합상세페이지
	@GetMapping("/getSearchInfo") // 로그인 하지 않아도 보여야함
	public String getSearchInfo(IntegratedVO vo, Model model, HttpSession session) {
		// seq값 2자리 잘라서 code값에 넣기
		vo.setCode(vo.getSeq().substring(0, 2));
		// 코드값 -> 테이블명 변환
		seqConversion(vo);
		// 조회
		vo = integratedService.getIntegrated(vo);
		model.addAttribute("vo", vo);

		// 상세조회 시 + 구매평 전체리스트 출력 + 문의내역 전체리스트 출력
		String seq = vo.getSeq();
		if (session.getAttribute("loginID") != null) {
			ReservationVO vo1 = new ReservationVO();
			vo1.setMemberId((String) session.getAttribute("loginID")); // 로그인한 세션 아이디를 ReservationVO의 memberId에 담음
			vo1.setBisNumber(seq); // seq를 BisNumber에 담음
			model.addAttribute("reservation", reservationService.getViewReservation(vo1));
			// 위의 두 값으로
			// getViewReservation해서
			// 조회된 값을 모델에 담음
			// 위의 두 값은 쿼리문 WHERE절에 필요한값들
		}
		ReviewVO vo2 = new ReviewVO();
		vo2.setProbisNumber(seq);
		model.addAttribute("review", reviewService.getSearchReview(vo2));

		QuestionVO vo3 = new QuestionVO();
		vo3.setProbisNumber(seq);
		model.addAttribute("question", questionService.getSearchQuestionProbis(vo3));

		return "business/getSearchInfo";
	}

	// 사업자-통합 등록 폼
	@GetMapping("/insertIntegratedForm")
	public String insertIntegratedForm() {
		return "business/insertIntegratedForm";
	}// end of insertIntegratedForm

	// 사업체-통합 등록 기능
	@PostMapping("/insertIntegrated")
	// 통합이라 vo값을 어떻게 처리해야할지
	public void insertIntegrated(IntegratedVO vo, BusinessVO bvo, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws Exception {
		// 사업자 번호를 어디서 가져올 것인지
		// session method
		vo.setCode(sessionSelect(session, vo));
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
		int r = integratedService.insertIntegrated(vo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (r == 1) {
			writer.print("<script>alert('등록되었습니다');location.href='getSearchIntegratedForm'</script>");
		} else {
			writer.print("<script>alert('오류..다시등록해주세요');location.href='insertIntegratedForm'</script>");
		}
		writer.close();

	}// end of insertIntegrated

	// 사업자-게시글 관리 CRUD
	// 사업자-게시글 관리 수정 요청
	@GetMapping("/updateIntegrated")
	public void updateIntegrated(IntegratedVO vo, Model model, HttpSession session) {
		// 공통기능
		vo.setCode(sessionSelect(session, vo));
		// 조회
		vo = integratedService.getIntegrated(vo);
		model.addAttribute("vo", vo);
	}

	// 수정기능
	@PostMapping("/updateIntegrated")
	public void updateIntegratedProc(IntegratedVO vo) {
		integratedService.updateIntegrated(vo);
	}

	// 삭제기능
	@RequestMapping("/deleteIntegrated")
	@ResponseBody
	public int deleteIntegrated(IntegratedVO vo, BusinessVO bvo, HttpSession session) throws Exception {
		// session method
		vo.setCode(sessionSelect(session, vo));
		vo.setSeq(vo.getSeq());
		// process
		int r = integratedService.deleteIntegrated(vo);
		return r;
	}

	// 사업자-게시글 단건 조회
	@RequestMapping("/getIntegrated")
	public String getIntegratedProc(IntegratedVO vo, Model model, HttpSession session) {
		// 공통기능
		vo.setCode(sessionSelect(session, vo));
		// 조회
		vo = integratedService.getIntegrated(vo);
		model.addAttribute("vo", vo);

		return "business/getIntegrated";
	}

	// 사업자-게시글 관리 폼 호출
	@RequestMapping("/getSearchIntegratedForm")
	public String getSearchIntegratedForm() {
		return "business/getSearchIntegratedForm";
	}

	// 사업자-게시글 관리 ajax
	@GetMapping("/getSearchIntegrated")
	@ResponseBody
	public Map<String, Object> getSearchIntegrated(IntegratedSearchVO vo, BusinessVO bvo, Paging paging,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		// SESSION
		vo.setCode(sessionSelect(session, vo));
		// PAGING
		// 1. 페이지 설정
		paging.setPageUnit(5);//
		paging.setPageSize(3);// 페이지 번호 수
		// 2. 초기페이지 설정
		if (paging.getPage() == null)
			paging.setPage(1);
		// 3. 값 추가
		paging.setTotalRecord(integratedService.getCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		List<IntegratedVO> list = integratedService.getSearchIntegrated(vo);
		// map에 담음
		map.put("paging", paging);
		map.put("list", list);
		return map;
	}

	// 통합 장바구니 페이지 폼
	@GetMapping("/getSearchTotalCartForm")
	public String getSearchTotalCartForm() {
		return "totalCart/getSearchTotalCartForm";
	}

	// 통합 장바구니 페이지 호출
	@GetMapping("/getSearchTotalCart")
	@ResponseBody
	public List<CartVO> getSearchTotalCart(CartVO vo, HttpSession session) {
		// 세션 ID값 조회
		String id = session.getAttribute("loginID").toString();
		// ID값 담음
		vo.setMemberId(id);
		// 조회 후 값 넘김
		List<CartVO> list = bCartService.getSearchTotalCart(vo);
		return list;
	}

	// 장바구니-CRUD
	@GetMapping("/insertCart") // 등록
	@ResponseBody
	public int insertCart(CartVO vo) {
		int r = cartService.insertCart(vo);
		return r;
	}

	@GetMapping("/updateCart") // 수정
	@ResponseBody
	public int updateCart(CartVO vo) {
		int r = cartService.updateCart(vo);
		return r;
	}

	@GetMapping("/deleteCart") // 삭제
	@ResponseBody
	public int deleteCart(CartVO vo) {
		int r = cartService.deleteCart(vo);
		return r;
	}

	// 사업자 장바구니 CRUD
	@RequestMapping("/insertBCart") // 등록
	@ResponseBody
	public int insertBCart(BCartVO vo) {
		int r = bCartService.insertBCart(vo);
		return r;
	}

	@RequestMapping("/updateBCart") // 수정
	@ResponseBody
	public int updateBCart(BCartVO vo) {
		int r = bCartService.updateBCart(vo);
		return r;

	}

	@RequestMapping("/deleteBCart") // 삭제
	@ResponseBody
	public int deleteBCart(BCartVO vo) {
		int r = bCartService.deleteBCart(vo);
		return r;

	}

	// 지도-샘플페이지
	@RequestMapping("/map")
	public String map() {
		return "map/map";
	}

	// 마이페이지-사업자-통계 페이지
	@RequestMapping("/getSearchChart")
	public String getSearchChart() {
		return "chart/getSearchChart";
	}

	// 마이페이지-사업자-통계 데이터
	@RequestMapping("/getColumnChart")
	@ResponseBody
	public List<Map<String, Object>> getSearchColumnChart(PayAndDeliveryVO vo, BusinessVO bvo, MemberVO mvo,
			HttpSession session) {
		// session ID 조회
		String id = session.getAttribute("loginID").toString();
		// ID값 분배
		bvo.setBusinessId(id);
		// 관리자인 경우
		if (id.equals("admin")) {
			mvo.setMemberId(id);
			mvo = memberService.getMember(mvo);
			vo.setCategory("70");
			List<Map<String, Object>> map = payAndDeliveryService.getColumnChart(vo);
			return map;
		}
		// DB 데이터 조회
		bvo = businessService.getBusiness(bvo);
		// 조회 후 코드값 분배
		vo.setCategory(bvo.getBusinessCode());
		// 조회 후 사업자 번호 분배
		vo.setBusinessNumber(bvo.getBusinessNumber());
		// 쿼리 결과 호출
		// 일별 합계
		List<Map<String, Object>> map = payAndDeliveryService.getColumnChart(vo);
		return map;
	}

	// 마이페이지-사업자-통계 데이터2(donut)
	@RequestMapping("/getDonutChart")
	@ResponseBody
	public List<Map<String, Object>> getDonutChart(PayAndDeliveryVO vo, BusinessVO bvo, MemberVO mvo,
			HttpSession session) {
		// session ID 조회
		String id = session.getAttribute("loginID").toString();
		// ID값 분배
		bvo.setBusinessId(id);
		// 관리자인 경우
		if (id.equals("admin")) {
			mvo.setMemberId(id);
			mvo = memberService.getMember(mvo);
			vo.setCategory("70");
			List<Map<String, Object>> map = payAndDeliveryService.getDonutChart(vo);
			return map;
		}
		// DB 데이터 조회
		bvo = businessService.getBusiness(bvo);
		// 조회 후 코드값 분배
		vo.setCategory(bvo.getBusinessCode());
		vo.setBusinessNumber(bvo.getBusinessNumber());
		// 쿼리 결과 호출
		// 일별 합계
		List<Map<String, Object>> map = payAndDeliveryService.getDonutChart(vo);
		return map;
	}

	// 마이페이지-사업자-통계 데이터3(areaChart)
	@RequestMapping("/getAreaChart")
	@ResponseBody
	public List<Map<String, Object>> getAreaChart(PayAndDeliveryVO vo, BusinessVO bvo, MemberVO mvo,
			HttpSession session) {
		// session ID 조회
		String id = session.getAttribute("loginID").toString();
		// ID값 분배
		bvo.setBusinessId(id);
		// 관리자인 경우
		if (id.equals("admin")) {
			mvo.setMemberId(id);
			mvo = memberService.getMember(mvo);
			vo.setCategory("70");
			List<Map<String, Object>> map = payAndDeliveryService.getAreaChart(vo);
			return map;
		}
		// DB 데이터 조회
		bvo = businessService.getBusiness(bvo);
		// 조회 후 코드값 분배
		vo.setCategory(bvo.getBusinessCode());
		vo.setBusinessNumber(bvo.getBusinessNumber());
		// 쿼리 결과 호출
		// 일별 합계
		List<Map<String, Object>> map = payAndDeliveryService.getAreaChart(vo);
		return map;
	}

	// 마이페이지-사업자-통계 데이터4(pieChart)
	@RequestMapping("/getAnimalChart") // 관리자만
	@ResponseBody
	public List<Map<String, Object>> getAnimalChart(PayAndDeliveryVO vo, AnimalVO avo, HttpSession session) {
		// session ID 조회
		String id = session.getAttribute("loginID").toString();
		// ID값 분배
		List<Map<String, Object>> map = animalService.getAnimalChart(avo);
		return map;
	}

	// 마이페이지-사업자-실시간화장진료 페이지
	@RequestMapping("/videoCall")
	public String videoCall(MemberVO mvo, BusinessVO bvo, Model model, HttpSession session) {
		// ID값 조회 및 등록
		String id = session.getAttribute("loginID").toString();
		mvo.setMemberId(id);
		bvo.setBusinessId(id);
		// 조회
		mvo = memberService.getMember(mvo);
		bvo = businessService.getBusiness(bvo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("bvo", bvo);
		return "video/videoCall";
	}

	// 공통
	// 세션 및 busCode 변환
	public String sessionSelect(HttpSession session, IntegratedVO vo) {
		// 1. id로 businessTable 조회
		String id = session.getAttribute("loginID").toString();
		BusinessVO bvo = new BusinessVO();
		bvo.setBusinessId(id);
		bvo = businessService.getBusiness(bvo);
		// 2. business의 사업자 번호 가져와 넣기
		vo.setBusinessNumber(bvo.getBusinessNumber());
		vo.setCode(bvo.getBusinessCode());
		// 3. 코드값 변환
		if (vo.getCode().equals("10"))
			vo.setCode("HOTEL");
		else if (vo.getCode().equals("20"))
			vo.setCode("HOSPITAL");
		else if (vo.getCode().equals("30"))
			vo.setCode("CAFE");
		else if (vo.getCode().equals("40"))
			vo.setCode("BEAUTY");
		else if (vo.getCode().equals("50"))
			vo.setCode("EDU");
		else if (vo.getCode().equals("60"))
			vo.setCode("TAXI");
		else if (vo.getCode().equals("70"))
			vo.setCode("SHOP");
		return vo.getCode();
	}// end of sessionSelect

	// seq를 code값으로 변환
	public void seqConversion(IntegratedVO vo) {
		if (vo.getCode().equals("10"))
			vo.setCode("HOTEL");
		else if (vo.getCode().equals("20"))
			vo.setCode("HOSPITAL");
		else if (vo.getCode().equals("30"))
			vo.setCode("CAFE");
		else if (vo.getCode().equals("40"))
			vo.setCode("BEAUTY");
		else if (vo.getCode().equals("50"))
			vo.setCode("EDU");
		else if (vo.getCode().equals("60"))
			vo.setCode("TAXI");
		else if (vo.getCode().equals("70"))
			vo.setCode("SHOP");
	}
}