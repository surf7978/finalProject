package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.company.animal.service.AnimalService;
import com.company.animal.service.AnimalVO;
import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;
import com.company.common.FileRenamePolicy;
import com.company.common.Paging;
import com.company.hospital.service.HospitalService;
import com.company.hospital.service.HospitalVO;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.note.service.NoteService;
import com.company.note.service.NoteVO;
import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;
import com.company.product.service.ProductService;
import com.company.product.service.ProductVO;
import com.company.question.service.QuestionService;
import com.company.question.service.QuestionVO;
import com.company.reservation.service.ReservationService;
import com.company.reservation.service.ReservationVO;
import com.company.review.service.ReviewService;
import com.company.review.service.ReviewVO;

@Controller
public class Controller2 {

	@Autowired
	MemberService memberService;
	@Autowired
	PayAndDeliveryService payAndDeliveryService;
	@Autowired
	BuyService buyService;
	@Autowired
	AnimalService animalService;
	@Autowired
	HospitalService hospitalService;
	@Autowired
	BusinessService businessService;
	@Autowired
	ReservationService reservationService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	QuestionService questionService;
	@Autowired
	NoteService noteService;
	@Autowired
	ProductService productService;
	

	////// 마이페이지-유저///////////
	// 일반회원 본인정보 조회
	// admin이 로그인해서 회원들의 정보를 볼려고 클릭하면 자신의 정보가 나와서 .equals("admin")추가해서 자기정보가 아닌 회원의 정보조회하게 함
	@GetMapping("/getMember1")
	public String getMember(MemberVO vo1, Model model, HttpSession session) {
		if (session.getAttribute("loginID").equals("admin")) {
			model.addAttribute("member", memberService.getMember(vo1));
		} else {
			vo1.setMemberId((String) session.getAttribute("loginID"));
			model.addAttribute("member", memberService.getMember(vo1));
		}
		return "user/memberInfo";
	}

	// 수정페이지로
	@GetMapping("/updateMember")
	public String updateMember(MemberVO vo1, Model model, HttpSession session) {
		if (session.getAttribute("loginID").equals("admin")) {
			model.addAttribute("member", memberService.getMember(vo1));
		} else {
			MemberVO vo = new MemberVO();
			vo.setMemberId((String) session.getAttribute("loginID"));
			model.addAttribute("member", memberService.getMember(vo1));
		}
		return "user/memberInfo";
	}

	// 회원수정
	@PostMapping("/updateMember")
	public String updateMemberProc(MemberVO vo, Model model) {
		memberService.updateMember(vo);
		model.addAttribute("member", memberService.getMember(vo));
		return "user/memberInfo";
	}

	// 회원탈퇴
	@GetMapping("/deleteMember")
	public String deleteMember(MemberVO vo, Model model, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		model.addAttribute("member", vo);
		memberService.deleteMember(vo);
		return "user/deleteMember";
	}
	
