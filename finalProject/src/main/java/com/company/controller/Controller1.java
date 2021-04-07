package com.company.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

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

import com.company.animal.service.AnimalService;
import com.company.animal.service.AnimalVO;
import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.member.common.KakaoAPI;
import com.company.member.common.coolsmsAPI;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.member.service.impl.MemberServiceimpl;
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
		String idCheck = memberService.getViewMember(vo).getMemberId();
		if(idCheck.equals(null)) {
			return "redirect:/loginForm";
		}else {
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
	
	//회원가입 선택 화면
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
		return "redirect:/";
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
		return "member/coolsms";
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
	
	//구매평 전체리스트 다른 컨트롤러에 쓰는 메소드용
	public Model getSearchReviewD(ReviewVO vo, Model model) {
		return model.addAttribute("review", reviewService.getSearchReview(vo));
	}
	
	//구매평 단건리스트 출력(ajax로 같은 페이지 출력)
	@RequestMapping("/getReview99")
	@ResponseBody
	public ReviewVO getReview99(ReviewVO vo) {
		return reviewService.getReview(vo);
	}
	
	@Autowired AnimalService animalService;
	
	//회원탈퇴
	@PostMapping("/membershipCancel")
	public String membershipCancel(String ID, HttpSession session) {
		MemberVO vo = new MemberVO();
		vo.setMemberId(ID);
		if(memberService.getViewMember(vo).getAuth().equals("m")) {
			AnimalVO voAnimal = new AnimalVO();
			voAnimal.setMemberId(ID);
			animalService.deleteAnimal(voAnimal);
			memberService.deleteMember(vo);
			session.invalidate();
		}else {
			BusinessVO vo1 = new BusinessVO();
			vo1.setBusinessId(ID);
			businessService.deleteBusiness(vo1);
		}
		return "redirect:/getSearchViewMember";
	}
	
	//관리자-전체회원 조회
	@RequestMapping("/getSearchViewMember")
	public String getSearchMember(MemberVO vo, Model model) {
		model.addAttribute("list", memberService.getSearchViewMember(vo));
		return "member/getSearchMember";
	}
	
	// 홈화면 출력(스프링 기본세팅)
	private static final Logger logger = LoggerFactory.getLogger(Controller1.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}// end of home
}
