package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.company.animal.service.AnimalService;
import com.company.animal.service.AnimalVO;
import com.company.answer.service.AnswerService;
import com.company.answer.service.AnswerVO;
import com.company.board.service.BoardService;
import com.company.board.service.BoardVO;
import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;
import com.company.cafe.service.CafeService;
import com.company.cafe.service.CafeVO;
import com.company.comment.service.CommentService;
import com.company.comment.service.CommentVO;
import com.company.comment.service.CommentVO;
import com.company.common.FileRenamePolicy;
import com.company.common.Paging;
import com.company.hospital.service.HospitalSearchVO;
import com.company.hospital.service.HospitalService;
import com.company.hospital.service.HospitalVO;
import com.company.integrated.service.IntegratedService;
import com.company.integrated.service.IntegratedVO;
import com.company.member.common.KakaoAPI;
import com.company.member.common.coolsmsAPI;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.member.service.impl.MemberServiceimpl;
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
public class Controller1 {
 
	@Autowired
	MemberService memberService;
	@Autowired
	BusinessService businessService;
	@Autowired
	KakaoAPI kakaoAPI;

	// 로그인화면 이동
	@GetMapping("/loginForm")
	public String loginForm() {
		return "member/login";
	}

	// 일반사용자 로그인 처리
	@PostMapping("/login")
	public String loginProc(MemberVO vo, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (memberService.getViewMember(vo) != null) {
			MemberServiceimpl memberServiceimpl = new MemberServiceimpl();
			String insertPW = vo.getPassword(); // 로그인화면에 입력한 비밀번호
			String DBinPW = memberService.getViewMember(vo).getPassword(); // DB안에 암호화된 비밀번호
			if (memberServiceimpl.matches(insertPW, DBinPW)) { // 입력한 비밀번호와 DB의 비밀번호 일치체크
				session.setAttribute("loginID", memberService.getViewMember(vo).getMemberId()); // 세션에 로그인한 아이디 담아줌
				session.setAttribute("loginAuth", memberService.getViewMember(vo).getAuth()); // 권한 확인
				return "redirect:/";
			} else {
				writer.println("<script>alert('로그인 실패 : 비밀번호 불일치');");
				writer.println("location.href='loginForm'");
				writer.println("</script>");
				writer.close();
				return "redirect:/loginForm";
			}
		} else {
			writer.println("<script>alert('로그인 실패 : 아이디가 없습니다.');");
			writer.println("location.href='loginForm'");
			writer.println("</script>");
			writer.close();
			return "redirect:/loginForm";
		}
	}

	// 로그아웃처리
	@RequestMapping("/logout")
	public String logoutProc(HttpSession session) {
		String access_token = (String) session.getAttribute("access_token");
		kakaoAPI.kakaoLogout(access_token);
		session.invalidate();
		return "redirect:/";
	}

	// 회원가입 선택 화면myPageSideBar
	@RequestMapping("/signUpSelect")
	public String signUpSelect() {
		return "member/signUpSelect";
	}

	// 일반사용자 회원가입화면
	@GetMapping("/signUpUser")
	public String signUpUser() {
		return "member/signUpUser";
	}

	// 일반사용자 회원가입 처리
	@PostMapping("/signUpUser")
	public String signUpUserProc(MemberVO vo) {
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		String pw = bcrypt.encode(vo.getPassword());
		vo.setPassword(pw);
		memberService.insertMember(vo);
		return "redirect:/loginForm";
	}

	// 사업자 회원가입화면
	@GetMapping("/signUpBusiness")
	public String signUpBusiness() {
		return "member/signUpBusiness";
	}

	// 사업자 회원가입 처리
	@PostMapping("/signUpBusiness")
	public String signUpBusinessProc(BusinessVO vo) {
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		String pw = bcrypt.encode(vo.getPassword());
		vo.setPassword(pw);
		businessService.insertBusiness(vo);
		return "redirect:/loginForm";
	}

