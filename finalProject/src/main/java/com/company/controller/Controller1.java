package com.company.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.business.service.BusinessVO;
import com.company.business.service.impl.BusinessMapper;
import com.company.member.service.MemberVO;
import com.company.member.service.impl.MemberMapper;

@Controller
public class Controller1 {

	@Autowired
	MemberMapper memberMapper;
	@Autowired
	BusinessMapper businessMapper;
	
	//로그인화면 이동
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	//로그인 처리
	@PostMapping("/login")
	public String loginProc(MemberVO vo, HttpSession session) {
		if(memberMapper.getMember(vo).getMemberId().equals(vo.getMemberId()) && memberMapper.getMember(vo).getPassword().equals(vo.getPassword())){
			session.setAttribute("member", memberMapper.getMember(vo));
			return "/home";
		} else {
			return "redirect:/login";
		}
	}
	
	//로그아웃처리
	@RequestMapping("/logout")
	public String logoutProc(HttpSession session) {
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
		memberMapper.insertMember(vo);
		return "redirect:/login";
	}
	
	//사업자 회원가입화면
	@GetMapping("/signUpBusiness")
	public String signUpBusiness() {
		return "member/signUpBusiness";
	}
	
	//사업자 회원가입 처리
		@PostMapping("/signUpBusiness")
		public String signUpBusinessProc(BusinessVO vo) {
			businessMapper.insertBusiness(vo);
			return "redirect:/login";
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
