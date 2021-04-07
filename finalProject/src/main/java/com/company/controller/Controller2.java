package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

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
import org.springframework.web.multipart.MultipartFile;

import com.company.animal.service.AnimalService;
import com.company.animal.service.AnimalVO;
import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;
import com.company.common.FileRenamePolicy;
import com.company.hospital.service.HospitalService;
import com.company.hospital.service.HospitalVO;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;
import com.company.reservation.service.ReservationService;
import com.company.reservation.service.ReservationVO;
import com.company.review.service.ReviewService;
import com.company.review.service.ReviewVO;

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
	@Autowired
	BusinessService businessService;
	@Autowired
	ReservationService reservationService;
	@Autowired
	ReviewService reviewService;

	// 일반회원 본인정보 조회
	@RequestMapping("/getMember1")
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
	public String deleteMember(MemberVO vo, Model model, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		model.addAttribute("member", vo);
		memberService.deleteMember(vo);
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
	
	//예약내역 상세리스트 조회
	@RequestMapping("/getSearchReservation")
	public String getSearchReservation(ReservationVO vo, Model model) {
		model.addAttribute("reservation", reservationService.getSearchReservation(vo));
		return "reservation/getSearchReservation";
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
	public String insertAnimal() {
		return "animal/insertAnimal";
	}

	// 반려동물 등록
	@PostMapping("/insertAnimal")
	public String insertAnimalProc(AnimalVO vo, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
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
	public String getHospital(HospitalVO vo, Model model, String hospitalNumber, HttpSession session) {
		vo.setHospitalNumber(hospitalNumber);
		model.addAttribute("hospital", hospitalService.getHospital(vo));
		
		ReservationVO vo1 = new ReservationVO();
		vo1.setMemberId((String) session.getAttribute("loginID"));
		vo1.setBisNumber(hospitalNumber);
		model.addAttribute("reservation", reservationService.getViewReservation(vo1));
		return "hospital/getHospital";
	}
	
	//병원 상세조회 + 구매평 전체리스트 출력
	@RequestMapping("/getHospital99")
	public String getHospital99(HospitalVO vo, Model model, String hospitalNumber, HttpSession session, ReviewVO vo2) {
		vo.setHospitalNumber(hospitalNumber);
		model.addAttribute("hospital", hospitalService.getHospital(vo));
			
		ReservationVO vo1 = new ReservationVO();
		vo1.setMemberId((String) session.getAttribute("loginID"));
		vo1.setBisNumber(hospitalNumber);
		model.addAttribute("reservation", reservationService.getViewReservation(vo1));
		
		Controller1 c1 = new Controller1();
		c1.getSearchReviewD(vo2, model);
		return "hospital/getHospital";
	}
	
	
	// 병원상품 등록 페이지
	@GetMapping("/insertHospital")
	public String insertHospitalForm(BusinessVO vo, Model model, HttpSession session) {
		vo.setBusinessId((String) session.getAttribute("loginID"));
		model.addAttribute("businessCompanyName", businessService.getBusiness(vo).getBusinessCompanyName());
		return "hospital/insertHospital";
	}

	// 병원상품 등록 처리
	@PostMapping("/insertHospital")
	public String insertHospital(HospitalVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(vo);
		// 첨부파일처리
		MultipartFile image = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String path =  request.getSession().getServletContext().getRealPath("resources/img/hospital/");
		System.out.println("경로: " +path);
		if (image != null && !image.isEmpty() && image.getSize() > 0) {
			String filename = image.getOriginalFilename();
			//파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			//rename.getName()				
			//파일명을 읽어내는게 getName()
			//임시폴더에서 업로드 폴더로 파일이동
			image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setImage(rename.getName());
		}
		
		if (t_image != null && !t_image.isEmpty() && t_image.getSize() > 0) {
			String filename = t_image.getOriginalFilename();
			//파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			//rename.getName()				
			//파일명을 읽어내는게 getName()
			//임시폴더에서 업로드 폴더로 파일이동
			t_image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setT_image(rename.getName());
		}
		hospitalService.insertHospital(vo);
		return "redirect:/getSearchHospital";
	}
	//병원상품 사업자별 조회(수정페이지로 가기 위한)
	
	
	// 병원상품 수정 페이지
	
		
	
	//병원상품 수정 처리

	
	// 병원상품 삭제
	
	//상세조회에서 구매평 등록페이지 이동
	@GetMapping("/insertReview")
	public String insertReview(ReservationVO vo, Model model, HttpSession session) {
		vo.setMemberId((String) session.getAttribute("loginID"));
		model.addAttribute("reservation", reservationService.getViewReservation(vo));
		return "reviewAndQuestion/insertReview";
	}
	
	//상세조회에서 구매평 등록처리
	@PostMapping("/insertReview")
	public void insertReview(ReviewVO vo, HttpServletResponse response) throws IOException {
		reviewService.insertReview(vo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println(
				"<script>alert('등록되었습니다');window.close();</script>");
		writer.close();
	}
	
	//상세조회에서 상품문의 등록페이지 이동
	
	//상세조회에서 상품문의 등록처리
	
	
	
}