	////////////구매내역///////////////
	// 구매내역리스트조회
	@RequestMapping("/getSearchPayAndDeliveryForm")
	public String getSearchPayAndDeliveryForm(PayAndDeliveryVO vo, Model model, HttpSession session, Paging paging) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		paging.setPageUnit(5); //한페이지에 출력되는 레코드 건수
		paging.setPageSize(3); //페이지번호가 3개씩 보임
		//페이징
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		//전체페이지가 넘어가야 last를 구함
		paging.setTotalRecord(payAndDeliveryService.getCount(vo));
		model.addAttribute("paging", paging);
		model.addAttribute("pads", payAndDeliveryService.getSearchPayAndDelivery(vo));
		model.addAttribute("memberId", vo);
	return "user/getSearchPayAndDeliveryForm";
	}


	// 구매내역 상세리스트 조회
	@RequestMapping("/getSearchBuy")
	public String getSearchBuy(BuyVO vo, Model model) {
		model.addAttribute("buys", buyService.getSearchBuy(vo));
		return "user/getSearchBuy";
	}

	////////// 예약하기//////////////////
	// 예약하기 날짜 페이지 호출
	@GetMapping("/updateReservation")
	public String updateReservation(ReservationVO vo, Model model, String pndNumber) {
		vo.setPndNumber(pndNumber);
		model.addAttribute("reservation", reservationService.getReservation(vo));
		return "empty/reservation/updateReservation";
	}

	// 예약하기 날짜 시간 등록 ReservationVO&PayAndDeliveryVO update
	@PostMapping("/updateReservation")
	public void updateReservationProc(ReservationVO vo, PayAndDeliveryVO vo1, HttpServletResponse response, Model model)
			throws IOException {
		reservationService.updateReservation(vo);
		payAndDeliveryService.updateReservation2(vo1);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('예약되었습니다');opener.opener.location.reload();opener.location.reload();window.close();</script>");
		writer.close();
	}

	// 회원의 예약리스트조회
	@RequestMapping("/getSearchReservation")
	public String getSearchReservation(ReservationVO vo, Model model, HttpSession session, Paging paging) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		paging.setPageUnit(5); //한페이지에 출력되는 레코드 건수
		paging.setPageSize(3); //페이지번호가 3개씩 보임
		//페이징
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		//전체페이지가 넘어가야 last를 구함
		paging.setTotalRecord(reservationService.getCount(vo));
		model.addAttribute("paging", paging);
		model.addAttribute("reservation", reservationService.getSearchReservation(vo));
		return "reservation/getSearchReservation";
	}

	// 캘린더조회 for 회원
	@RequestMapping("/getSearchReservationCalendar")
	@ResponseBody
	public List<Map<String, String>> getSearchReservationCalendar(ReservationVO vo, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		List<Map<String, String>> list = reservationService.getSearchReservationCalendar(vo);
		return list;
	}

	// 예약내역 상세리스트 조회
	@RequestMapping("/getReservation")
	public String getReservation(ReservationVO vo, Model model, String pndNumber) {
		vo.setPndNumber(pndNumber);
		model.addAttribute("reservation", reservationService.getReservation(vo));
		return "empty/reservation/getReservation";
	}

	// 사업자별 예약리스트조회
	@RequestMapping("/getViewReservation2")
	public String getViewReservation2(ReservationVO vo, BusinessVO bvo, Model model, HttpSession session) {
		bvo.setBusinessId((String) session.getAttribute("loginID"));
		model.addAttribute("business", businessService.getBusiness(bvo));

		vo.setBusinessNumber(businessService.getBusiness(bvo).getBusinessNumber());
		model.addAttribute("reservation", reservationService.getViewReservation2(vo));
		return "reservation/getViewReservation2";
	}

	// 캘린더조회 for 사업자
	@RequestMapping("/getSearchReservationCalendar2")
	@ResponseBody
	public List<Map<String, String>> getSearchReservationCalendar2(ReservationVO vo, BusinessVO bvo,
			HttpSession session) {
		bvo.setBusinessId((String) session.getAttribute("loginID"));
		vo.setBusinessNumber(businessService.getBusiness(bvo).getBusinessNumber());
		List<Map<String, String>> list = reservationService.getSearchReservationCalendar2(vo);
		return list;
	}

	// 구매내역 삭제
	@DeleteMapping("/deleteBuy")
	public String deleteBuy(BuyVO vo) {
		buyService.deleteBuy(vo);
		return "user/getSearchBuy";
	}

	/////////// 마이펫 수첩/////////////
	// 반려동물 리스트 조회
	@RequestMapping("/getSearchAnimal")
	public String getSearchAnimal(AnimalVO vo, Model model, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		model.addAttribute("animal", animalService.getSearchAnimal(vo));
		return "animal/getSearchAnimal";
	}

	// 단건 조회(의료수첩)
	@RequestMapping("/getAnimal")
	public String getAnimal(AnimalVO vo, Model model) {
		model.addAttribute("animal", animalService.getAnimal(vo));
		return "animal/getAnimal";
	}

	// 반려동물 등록 페이지
	@GetMapping("/insertAnimal")
	public String insertAnimal() {
		return "animal/insertAnimal";
	}

	// 반려동물 등록
	@PostMapping("/insertAnimal")
	public String insertAnimalProc(AnimalVO vo, HttpSession session, HttpServletRequest request)
			throws IllegalStateException, IOException {
		vo.setMemberId((String) session.getAttribute("loginID"));
		// 첨부파일처리
		MultipartFile image = vo.getUploadFile();
		String path = request.getSession().getServletContext().getRealPath("resources/images/animal/");
		System.out.println("경로: " + path);
		if (image != null && !image.isEmpty() && image.getSize() > 0) {
			String filename = image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함
			vo.setImage(rename.getName());
		}
		animalService.insertAnimal(vo);
		return "redirect:/getSearchAnimal";
	}

	// 반려동물 수정페이지
	@GetMapping("/updateAnimal")
	public String updateAnimal(AnimalVO vo, Model model) {
		vo = animalService.getAnimal(vo);
		model.addAttribute("animal", vo);
		return "animal/updateAnimal";
	}

	// 반려동물 수정
	@PostMapping("/updateAnimal")
	public String updateAnimalProc(AnimalVO vo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		// 첨부파일처리
		MultipartFile image = vo.getUploadFile();
		String path = request.getSession().getServletContext().getRealPath("resources/images/animal/");
		System.out.println("경로: " + path);
		if (image != null && !image.isEmpty() && image.getSize() > 0) {
			String filename = image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함
			vo.setImage(rename.getName());
		}
		animalService.updateAnimal(vo);
		model.addAttribute("animal", vo);
		return "redirect:/getSearchAnimal?memberId=" + vo.getMemberId();
	}

	// 반려동물 삭제
	@RequestMapping("/deleteAnimal")
	public String deleteAnimal(AnimalVO avo, NoteVO nvo) {
		animalService.deleteAnimal(avo);
		noteService.deleteAnimalNote(nvo);
		return "redirect:/getSearchAnimal";
	}

	///// 의료수첩 페이지////////////
	@RequestMapping("/getSearchNote")
	public String getSearchNote(AnimalVO avo, NoteVO nvo, Model model) {
		model.addAttribute("animal", animalService.getAnimal(avo));
		model.addAttribute("note", noteService.getSearchNote(nvo));
		model.addAttribute("noteCount", noteService.getNoteCount(nvo));
		return "note/getSearchNote";
	}

	// 의료내역 등록 페이지
	@GetMapping("/insertNote")
	public String insertNote(NoteVO vo, String animalNumber, Model model) {
		vo.setAnimalNumber(animalNumber);
		model.addAttribute("animalNumber", vo.getAnimalNumber());
		return "empty/note/insertNote";
	}

	// 의료내역 등록 처리
	@PostMapping("/insertNote")
	public void insertNoteProc(NoteVO vo, HttpServletResponse response) throws IOException {
		noteService.insertNote(vo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('등록되었습니다');opener.location.reload();window.close();</script>");
		writer.close();
	}

	// 의료내역 수정페이지
	@GetMapping("/updateNote")
	public String updateNote(NoteVO vo, Model model) {
		model.addAttribute("note", noteService.getNote(vo));
		return "empty/note/updateNote";
	}

	// 의료내역 수정처리
	@PostMapping("/updateNote")
	public void updateNoteProc(NoteVO vo, HttpServletResponse response) throws IOException {
		noteService.updateNote(vo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('수정되었습니다');opener.location.reload();window.close();</script>");
		writer.close();
	}

	// 의료내역 삭제
	@RequestMapping("/deleteNote")
	public String deleteNote(NoteVO vo) {
		noteService.deleteNote(vo);
		return "redirect:/getSearchNote";
	}

	//////// 병원상품//////////
	// 병원상품 전체리스트 조회
	@RequestMapping("/getSearchHospital")
	public String getSearchHospital(HospitalVO vo, Model model) {
		model.addAttribute("hospital", hospitalService.getSearchHospital(vo));
		return "hospital/getSearchHospital";
	}

	// 병원 상세조회 + 구매평 전체리스트 출력 + 문의내역 전체리스트 출력
	@RequestMapping("/getHospital")
	public String getHospital(HospitalVO vo, Model model, String seq, HttpSession session) {
		vo.setSeq(seq);
		model.addAttribute("hospital", hospitalService.getHospital(vo));
		if (session.getAttribute("loginID") != null) {
			ReservationVO vo1 = new ReservationVO();
			vo1.setMemberId((String) session.getAttribute("loginID"));
			vo1.setBisNumber(seq);
			model.addAttribute("reservation", reservationService.getViewReservation(vo1));
		}
		ReviewVO vo2 = new ReviewVO();
		vo2.setProbisNumber(seq);
		model.addAttribute("review", reviewService.getSearchReview(vo2));

		QuestionVO vo3 = new QuestionVO();
		vo3.setProbisNumber(seq);
		model.addAttribute("question", questionService.getSearchQuestionProbis(vo3));
		return "hospital/getHospital";
	}

	// 병원상품 등록 페이지
	@GetMapping("/insertHospital")
	public String insertHospitalForm(BusinessVO vo, Model model, HttpSession session) {
		vo.setBusinessId((String) session.getAttribute("loginID"));
		model.addAttribute("business", businessService.getBusiness(vo));
		return "hospital/insertHospital";
	}

	// 병원상품 등록 처리
	@PostMapping("/insertHospital")
	public String insertHospital(HospitalVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		// 첨부파일처리
		MultipartFile image = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String path = request.getSession().getServletContext().getRealPath("resources/images/hospital/");
		System.out.println("경로: " + path);
		if (image != null && !image.isEmpty() && image.getSize() > 0) {
			String filename = image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			// rename.getName()
			// 파일명을 읽어내는게 getName()
			// 임시폴더에서 업로드 폴더로 파일이동
			image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setImage(rename.getName());
		}

		if (t_image != null && !t_image.isEmpty() && t_image.getSize() > 0) {
			String filename = t_image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			t_image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setT_image(rename.getName());
		}
		hospitalService.insertHospital(vo);
		return "redirect:/getSearchHospitalForm99";
	}

	// 상세조회에서 사업자 구매평 등록페이지 이동
	@GetMapping("/insertReview")
	public String insertReview(ReservationVO vo, Model model, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		model.addAttribute("reservation", reservationService.getViewReservation(vo));
		return "empty/reviewAndQuestion/insertReview";
	}

	// 상세조회에서 구매평 등록처리
	@PostMapping("/insertReview")
	public void insertReview(ReviewVO vo, ReservationVO rvo, HttpServletResponse response) throws IOException {
		reviewService.insertReview(vo);
		reservationService.insertReview2(rvo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('등록되었습니다');opener.location.reload();window.close();</script>");
		writer.close();
	}
	// 상세조회에서 상품문의 등록페이지 이동
	@GetMapping("/insertQuestionBusi")
	public String insertQuestionBusi(HospitalVO vo, MemberVO vo1, String seq, String businessNumber, Model model,
			HttpSession session) {
		// 상품번호 담기
		vo.setSeq(seq);
		model.addAttribute("hospital", hospitalService.getHospital(vo));

		// 작성자 이름 담기
		vo1.setMemberId((String) session.getAttribute("loginID"));
		model.addAttribute("member", memberService.getMember(vo1));

		// 사업자 아이디 담기
		BusinessVO vo2 = new BusinessVO();
		vo2.setBusinessNumber(businessNumber);
		model.addAttribute("business", businessService.getBusinessId(vo2));
		return "empty/reviewAndQuestion/insertQuestion";
	}

	// 상세조회에서 상품문의 등록처리
	@PostMapping("/insertQuestionBusi")
	public void insertQuestionBusi(QuestionVO vo, HttpServletResponse response) throws IOException {
		questionService.insertQuestionBusi(vo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('등록되었습니다');opener.location.reload();window.close();</script>");
		writer.close();
	}

	// 상품문의 단건리스트 출력(ajax로 같은 페이지 출력)
	@RequestMapping("/getQuestionProbis")
	@ResponseBody
	public QuestionVO getQuestionProbis(QuestionVO vo) {
		return questionService.getQuestionProbis(vo);
	}

	///////쇼핑몰//////////////
	// 쇼핑몰 상세보기 + 구매평 출력 + 문의내역 출력
	@RequestMapping("/getProduct")
	public String getProduct(ProductVO vo, Model model, String productNumber, HttpSession session) {
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+productNumber);
		System.out.println("101010101010"+productNumber);
		vo.setProductNumber(productNumber);
		model.addAttribute("product", productService.getProduct(vo));
		if (session.getAttribute("loginID") != null) {
			BuyVO vo1 = new BuyVO();
			vo1.setFromPerson((String) session.getAttribute("loginID"));
			vo1.setProductNumber(productNumber);
			model.addAttribute("buy", buyService.getBuy(vo1));	
		}
		ReviewVO vo2 = new ReviewVO();
		vo2.setProbisNumber(productNumber);
		model.addAttribute("review", reviewService.getSearchReview(vo2));
		
		QuestionVO vo3 = new QuestionVO();
		vo3.setProbisNumber(productNumber);
		model.addAttribute("question", questionService.getSearchQuestionProbis(vo3));
		return "product/getProduct2";
	}
	
	// 쇼핑몰 상세조회에서 상품문의 등록페이지 이동
	@GetMapping("/insertQuestionBusi2")
	public String insertQuestionBusi2(ProductVO vo, MemberVO vo1, String productNumber, Model model, HttpSession session) {
	// 상품번호 담기
	vo.setProductNumber(productNumber);
	model.addAttribute("product", productService.getProduct(vo));

	// 작성자 이름 담기
	vo1.setMemberId((String) session.getAttribute("loginID"));
	model.addAttribute("member", memberService.getMember(vo1));

	return "empty/reviewAndQuestion/insertQuestion3";
	}
	
	//쇼핑몰 상세조회에서  상품문의 등록처리
	@PostMapping("/insertQuestionBusi2")
	public void insertQuestionBusi2(QuestionVO vo, HttpServletResponse response) throws IOException {
		questionService.insertQuestionPro(vo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('등록되었습니다');opener.location.reload();window.close();</script>");
		writer.close();
	}
	 //상세조회에서 쇼핑몰 구매평 등록페이지 이동
	 @GetMapping("/insertReviewProduct") 
	 public String insertReviewProduct(BuyVO vo, Model model, MemberVO mvo, HttpSession session) { 
		String loginID = (String) session.getAttribute("loginID");
		vo.setFromPerson(loginID);
		mvo.setMemberId(loginID);
		model.addAttribute("buy", buyService.getBuy(vo));
		model.addAttribute("name", memberService.getMember(mvo).getName());
		return "empty/reviewAndQuestion/insertReviewProduct";
	 }
	 
	 //상세조회에서 쇼핑몰 구매평 등록처리
	 @PostMapping("/insertReviewProduct")
	 public void insertReviewProduct(ReviewVO rvo, BuyVO bvo, HttpServletResponse response) throws IOException {
		reviewService.insertReview(rvo);
		buyService.insertReview3(bvo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('등록되었습니다');opener.location.reload();window.close();</script>");
		writer.close();
	 }
	 
	//관리자 택배 배송
	// 관리자의 배송정보 입력페이지 출력
	@RequestMapping("/updateDelivery")
	public String updateDelivery(PayAndDeliveryVO vo, String pndNumber, Model model) {
		vo.setPndNumber(pndNumber);
		model.addAttribute("pndNumber", vo.getPndNumber());
		return "user/updateDelivery";
	}

	// 관리자의 배송정보 입력 처리
	@PostMapping("/updateDelivery")
	public void updateDelivery(PayAndDeliveryVO vo, HttpServletResponse response) throws IOException {
		payAndDeliveryService.updateDelivery(vo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('등록되었습니다');opener.location.reload();window.close();</script>");
		writer.close();
	}	

}