	// 카카오로그인
	@RequestMapping("/callback")
	public String callback(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println("code값 : " + map.get("code"));
		String code = (String) map.get("code");
		String access_token = kakaoAPI.getAccessToken(code);
		System.out.println("access_token : " + access_token);
		Map<String, Object> userInfo = kakaoAPI.getUserInfo(access_token);
		System.out.println("userInfo : " + userInfo);
		// token을 session저장(DB 저장)
		session.setAttribute("access_token", access_token);
		session.setAttribute("loginID", userInfo.get("nickname"));
		session.setAttribute("loginAuth", "m");
		System.out.println(session.getAttribute("loginID") + " " + session.getAttribute("loginAuth"));
		// 카톡로그인 DB에 저장하기
		MemberVO vo = new MemberVO();
		vo.setMemberId((String) userInfo.get("nickname"));
		if (memberService.getViewMember(vo) != null) { // DB체크했을때 값이없으면 DB에 추가, 있으면 비교 후 DB추가 다 있으면 로그인
			if (memberService.getViewMember(vo).getMemberId().equals((String) userInfo.get("nickname"))) {
				return "redirect:/";
			} else {
				vo.setPassword("");
				vo.setEmail("");
				vo.setName((String) userInfo.get("nickname"));
				vo.setPost("");
				vo.setAddress("");
				vo.setAddress2("");
				vo.setPhone("010-0000-0000");
				memberService.insertMember(vo);
				return "redirect:/";
			}
		} else {
			vo.setPassword("");
			vo.setEmail("");
			vo.setName((String) userInfo.get("nickname"));
			vo.setPost("");
			vo.setAddress("");
			vo.setAddress2("");
			vo.setPhone("010-0000-0000");
			memberService.insertMember(vo);
			return "redirect:/";
		}
	}

	// 아이디 중복체크 기능
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(MemberVO vo) {
		int result = memberService.idCheck(vo);
		return result;
	}

	// 아이디/비밀번호찾기 이동
	@GetMapping("/searchID&PW")
	public String searchIDnPW() {
		return "member/searchID&PW";
	}

	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/searchID", method = RequestMethod.POST, produces = "application/html; charset=utf-8")
	public String searchID(MemberVO vo) {
		String result = null;
		if (memberService.searchID(vo) != null) {
			result = vo.getName() + "님의 아이디는 " + memberService.searchID(vo) + " 입니다.";
		} else {
			result = "이름과 연락처가 일치하지 않습니다.";
		}
		return result;
	}

	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/searchPW", method = RequestMethod.POST, produces = "application/html; charset=utf-8")
	public String searchPW(MemberVO vo) {
		String result = null;
		if (memberService.getMember(vo) != null) {
			if (vo.getPhone().equals(memberService.getMember(vo).getPhone())) {
				result = "본인인증완료";
			} else {
				result = "아이디와 연락처가 일치하지 않습니다.";
			}
		} else {
			result = "아이디와 연락처가 일치하지 않습니다.";
		}
		return result;
	}

	// 비밀번호 변경
	@RequestMapping("/changePW")
	public String changePW(MemberVO vo) {
		if (memberService.getViewMember(vo).getAuth().equals("m")) {
			BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
			String pw = bcrypt.encode(vo.getPassword());
			vo.setPassword(pw);
			memberService.updateMember(vo);
		} else {
			BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
			String pw = bcrypt.encode(vo.getPassword());
			BusinessVO vo1 = new BusinessVO();
			vo1.setPassword(pw);
			vo1.setBusinessId(vo.getMemberId());
			businessService.updateBusiness(vo1);
		}
		return "redirect:/logout";
	}

	// 휴대폰인증 페이지 이동-회원가입
	@GetMapping("/coolsms")
	public String coolsms() {
		return "empty/member/coolsms";
	}

	// 휴대폰인증 페이지 이동-ID찾기
	@GetMapping("/coolsms1")
	public String coolsms1() {
		return "empty/member/coolsms1";
	}

	// 휴대폰인증 페이지 이동-비밀번호변경
	@GetMapping("/coolsms2")
	public String coolsms2() {
		return "empty/member/coolsms2";
	}

