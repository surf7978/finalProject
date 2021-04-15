package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
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
import com.company.board.service.BoardService;
import com.company.board.service.BoardVO;
import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;
import com.company.common.FileRenamePolicy;
import com.company.common.Paging;
import com.company.hospital.service.HospitalSearchVO;
import com.company.hospital.service.HospitalService;
import com.company.hospital.service.HospitalVO;
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
	
	//로그인화면 이동
	@GetMapping("/loginForm")
	public String loginForm() {
		return "member/login";
	}
	
	//일반사용자 로그인 처리
	@PostMapping("/login")
	public String loginProc(MemberVO vo, HttpSession session) {
		if(memberService.getViewMember(vo) != null) {
			MemberServiceimpl memberServiceimpl = new MemberServiceimpl();
			String insertPW = vo.getPassword(); //로그인화면에 입력한 비밀번호
			String DBinPW = memberService.getViewMember(vo).getPassword(); //DB안에 암호화된 비밀번호
			if(memberServiceimpl.matches(insertPW, DBinPW)){ //입력한 비밀번호와 DB의 비밀번호 일치체크
				session.setAttribute("loginID", memberService.getViewMember(vo).getMemberId()); //세션에 로그인한 아이디 담아줌
				session.setAttribute("loginAuth", memberService.getViewMember(vo).getAuth()); //권한 확인
				return "/home";
			} else {
				return "redirect:/loginForm";
			}
		}else {
			return "redirect:/loginForm";
		}
	}
	
	//로그아웃처리
	@RequestMapping("/logout")
	public String logoutProc(HttpSession session) {
		String access_token = (String) session.getAttribute("access_token");
		kakaoAPI.kakaoLogout(access_token);
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입 선택 화면myPageSideBar
	@RequestMapping("/signUpSelect")
	public String signUpSelect() {
		return "member/signUpSelect";
	}
	
	//일반사용자 회원가입화면
	@GetMapping("/signUpUser")
	public String signUpUser() {
		return "member/signUpUser";
	}
	
	//일반사용자 회원가입 처리
	@PostMapping("/signUpUser")
	public String signUpUserProc(MemberVO vo) {
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		String pw = bcrypt.encode(vo.getPassword());
		vo.setPassword(pw);
		memberService.insertMember(vo);
		return "redirect:/loginForm";
	}
	
	//사업자 회원가입화면
	@GetMapping("/signUpBusiness")
	public String signUpBusiness() {
		return "member/signUpBusiness";
	}
	
	//사업자 회원가입 처리
	@PostMapping("/signUpBusiness")
	public String signUpBusinessProc(BusinessVO vo) {
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		String pw = bcrypt.encode(vo.getPassword());
		vo.setPassword(pw);
		businessService.insertBusiness(vo);
		return "redirect:/loginForm";
	}
	 
	//카카오로그인
	@RequestMapping("/callback")
	public String callback(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println("code값 : "+map.get("code"));
		String code = (String) map.get("code");
		String access_token = kakaoAPI.getAccessToken(code);
		System.out.println("access_token : "+access_token);
		Map<String, Object> userInfo = kakaoAPI.getUserInfo(access_token);
		System.out.println("userInfo : "+userInfo);
		//token을 session저장(DB 저장)
		session.setAttribute("access_token", access_token);
		session.setAttribute("loginID", userInfo.get("nickname"));
		session.setAttribute("loginAuth", "m");
		System.out.println(session.getAttribute("loginID")+" "+session.getAttribute("loginAuth"));
		//카톡로그인 DB에 저장하기
		MemberVO vo = new MemberVO();
		vo.setMemberId((String) userInfo.get("nickname"));
		if(memberService.getViewMember(vo)!=null) { //DB체크했을때 값이없으면 DB에 추가, 있으면 비교 후 DB추가 다 있으면 로그인
			if(memberService.getViewMember(vo).getMemberId().equals((String)userInfo.get("nickname"))) {
				return "redirect:/";
			}else {
				vo.setPassword(" ");
				vo.setEmail(" ");
				vo.setName((String)userInfo.get("nickname"));
				vo.setPost(" ");
				vo.setAddress(" ");
				vo.setAddress2(" ");
				vo.setPhone(" ");
				memberService.insertMember(vo);
				return "redirect:/";
			}
		}else {
			vo.setPassword(" ");
			vo.setEmail(" ");
			vo.setName((String)userInfo.get("nickname"));
			vo.setPost(" ");
			vo.setAddress(" ");
			vo.setAddress2(" ");
			vo.setPhone(" ");
			memberService.insertMember(vo);
			return "redirect:/";
		}
	}
	
	//아이디 중복체크 기능
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int idCheck(MemberVO vo) {
		int result = memberService.idCheck(vo);
		return result;
	}
	
	//아이디/비밀번호찾기 이동
	@GetMapping("/searchID&PW")
	public String searchIDnPW() {
		return "member/searchID&PW";
	}
	
	//아이디 찾기
	@ResponseBody
	@RequestMapping(value="/searchID", method=RequestMethod.POST)
	public String searchID(MemberVO vo) {
		String result = memberService.searchID(vo);
		return result;
	}
		
	//비밀번호 찾기
	@ResponseBody
	@RequestMapping(value="/searchPW", method=RequestMethod.POST)
	public String searchPW(MemberVO vo) {
		String result = memberService.searchPW(vo);
		return result;
	}
	
	//비밀번호 변경
	@RequestMapping("/changePW")
	public String changePW(MemberVO vo) {
		if(memberService.getViewMember(vo).getAuth().equals("m")) {
			BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
			String pw = bcrypt.encode(vo.getPassword());
			vo.setPassword(pw);
			memberService.updateMember(vo);
		}else {
			BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
			String pw = bcrypt.encode(vo.getPassword());
			BusinessVO vo1 = new BusinessVO();
			vo1.setPassword(pw);
			vo1.setBusinessId(vo.getMemberId());
			businessService.updateBusiness(vo1);
		}
		return "redirect:/loginForm";
	}
	
	//휴대폰인증 페이지 이동
	@GetMapping("/coolsms")
	public String phone() {
		return "empty/member/coolsms";
	}
	
	@Autowired coolsmsAPI certificationService;
	//휴대폰인증-문자전송
	@GetMapping("/sendSMS")
    public @ResponseBody
    String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        //이게 문자보내는 기능 돈들어가니까 일단 주석처리 함 certificationService.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr;
    }
	 
	// 사업자번호 조회
	@PostMapping(value="/bizno", produces = "application/html; charset=utf-8")
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
	 
	@Autowired ReviewService reviewService;
	//구매평 전체리스트 출력
	@GetMapping("/getSearchReview99")
	public String getSearchReview99(ReviewVO vo, Model model) {
		model.addAttribute("review", reviewService.getSearchReview(vo));
		return "member/getSearchReview99";
	}
	
	//구매평 단건리스트 출력(ajax로 같은 페이지 출력)
	@RequestMapping("/getReview99")
	@ResponseBody
	public ReviewVO getReview99(ReviewVO vo) {
		return reviewService.getReview(vo);
	}
	 
	@Autowired AnimalService animalService;
	
	//관리자용 회원탈퇴
	@GetMapping("/deleteMember99")
	public String deleteMember99(String ID) {
		MemberVO vo = new MemberVO();
		vo.setMemberId(ID);
		if(memberService.getViewMember(vo).getAuth().equals("m")) {
			AnimalVO voAnimal = new AnimalVO();
			voAnimal.setMemberId(ID);
			if(animalService.getSearchAnimal(voAnimal)!=null) {
				animalService.deleteAnimal99(voAnimal);
			}
			memberService.deleteMember(vo);
		}else {
			BusinessVO vo1 = new BusinessVO();
			vo1.setBusinessId(ID);
			businessService.deleteBusiness(vo1);
		}
		return "redirect:/getSearchViewMember";
	}
	
	//회원용 회원탈퇴
	@GetMapping("/membershipCancel")
	public String membershipCancel(String ID, HttpSession session) {
		MemberVO vo = new MemberVO();
		vo.setMemberId(ID);
		if(memberService.getViewMember(vo).getAuth().equals("m")) {
			AnimalVO voAnimal = new AnimalVO();
			voAnimal.setMemberId(ID);
			if(animalService.getSearchAnimal(voAnimal)!=null) {
				animalService.deleteAnimal99(voAnimal);
			}
			memberService.deleteMember(vo);
			session.invalidate();
		}else {
			BusinessVO vo1 = new BusinessVO();
			vo1.setBusinessId(ID);
			businessService.deleteBusiness(vo1);
			session.invalidate();
		}
		return "redirect:/";
	}
	 
	//관리자-전체회원 조회
	@RequestMapping("/getSearchViewMember")
	public String getSearchMember(MemberVO vo, Model model) {
		model.addAttribute("list", memberService.getSearchViewMember(vo));
		return "member/getSearchMember";
	}
	
	//사업자-개인정보 조회
	@GetMapping("/getBusiness99")
	public String getBusiness99(HttpSession session, Model model, BusinessVO vo1) {
		if(session.getAttribute("loginID").equals("admin")) {
			model.addAttribute("business", businessService.getBusiness(vo1));
		}else {
			BusinessVO vo = new BusinessVO();
			vo.setBusinessId((String) session.getAttribute("loginID"));
			model.addAttribute("business", businessService.getBusiness(vo));
		}
		return "business/getBusiness99";
	}
	
	@PostMapping("/updateBusiness99")
	public String updateBusiness99(BusinessVO vo) {
		businessService.updateBusiness(vo);
		return "redirect:/getBusiness99?businessId="+vo.getBusinessId();
	}
	
	@RequestMapping("/getSearchAnimal99")
	public String getSearchAnimal(AnimalVO vo, Model model) {
		model.addAttribute("animal", animalService.getSearchAnimal99(vo));
		return "animal/getSearchAnimal99";
	}
	
	@Autowired HospitalService hospitalService;
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
		String path = request.getSession().getServletContext().getRealPath("resources/img/hospital/");
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
		return "redirect:/getSearchHospital99";
	}
	
	// 병원상품 삭제
	@GetMapping("/deleteHospital")
	public String deleteHospital(HospitalVO vo) {
		hospitalService.deleteHospital(vo);
		return "redirect:/getSearchHospital99";
	}
	
	//마이페이지 사이드바 출력(jsp:include해서 이제 이건 사용안함)
	@GetMapping("/myPageSideBar")
	public String myPageSideBar() {
		return "user/myPageSideBar1";
	}
	
	//마이페이지-일반사용자-내가쓴글 출력
	@Autowired BoardService boardService;
	@GetMapping("/getSearchBoardCategory199")
	public String getSearchBoardCategory199(MemberVO vo, Model model) {
		BoardVO vo1 =new BoardVO();
		vo1.setMemberId(vo.getMemberId());
		model.addAttribute("board", boardService.getSearchBoardCategory199(vo1));
		return "myPage/getSearchBoardCategory199";
	}
	
	//마이페이지-일반사용자-후기내역 출력
	@GetMapping("/getSearchReview98")
	public String getSearchReview98(MemberVO vo, Model model) {
		ReviewVO vo1 =new ReviewVO();
		vo1.setMemberId(vo.getMemberId());
		model.addAttribute("review", reviewService.getSearchReview99(vo1));
		return "myPage/getSearchReview98";
	}
	//마이페이지-일반사용자-후기내역 상세 출력
	@GetMapping("/getReview")
	public String getReview99(ReviewVO vo, Model model) {
		model.addAttribute("review", reviewService.getReview(vo));
		return "myPage/getReview99";
	}
	
	@Autowired QuestionService questionService;
	//마이페이지-일반사용자-문의내역 출력
	@GetMapping("/getSearchQuestion99")
	public String getSearchQuestion99(MemberVO vo, Model model) {
		QuestionVO vo1 =new QuestionVO();
		vo1.setMemberId(vo.getMemberId());
		model.addAttribute("question", questionService.getSearchQuestion99(vo1));
		return "myPage/getSearchQuestion99";
	}
	
	//로그인화면 이동
	@GetMapping("/buyCancel")
	public String buyCancel() {
		return "pay/buyCancel";
	}
	
	@Autowired PayAndDeliveryService payAndDeliveryService;
	// 관리자용 구매현황 리스트조회
	@RequestMapping("/getSearchPayAndDelivery99")
	public String getSearchPayAndDelivery99(PayAndDeliveryVO vo, Model model) {
		model.addAttribute("pads", payAndDeliveryService.getSearchPayAndDelivery99(vo));
		return "user/getSearchPayAndDelivery99";
	}
	
	@Autowired BuyService buyService;
	// 구매내역 상세리스트 조회
	@RequestMapping("/getSearchBuy99")
	public String getSearchBuy(BuyVO vo, Model model) {
		model.addAttribute("buys", buyService.getSearchBuy(vo));
		return "empty/user/getSearchBuy99";
	}
	
	// 관리자용 예약현황 리스트조회
	@RequestMapping("/getSearchPayAndDelivery98")
	public String getSearchPayAndDelivery98(PayAndDeliveryVO vo, Model model) {
		model.addAttribute("pads", payAndDeliveryService.getSearchPayAndDelivery99(vo));
		return "user/getSearchPayAndDelivery98";
	}
	
	// 병원 리스트로 가기
	@RequestMapping("/getSearchHospitalForm99")
	public String getSearchProductForm(ProductVO vo) {
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
	
	@Autowired ProductService productService;
	// 홈화면 출력(스프링 기본세팅)
	private static final Logger logger = LoggerFactory.getLogger(Controller1.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		
		//쇼핑몰 물품 보이게 하기
		ProductVO vo = new ProductVO();
		model.addAttribute("product", productService.getSearchProduct99(vo));
		
		return "home";
	}// end of home
}
