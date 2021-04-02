package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.animal.service.AnimalService;
import com.company.animal.service.AnimalVO;
import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;
import com.company.hospital.service.HospitalService;
import com.company.hospital.service.HospitalVO;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;

/**
 * 
 * @author 이나경 21.03.29 회원정보 조회, 수정, 삭제, 구매내역리스트 21.03.30 구매내역 상세리스트 21.03.31
 *         택배API, 반려동물리스트 21.04.01 마이펫수첩CRUD 21.04.02 병원CRUD
 *
 */
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

	// 일반회원 본인정보 조회
	@RequestMapping("/getMember")
	public String getMember(MemberVO vo, Model model, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		vo = memberService.getMember(vo);
		model.addAttribute("member", vo);
		return "user/memberInfo";
	}

	// 수정페이지로
	@GetMapping("/updateMember")
	public String updateMember(MemberVO vo, Model model, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		vo = memberService.getMember(vo);
		model.addAttribute("member", vo);
		return "user/updateMember";
	}

	// 회원수정
	@PostMapping("/updateMember")
	public String updateMemberProc(MemberVO vo, Model model) {
		memberService.updateMember(vo);
		model.addAttribute("member", vo);
		return "redirect:/";
	}

	// 회원탈퇴
	@GetMapping("/deleteMember")
	public String deleteMember(MemberVO vo, Model model) {
		memberService.deleteMember(vo);
		model.addAttribute("member", vo);
		return "user/deleteMember";
	}

	// 구매내역리스트조회
	@RequestMapping("/getSearchPayAndDelivery")
	public String getSearchPayAndDelivery(PayAndDeliveryVO vo, Model model, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		model.addAttribute("pads", payAndDeliveryService.getSearchPayAndDelivery(vo));
		return "user/getSearchPayAndDelivery";
	}

	// 구매내역 상세리스트 조회
	@RequestMapping("/getSearchBuy")
	public String getSearchBuy(BuyVO vo, Model model) {
		model.addAttribute("buys", buyService.getSearchBuy(vo));
		return "user/getSearchBuy";
	}

	// 구매내역 삭제
	@DeleteMapping("/deleteBuy")
	public String deleteBuy(BuyVO vo) {
		buyService.deleteBuy(vo);
		return "user/getSearchBuy";
	}

	/////////// 마이펫 수첩/////////
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

	// 반려동물 삭제
	@DeleteMapping("/deleteAnimal")
	public String deleteAnimal(AnimalVO vo, Model model) {
		animalService.deleteAnimal(vo);
		model.addAttribute("animal", vo);
		return "user/deleteMember";
	}

	// 반려동물 등록 페이지
	@GetMapping("/insertAnimal")
	public String insertAnimal(AnimalVO vo, Model model) {
		model.addAttribute("animal", vo);
		return "animal/insertAnimal";
	}

	// 반려동물 등록
	@PostMapping("/insertAnimal")
	public String insertAnimalProc(AnimalVO vo, Model model) {
		animalService.insertAnimal(vo);
		model.addAttribute("animal", vo);
		return "redirect:/getSearchAnimal?memberId=" + vo.getMemberId();
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
	public String updateAnimalProc(AnimalVO vo, Model model) {
		animalService.updateAnimal(vo);
		model.addAttribute("animal", vo);
		return "redirect:/getSearchAnimal?memberId=" + vo.getMemberId();
	}

	//////// 병원상품//////////
	// 병원상품 전체리스트 조회
	@RequestMapping("/getSearchHospital")
	public String getSearchHospital(HospitalVO vo, Model model) {
		model.addAttribute("hospital", hospitalService.getSearchHospital(vo));
		return "hospital/getSearchHospital";
	}

	// 병원상품 상세조회
	@RequestMapping("/getHospital")
	public String getHospital(HospitalVO vo, Model model) {
		model.addAttribute("hospital", hospitalService.getHospital(vo));
		return "hospital/getSearchHospital";
	}

	// 병원상품 등록 페이지
	@GetMapping("/insertHospital")
	public String insertHospitalForm(HospitalVO vo, Model model) {
		model.addAttribute("hospital", vo);
		return "hospital/insertHospital";
	}

	// 병원상품 등록 처리
	@PostMapping("/insertHospital")
	public String insertHospital(HospitalVO vo) {
		hospitalService.insertHospital(vo);
		return "redirect:/getSearchHospital";
	}
	
	// 병원상품 수정 페이지
	
	
	//병원상품 수정 처리

	
	// 병원상품 삭제
	
	
	
}