	@Autowired
	coolsmsAPI certificationService;

	// 휴대폰인증-문자전송
	@GetMapping("/sendSMS")
	public @ResponseBody String sendSMS(String phoneNumber) {

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		System.out.println("수신자 번호 : " + phoneNumber);
		System.out.println("인증번호 : " + numStr);
		// 이게 문자보내는 기능 돈들어가니까 일단 주석처리 함
		// certificationService.certifiedPhoneNumber(phoneNumber,numStr);
		return numStr;
	}

	// 사업자번호 조회
	@PostMapping(value = "/bizno", produces = "application/html; charset=utf-8")
	@ResponseBody
	public String bizno(@RequestParam String businessNumber) throws IOException {
		// 사업자번호 입력
		String url = "https://bizno.net/?query=" + businessNumber;
		Document doc = Jsoup.connect(url).get();
		Elements element = doc.select("div.titles a h4");
		String bizName = element.text();
		System.out.println(bizName);
		return bizName;
	}

	@Autowired
	ReviewService reviewService;

	// 구매평 전체리스트 출력
	@GetMapping("/getSearchReview99")
	public String getSearchReview99(ReviewVO vo, Model model) {
		model.addAttribute("review", reviewService.getSearchReview(vo));
		return "member/getSearchReview99";
	}

	// 구매평 단건리스트 출력(ajax로 같은 페이지 출력)
	@RequestMapping("/getReview99")
	@ResponseBody
	public ReviewVO getReview99(ReviewVO vo) {
		return reviewService.getReview(vo);
	}

	@Autowired
	AnimalService animalService;

	// 관리자용 회원탈퇴
	@GetMapping("/deleteMember99")
	public String deleteMember99(String ID) {
		MemberVO vo = new MemberVO();
		vo.setMemberId(ID);
		if (memberService.getViewMember(vo).getAuth().equals("m")) {
			AnimalVO voAnimal = new AnimalVO();
			voAnimal.setMemberId(ID);
			if (animalService.getSearchAnimal(voAnimal) != null) {
				animalService.deleteAnimal99(voAnimal);
			}
			memberService.deleteMember(vo);
		} else {
			BusinessVO vo1 = new BusinessVO();
			vo1.setBusinessId(ID);
			businessService.deleteBusiness(vo1);
		}
		return "redirect:/getSearchViewMember";
	}

	// 회원용 회원탈퇴
	@GetMapping("/membershipCancel")
	public String membershipCancel(String ID, HttpSession session) {
		MemberVO vo = new MemberVO();
		vo.setMemberId(ID);
		if (memberService.getViewMember(vo).getAuth().equals("m")) {
			AnimalVO voAnimal = new AnimalVO();
			voAnimal.setMemberId(ID);
			if (animalService.getSearchAnimal(voAnimal) != null) {
				animalService.deleteAnimal99(voAnimal);
			}
			memberService.deleteMember(vo);
			session.invalidate();
		} else {
			BusinessVO vo1 = new BusinessVO();
			vo1.setBusinessId(ID);
			businessService.deleteBusiness(vo1);
			session.invalidate();
		}
		return "redirect:/";
	}

	// 관리자-전체회원 조회
	@RequestMapping("/getSearchViewMember")
	public String getSearchMember(MemberVO vo, Model model) {
		model.addAttribute("list", memberService.getSearchViewMember(vo));
		return "member/getSearchMember";
	}

	// 사업자-개인정보 조회
	@GetMapping("/getBusiness99")
	public String getBusiness99(HttpSession session, Model model) {
		BusinessVO vo1 = new BusinessVO();
		vo1.setBusinessId((String) session.getAttribute("loginID"));
		if (session.getAttribute("loginID").equals("admin")) {
			model.addAttribute("business", businessService.getBusiness(vo1));
		} else {
			BusinessVO vo = new BusinessVO();
			vo.setBusinessId((String) session.getAttribute("loginID"));
			model.addAttribute("business", businessService.getBusiness(vo));
		}
		return "business/getBusiness99";
	}

