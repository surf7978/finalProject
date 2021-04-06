package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.company.abandonment.common.AbandonmentAPI;
import com.company.common.FileRenamePolicy;
import com.company.member.service.MemberService;
import com.company.product.service.ProductService;
import com.company.product.service.ProductVO;
import com.company.product.service.impl.ProductMapper;

@Controller
public class Controller3 {

	@Autowired
	AbandonmentAPI abanAPI;
	@Autowired
	ProductService productService;
	@Autowired
	MemberService memberService;

	// 유기동물 API
	@RequestMapping("/getAban")
	public void getAban(HttpServletResponse response, String pageNo, String upr_cd) throws IOException {
		response.setContentType("text/xml; charset=UTF-8");
		response.getWriter().print(abanAPI.getAban(pageNo, upr_cd));
	}

	// 유기동물 LIST
	@RequestMapping("/getAbanList")
	public String getAbanList() {
		return "abandonment/getabandonment";
	}

	// 유기동물 API 시도
	@RequestMapping("/getAbanSido")
	public void getAbanSido(HttpServletResponse response) throws IOException {
		response.setContentType("text/xml; charset=UTF-8");
		response.getWriter().print(abanAPI.getAbanSido());
	}

	// 유기동물 상세보기
	@RequestMapping("/getSearchAban")
	public String getSearchAban(String desertionNo, Model model, String pageNo, String upr_cd) {
		model.addAttribute("desertionNo", desertionNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("upr_cd", upr_cd);
		return "abandonment/getSearchAban";
	}

	// 쇼핑몰 리스트로 가기
	@RequestMapping("/getSearchProductForm")
	public String getSearchProductForm(ProductVO vo, Model model) {
		model.addAttribute("product", productService.getSearchProduct(vo));
		return "product/getSearchProduct";
	}

	// 쇼핑몰 리스트
	@RequestMapping("/getSearchProduct")
	@ResponseBody
	public List<ProductVO> getSearchProduct(ProductVO vo) {
		return productService.getSearchProduct(vo);		
	}

	// 쇼핑몰 상세보기
	@RequestMapping("/getProduct")
	public String getProduct(ProductVO vo, Model model, String productNumber) {
		model.addAttribute("product", productService.getProduct(vo));
		return "product/getProduct";
	}

	// 쇼핑몰 등록하기
	@GetMapping("/insertProduct")
	public String insertProductForm() {
		return "product/insertProduct";
	}

	@GetMapping("/coco")
	public String coco() {
		return "empty/popup/coco";
	}
	@PostMapping("/insertProduct")
	public String insertProduct(ProductVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(vo);
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile image = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String path = request.getSession().getServletContext().getRealPath("/resources/images/products");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
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
//			String path="resources/images";
		productService.insertProduct(vo);
		return "redirect:/getSearchProductForm";
	}

	//결제API
	@RequestMapping("/PayInfo")
	public String PayInfo(ProductVO vo, Model model, String productNumber,String resultPrice) {
		model.addAttribute("product", productService.getProduct(vo));
		vo.setResultPrice(resultPrice);
		model.addAttribute("resultPrice", vo.getResultPrice());
		return "pay/PayInfo";
	}	

}
