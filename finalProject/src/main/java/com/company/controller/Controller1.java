package com.company.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.member.common.KakaoAPI;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.member.service.impl.MemberServiceimpl;

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
		MemberServiceimpl memberServiceimpl = new MemberServiceimpl();
		String insertPW = vo.getPassword(); //로그인화면에 입력한 비밀번호
        String DBinPW = memberService.getViewMember(vo).getPassword(); //DB안에 암호화된 비밀번호
		if(memberServiceimpl.matches(insertPW, DBinPW)){ //입력한 비밀번호와 DB의 비밀번호 일치체크
			session.setAttribute("loginID", memberService.getViewMember(vo).getMemberId()); //세션에 로그인한 아이디 담아줌
			return "/home";
		} else {
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
		return "redirect:/";
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