	// 사업자-개인정보 조회
	@GetMapping("/getBusiness98")
	public String getBusiness98(HttpSession session, Model model, BusinessVO vo1) {
		if (session.getAttribute("loginID").equals("admin")) {
			model.addAttribute("business", businessService.getBusiness(vo1));
		} else {
			BusinessVO vo = new BusinessVO();
			vo.setBusinessId((String) session.getAttribute("loginID"));
			model.addAttribute("business", businessService.getBusiness(vo));
		}
		return "business/getBusiness99";
	}

	@PostMapping("/updateBusiness99")
	public String updateBusiness99(BusinessVO vo) {
		businessService.updateBusiness(vo);
		return "redirect:/getBusiness99?businessId=" + vo.getBusinessId();
	}

	@RequestMapping("/getSearchAnimal99")
	public String getSearchAnimal(AnimalVO vo, Model model) {
		model.addAttribute("animal", animalService.getSearchAnimal99(vo));
		return "animal/getSearchAnimal99";
	}

	@Autowired
	HospitalService hospitalService;
	// 병원상품 사업자별 조회(수정페이지로 가기 위한)

	// 병원상품 수정 페이지
	@GetMapping("/updateHospital")
	public String updateHospitalForm(HospitalVO vo, Model model, HttpSession session) {
		System.out.println(vo);
		BusinessVO vo1 = new BusinessVO();
		vo1.setBusinessId((String) session.getAttribute("loginID"));
		model.addAttribute("business", businessService.getBusiness(vo1));
		model.addAttribute("hospital", hospitalService.getHospital(vo));
		return "hospital/updateHospital";
	}

	// 병원상품 수정 처리
	@PostMapping("/updateHospital")
	public String updateHospital(HospitalVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
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
			// 업로드된 파일명
			// rename.getName()
			// 파일명을 읽어내는게 getName()
			// 임시폴더에서 업로드 폴더로 파일이동
			t_image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setT_image(rename.getName());
		}
		hospitalService.updateHospital(vo);
		return "redirect:/getSearchHospitalForm99";
	}

	// 병원상품 삭제
	@GetMapping("/deleteHospital")
	public String deleteHospital(HospitalVO vo) {
		hospitalService.deleteHospital(vo);
		return "redirect:/getSearchHospitalForm99";
	}

	// 마이페이지 사이드바 출력(jsp:include해서 이제 이건 사용안함)
	@GetMapping("/myPageSideBar")
	public String myPageSideBar() {
		return "user/myPageSideBar1";
	}

	// 마이페이지-일반사용자-내가쓴글 출력 컨트롤러 4로 옮김
	@Autowired
	BoardService boardService;



	// 마이페이지-일반사용자-후기내역 출력
	@GetMapping("/getSearchReview98")
	public String getSearchReview98(MemberVO vo, Model model) {
		ReviewVO vo1 = new ReviewVO();
		vo1.setMemberId(vo.getMemberId());
		model.addAttribute("review", reviewService.getSearchReview99(vo1));
		return "myPage/getSearchReview98";
	}

	// 마이페이지-일반사용자-후기내역 상세 출력
	@GetMapping("/getReview")
	public String getReview99(ReviewVO vo, Model model) {
		model.addAttribute("review", reviewService.getReview(vo));
		return "myPage/getReview99";
	}

	@Autowired
	QuestionService questionService; // 마이페이지-일반사용자-문의내역 출력

