package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;
import com.company.common.FileRenamePolicy;
import com.company.common.Paging;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;
import com.company.product.service.ProductSearchVO;
import com.company.product.service.ProductService;
import com.company.product.service.ProductVO;

@Controller
public class Controller3 {

	@Autowired
	AbandonmentAPI abanAPI;
	@Autowired
	ProductService productService;
	@Autowired
	MemberService memberService;
	@Autowired
	PayAndDeliveryService padService;
	@Autowired
	BuyService buyService;
	
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
	public String getSearchProductForm(ProductVO vo) {
		return "product/getSearchProduct";
	}

	// 쇼핑몰리스트(ajax)
	@RequestMapping("/getSearchProduct")	
	@ResponseBody
	public Map<String, Object> getSearchProduct(ProductSearchVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 1. 페이지 설정
		paging.setPageUnit(6); // 한페이지에 출력되는 레코드 건수
		paging.setPageSize(10); // 보이는 페이지 번호
		// 2.초기페이지 설정
		if (paging.getPage() == null)
			paging.setPage(1);
		// 3. 값 추가
		paging.setTotalRecord(productService.getCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		List<ProductVO> list = productService.getSearchProduct(vo);
		map.put("paging", paging);
		map.put("list", list);
		//
		return map;
	}// end of getSearchProduct

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

	// 쇼핑몰 삭제
	@RequestMapping("/deleteProduct")
	public String deleteProduct(ProductVO vo, String productNumber) {
		productService.deleteProduct(vo);
		return "product/getSearchProduct";
	}

	// 쇼핑몰 업데이트
	@GetMapping("/updateProduct")
	public String updateProductForm(ProductVO vo, Model model, String productNumber) {
		model.addAttribute("product", productService.getProduct(vo));
		return "product/updateProductForm";
	}

	@PostMapping("/updateProduct")
	public String updateProduct(ProductVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames ="";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/products");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		System.out.println("경로: " + path);
		//새로운 파일이 등록되었는지 확인
		String category = vo.getCategory();
		for(MultipartFile image : images) {
			if (image.getOriginalFilename() != null && !image.getOriginalFilename().equals("") && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if(!start) {
					filenames += ",";						
				}else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
				
			}else {
				//새로운 파일이 등록되지않았다면
				//기존이미지를 그대로 사용
				vo.setImage(request.getParameter("image"));
				
			}
		}
		vo.setImage(filenames);
		if (t_image.getOriginalFilename() != null && !t_image.getOriginalFilename().equals("") && t_image.getSize() > 0) {
			String filename = t_image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			// rename.getName()
			// 파일명을 읽어내는게 getName()
			// 임시폴더에서 업로드 폴더로 파일이동
			t_image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setT_image(rename.getName());
		}else {
			//새로운 파일이 등록되지않았다면
			//기존이미지를 그대로 사용
			vo.setT_image(request.getParameter("t_image"));			
		}
//			String path="resources/images";
		productService.updateProduct(vo);
		return "redirect:/getSearchProductForm";
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
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames ="";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/products");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		System.out.println("경로: " + path);
		for(MultipartFile image : images) {
			if (image != null && !image.isEmpty() && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if(!start) {
					filenames += ",";						
				}else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
				
			}
		}
		vo.setImage(filenames);

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

	// 결제API
	@RequestMapping("/PayInfo")
	public String PayInfo(MemberVO mvo, String name, String phone, String post, String address, String address2,ProductVO vo, Model model, String productNumber, String resultPrice, String count) {
		model.addAttribute("product", productService.getProduct(vo));
		vo.setResultPrice(resultPrice);
		vo.setCount(count);
		mvo.setName(name);
		mvo.setPhone(phone);
		mvo.setPost(post);
		mvo.setAddress(address);
		mvo.setAddress(address2);
		model.addAttribute("resultPrice", vo.getResultPrice());
		model.addAttribute("count", vo.getCount());
		model.addAttribute("name", mvo.getName());
		model.addAttribute("phone", mvo.getPhone());
		model.addAttribute("post", mvo.getPost());
		model.addAttribute("address", mvo.getAddress());
		model.addAttribute("address2", mvo.getAddress2());
		
		return "pay/PayInfo";
	}
	//결제폼으로
	@RequestMapping("/PayInfoForm")
	public String PayInfoForm(ProductVO vo, Model model, String productNumber, String resultPrice, MemberVO mvo, String count) {
		model.addAttribute("product", productService.getProduct(vo));
		vo.setResultPrice(resultPrice);
		vo.setCount(count);
		model.addAttribute("resultPrice", vo.getResultPrice());
		model.addAttribute("member", memberService.getMember(mvo));
		model.addAttribute("count", vo.getCount());
		return "pay/PayInfoForm";
	}
	//결제시 insert
	@RequestMapping("/insertPayProduct")
	public String insertPayProduct(PayAndDeliveryVO padvo, BuyVO bvo,ProductVO vo, String category1) {
		padService.insertPayAndDelivery2(padvo);
		bvo.setPndNumber(padvo.getPndNumber());
		bvo.setCategory(category1);
		bvo.setProductNumber(vo.getProductNumber());
		buyService.insertBuy2(bvo);		
		return "pay/successPay";
	}

}
