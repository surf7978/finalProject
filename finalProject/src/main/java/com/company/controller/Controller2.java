package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;

 
/**
 * 
 * @author 이나경
 * 21.03.29 회원정보 조회, 수정, 삭제, 구매내역리스트
 * 21.03.30 구매내역 상세리스트, 구매내역 삭제
 *
 */
@Controller
public class Controller2 {
	
	@Autowired MemberService memberService;
	@Autowired PayAndDeliveryService payAndDeliveryService;
	@Autowired BuyService buyService;
	
	//단건조회
	@RequestMapping("/getMember")
	public String getMember(MemberVO vo, Model model) {
		vo = memberService.getMember(vo);
		model.addAttribute("member", vo);
		return "user/memberInfo";
	}
	
	//수정페이지로
	@GetMapping("/updateMember")
	public String updateMember(MemberVO vo, Model model) {
		vo = memberService.getMember(vo);
		model.addAttribute("member", vo);
		return "user/updateMember";
	}
	
	
	//회원수정
	@PostMapping("/updateMember")
	public String updateMemberProc(MemberVO vo, Model model) {
		memberService.updateMember(vo);
		model.addAttribute("member", vo);
		return "user/memberInfo";
	}
	
	
	//회원탈퇴
	@GetMapping("/deleteMember")
	public String deleteMember(MemberVO vo, Model model) {
		memberService.deleteMember(vo);
		model.addAttribute("member", vo);
		return "user/deleteMember";
	}
	
	//구매내역리스트조회   
	@RequestMapping("/getSearchPayAndDelivery")
	public String getSearchPayAndDelivery(PayAndDeliveryVO vo, Model model) {
		model.addAttribute("pads", payAndDeliveryService.getSearchPayAndDelivery(vo));
		return "user/getSearchPayAndDelivery";
	}   
	
	//구매내역 상세리스트 조회
	@RequestMapping("/getSearchBuy")
	public String getSearchBuy(BuyVO vo, Model model) {
		model.addAttribute("buys", buyService.getSearchBuy(vo));
		return "user/getSearchBuy";
	}
	 
	//구매내역 삭제
	@DeleteMapping("/deleteBuy")
	public String deleteBuy(BuyVO vo) {
		buyService.deleteBuy(vo);
		return "user/getSearchBuy";
	}
	
	//환불&반품내역리스트 조회
	
	
	
	
}