//	 @GetMapping("/getSearchQuestion99") 
//	 public String getSearchQuestion99(MemberVO vo, Model model)  { 
//	 QuestionVO vo1 =new QuestionVO(); 
//	 vo1.setMemberId(vo.getMemberId());
//	 model.addAttribute("question", questionService.getSearchQuestion99(vo1));
//	  return "myPage/getSearchQuestion99"; 
//	  }

	// 로그인화면 이동
	@GetMapping("/buyCancel")
	public String buyCancel() {
		return "pay/buyCancel";
	}

	@Autowired
	PayAndDeliveryService payAndDeliveryService;

	// 관리자용 구매현황 리스트조회
	@RequestMapping("/getSearchPayAndDelivery99")
	public String getSearchPayAndDelivery99(PayAndDeliveryVO vo, Model model, Paging paging) {
		paging.setPageUnit(20); //한페이지에 출력되는 레코드 건수
		paging.setPageSize(5); //페이지번호가 3개씩 보임
		//페이징
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		//전체페이지가 넘어가야 last를 구함
		paging.setTotalRecord(payAndDeliveryService.getCount99(vo));
		model.addAttribute("paging", paging);
		model.addAttribute("pads", payAndDeliveryService.getSearchPayAndDelivery99(vo));
		return "user/getSearchPayAndDelivery99";
	}

	@Autowired
	BuyService buyService;

	// 구매내역 상세리스트 조회
	@RequestMapping("/getSearchBuy99")
	public String getSearchBuy(BuyVO vo, Model model) {
		model.addAttribute("buys", buyService.getSearchBuy(vo));
		return "empty/user/getSearchBuy99";
	}

	// 관리자용 예약현황 리스트조회
	@RequestMapping("/getSearchPayAndDelivery98")
	public String getSearchPayAndDelivery98(PayAndDeliveryVO vo, Model model, Paging paging) {
		paging.setPageUnit(100); //한페이지에 출력되는 레코드 건수
		paging.setPageSize(5); //페이지번호가 3개씩 보임
		//페이징
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		//전체페이지가 넘어가야 last를 구함
		paging.setTotalRecord(payAndDeliveryService.getCount99(vo));
		model.addAttribute("paging", paging);
		model.addAttribute("pads", payAndDeliveryService.getSearchPayAndDelivery99(vo));
		return "user/getSearchPayAndDelivery98";
	}

	// 병원 리스트로 가기
	@RequestMapping("/getSearchHospitalForm99")
	public String getSearchHospitalForm99() {
		return "hospital/getSearchHospital99";
	}

	// 병원리스트(ajax)
	@RequestMapping("/getSearchHospital99")
	@ResponseBody
	public Map<String, Object> getSearchHospital99(HospitalSearchVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 1. 페이지 설정
		paging.setPageUnit(6); // 한페이지에 출력되는 레코드 건수
		paging.setPageSize(10); // 보이는 페이지 번호
		// 2.초기페이지 설정
		if (paging.getPage() == null)
			paging.setPage(1);
		// 3. 값 추가
		paging.setTotalRecord(hospitalService.getCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		List<HospitalVO> list = hospitalService.getSearchHospital99(vo);
		map.put("paging", paging);
		map.put("list", list);
		//
		return map;
	}

	// 병원리스트(ajax)+지역별 검색
	@RequestMapping("/getSearchHospitalLocation")
	@ResponseBody
	public Map<String, Object> getSearchHospitalLocation(HospitalSearchVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 1. 페이지 설정
		paging.setPageUnit(6); // 한페이지에 출력되는 레코드 건수
		paging.setPageSize(10); // 보이는 페이지 번호
		// 2.초기페이지 설정
		if (paging.getPage() == null)
			paging.setPage(1);
		// 3. 값 추가
		paging.setTotalRecord(hospitalService.getCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		List<HospitalVO> list = hospitalService.getSearchHospitalLocation(vo);
		map.put("paging", paging);
		map.put("list", list);
		//
		return map;
	}

	// 마이페이지-후기내역-구매평수정
	@PostMapping("/updateReview")
	public String updateReview(ReviewVO vo, Model model) {
		reviewService.updateReview(vo);
		model.addAttribute("review", reviewService.getReview(vo));
		return "myPage/getReview99";
	}

	// 마이페이지-후기내역-구매평삭제
	@RequestMapping("/deleteReview")
	public String deleteReview(ReviewVO vo, Model model) {
		reviewService.deleteReview(vo);
		ReviewVO vo1 = new ReviewVO();
		vo1.setMemberId(vo.getMemberId());
		model.addAttribute("review", reviewService.getSearchReview99(vo1));
		return "myPage/getSearchReview98";
	}

	@Autowired
	CafeService cafeService;

	// 마이페이지 - 관리자 - 판매글현황
	@GetMapping("/adminView")
	public String adminView(CafeVO vo, Model model) {
		model.addAttribute("adminView", cafeService.adminView(vo));
		return "admin/adminView";
	}

	@Autowired
	IntegratedService integratedService;

	// 마이페이지 - 관리자 - 판매글현황 - 단건삭제
	@RequestMapping("/deleteAdminView")
	public String deleteAdminView(CafeVO vo, Model model) {
		IntegratedVO vo1 = new IntegratedVO();
		vo1.setCode(vo.getCode());
		vo1.setSeq(vo.getSeq());
		integratedService.deleteIntegrated(vo1);
		model.addAttribute("adminView", cafeService.adminView(vo));
		return "admin/adminView";
	}

	@Autowired
	ReservationService reservationService;

	// 마이페이지 - 관리자 - 판매글현황 - 단건조회
	@GetMapping("/getAdminView")
	public String getAdminView(CafeVO vo, Model model, HttpSession session) {
		String seq = vo.getSeq();
		HospitalVO vo1 = new HospitalVO();
		vo1.setSeq(seq);
		model.addAttribute("hospital", hospitalService.getHospital(vo1));
		if (session.getAttribute("loginID") != null) {
			ReservationVO vo2 = new ReservationVO();
			vo2.setMemberId((String) session.getAttribute("loginID"));
			vo2.setBisNumber(seq);
			model.addAttribute("reservation", reservationService.getViewReservation(vo2));
		}
		ReviewVO vo2 = new ReviewVO();
		vo2.setProbisNumber(seq);
		model.addAttribute("review", reviewService.getSearchReview(vo2));
		QuestionVO vo3 = new QuestionVO();
		vo3.setProbisNumber(seq);
		model.addAttribute("question", questionService.getSearchQuestionProbis(vo3));

		return "hospital/getHospital";
	}

	// 상세조회에서 상품문의 등록페이지 이동
	@GetMapping("/insertQuestionBusi99")
	public String insertQuestionBusi(CafeVO vo, MemberVO vo1, String seq, String businessNumber, Model model,
			HttpSession session) {
		// 상품번호 담기
		model.addAttribute("seq", seq);
		vo.setSeq(seq);
		model.addAttribute("vo", cafeService.adminView(vo));

		// 작성자 이름 담기
		vo1.setMemberId((String) session.getAttribute("loginID"));
		model.addAttribute("member", memberService.getMember(vo1));

		// 사업자 아이디 담기
		BusinessVO vo2 = new BusinessVO();
		vo2.setBusinessNumber(businessNumber);
		model.addAttribute("business", businessService.getBusinessId(vo2));
		return "empty/reviewAndQuestion/insertQuestion2";
	}

	// 자주하는 질문 페이지 이동
	@GetMapping("/FAQ")
	public String FAQ() {
		return "eventAndNotice/FAQ";
	}

	@Autowired
	AnswerService answerService;

	// 마이페이지-유저-답변 받은 내역
	@GetMapping("/userAnswer")
	public String userAnswer(AnswerVO vo, HttpSession session, Model model) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		model.addAttribute("answer", answerService.getUserAnswer(vo));
		return "myPage/userAnswer";
	}

	// 댓글달기 ajax처리
	@Autowired
	CommentService commentService;

	@RequestMapping("/insertComment")
	@ResponseBody
	public CommentVO insertComment(CommentVO vo) {
		commentService.insertComment(vo);
		return vo;
	}

	@RequestMapping("/deleteComment")
	@ResponseBody
	public CommentVO deleteComment(CommentVO vo) {
		commentService.deleteComment(vo);
		return vo;
	}

	@Autowired
	ProductService productService;
	// 홈화면 출력(스프링 기본세팅)
	private static final Logger logger = LoggerFactory.getLogger(Controller1.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		// 쇼핑몰 물품 보이게 하기
		ProductVO vo = new ProductVO();
		model.addAttribute("product", productService.getSearchProduct99(vo));

		return "home";
	}// end of home
}
