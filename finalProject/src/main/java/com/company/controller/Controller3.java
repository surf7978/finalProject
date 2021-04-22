package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.company.abandonment.common.AbandonmentAPI;
import com.company.bCart.service.BCartService;
import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;
import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;
import com.company.cart.service.CartService;
import com.company.cart.service.CartVO;
import com.company.common.FileRenamePolicy;
import com.company.common.Paging;
import com.company.hospital.service.HospitalService;
import com.company.hospital.service.HospitalVO;
import com.company.integrated.service.IntegratedService;
import com.company.integrated.service.IntegratedVO;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;
import com.company.product.service.ProductSearchVO;
import com.company.product.service.ProductService;
import com.company.product.service.ProductVO;
import com.company.reservation.service.ReservationService;
import com.company.reservation.service.ReservationVO;

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
	@Autowired
	IntegratedService integratedService;
	@Autowired
	ReservationService rsvService;
	@Autowired
	HospitalService hospitalService;
	@Autowired
	BusinessService businessService;
	@Autowired
	BCartService bCartService;
	// 장바구니
	@Autowired
	CartService cartService;

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
		paging.setPageSize(3); // 보이는 페이지 번호
		// 2.초기페이지 설정
		if (vo.getPage() == null)
			vo.setPage(1);
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
	@RequestMapping("/getProduct22")
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
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/products");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		// 새로운 파일이 등록되었는지 확인
		String category = vo.getCategory();
		for (MultipartFile image : images) {
			if (image.getOriginalFilename() != null && !image.getOriginalFilename().equals("") && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)

			} else {
				// 새로운 파일이 등록되지않았다면
				// 기존이미지를 그대로 사용
				vo.setImage(request.getParameter("image"));

			}
		}
		vo.setImage(filenames);
		if (t_image.getOriginalFilename() != null && !t_image.getOriginalFilename().equals("")
				&& t_image.getSize() > 0) {
			String filename = t_image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			// rename.getName()
			// 파일명을 읽어내는게 getName()
			// 임시폴더에서 업로드 폴더로 파일이동
			t_image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setT_image(rename.getName());
		} else {
			// 새로운 파일이 등록되지않았다면
			// 기존이미지를 그대로 사용
			vo.setT_image(request.getParameter("t_image"));
		}
//			String path="resources/images";
		productService.updateProduct(vo);
		return "redirect:/getSearchProductForm";
	}

	@PostMapping("/insertProduct")
	public String insertProduct(ProductVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/products");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		for (MultipartFile image : images) {
			if (image != null && !image.isEmpty() && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
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
	public String PayInfo(MemberVO mvo, String name, String phone, String post, String address, String address2,
			ProductVO vo, Model model, String productNumber, String resultPrice, String[] countList, String[] optionNameList) {
		model.addAttribute("product", productService.getProduct(vo));
		vo.setResultPrice(resultPrice);
		vo.setCountList(countList);
		vo.setOptionNameList(optionNameList);
		mvo.setName(name);
		mvo.setPhone(phone);
		mvo.setPost(post);
		mvo.setAddress(address);
		mvo.setAddress(address2);
		model.addAttribute("optionNameList",vo.getOptionNameList());
		model.addAttribute("resultPrice", vo.getResultPrice());
		model.addAttribute("count", vo.getCountList());
		model.addAttribute("name", mvo.getName());
		model.addAttribute("phone", mvo.getPhone());
		model.addAttribute("post", mvo.getPost());
		model.addAttribute("address", mvo.getAddress());
		model.addAttribute("address2", mvo.getAddress2());

		return "pay/PayInfo";
	}

	// 쇼핑몰 바로가기 결제폼
	@RequestMapping("/PayInfoForm")
	public String PayInfoForm(ProductVO vo, Model model, String productNumber, String resultPrice, MemberVO mvo,
			String[] countList,String[] optionNameList, String[] optionPriceList) {
		model.addAttribute("product", productService.getProduct(vo));
		vo.setResultPrice(resultPrice);
		vo.setCountList(countList);
		vo.setOptionNameList(optionNameList);
		vo.setOptionPriceList(optionPriceList);
		model.addAttribute("optionNameList",vo.getOptionNameList());
		model.addAttribute("optionPriceList",vo.getOptionPriceList());
		model.addAttribute("resultPrice", vo.getResultPrice());
		model.addAttribute("member", memberService.getMember(mvo));
		model.addAttribute("count", vo.getCountList());
		return "pay/PayInfoForm";
	}

	// 쇼핑몰 결제시 insert
	@RequestMapping("/insertPayProduct")
	public String insertPayProduct(PayAndDeliveryVO padvo, BuyVO bvo, ProductVO vo, String category1) {
		bvo.setPndNumber(padvo.getPndNumber());
		bvo.setCategory(category1);
		bvo.setProductNumber(vo.getProductNumber());
		padService.insertPayAndDelivery2(padvo);
		return "pay/successPay";
	}
	
	
	// 쇼핑몰 결제시 다중insert
	@RequestMapping("/insertCartPayProduct")
	public String insertCartPayProduct(HttpSession session,PayAndDeliveryVO padvo, BuyVO bvo, ProductVO vo, String category1,CartVO cvo) {
		String id = session.getAttribute("loginID").toString();
		cvo.setMemberId(id);// 조회 후 값 넘김
		padvo.setCategory(category1);
		padService.insertPayAndDelivery2(padvo);
		bvo.setPndNumber(padvo.getPndNumber());
		List<BuyVO> list = new ArrayList<BuyVO>();
		list.add(bvo);
		buyService.insertCartBuy(list);
		//cartService.deleteCart(cvo);
		return "pay/successPay";
	}
	//장바구니 결제form
	@RequestMapping("/cartPayInfoForm")
	@ResponseBody
	public String cartPayInfoForm(MemberVO mvo, Model model, CartVO vo, HttpSession session,String[] cartNumbers, String resultPrice) {
		// 세션 ID값 조회
		String id = session.getAttribute("loginID").toString();
		vo.setCartNumbers(cartNumbers);
		// ID값 담음
		vo.setMemberId(id);// 조회 후 값 넘김
		List<CartVO> list = bCartService.getSearchTotalCart(vo);
		model.addAttribute("list",list);	
		model.addAttribute("resultPrice",resultPrice);
		model.addAttribute("member", memberService.getMember(mvo));
		return "pay/cartPayInfoForm";
	}
	//장바구니 결제시 다중insert form
	@RequestMapping("/insertCartBuy")
	public String insertCartBuy(HttpSession session, CartVO cvo,ProductVO vo,BuyVO bvo, Model model,String name){
		String id = session.getAttribute("loginID").toString();
		cvo.setMemberId(id);// 조회 후 값 넘김
		model.addAttribute("bvo", bvo);
		bvo.setFromPerson(name);
		model.addAttribute("name", bvo.getFromPerson());
		List<CartVO> list = bCartService.getSearchTotalCart(cvo);
		List<ProductVO> prolist = productService.cartGetProduct(vo);
		model.addAttribute("list",list);	
		model.addAttribute("prolist", prolist);
		model.addAttribute("vo", vo);
		return "pay/insertCartBuy";		
	}
	// 사업체 결제폼
	@RequestMapping("/ReserPayInfoForm")
	public String ReserPayInfoForm(Model model, String resultPrice, String count, IntegratedVO vo,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setCode(vo.getSeq().substring(0, 2));
		// 코드값 -> 테이블명 변환
		seqConversion(vo);
		map.put("count", count);
		map.put("resultPrice", resultPrice);
		vo = integratedService.getIntegrated(vo);
		// 제품 불러오기
		model.addAttribute("vo", vo);
		model.addAttribute("map", map);
		return "pay/ReserPayInfoForm";
	}

	// 사업체 결제API
	@RequestMapping("/ReserPayInfo")
	public String ReserPayInfo(MemberVO mvo, ReservationVO rvo, IntegratedVO vo, Model model, String resultPrice) {
		model.addAttribute("pay", rvo);
		return "pay/ReserPayInfo";
	}

	// 사업체 결제시 insert
	@RequestMapping("/ReserinsertPayProduct")
	public String ReserinsertPayProduct(PayAndDeliveryVO padvo, ReservationVO rvo) {
		padService.insertPayAndDelivery2(padvo);
		rvo.setPndNumber(padvo.getPndNumber());
		rsvService.insertPayReservation(rvo);
		return "pay/successPay";
	}

	// 병원 결제form
	@RequestMapping("/HospitalPayInfoForm")
	public String HospitalPayInfoForm(Model model, HospitalVO hosvo, String resultPrice, String count, String seq) {
		// member 불러오기
		// 제품 불러오기
		model.addAttribute("resultPrice", resultPrice);
		model.addAttribute("count", count);
		model.addAttribute("vo", hospitalService.getHospital(hosvo));
		return "pay/HospitalPayInfoForm";
	}

	// 병원 결제API
	@RequestMapping("/HospitalPayInfo")
	public String HospitalPayInfo(Model model) {
		return "pay/ReserPayInfo";
	}
	
	// 공통
		// 세션 및 busCode 변환
		public String sessionSelect(HttpSession session, IntegratedVO vo) {
			// 1. id로 businessTable 조회
			String id = session.getAttribute("loginID").toString();
			BusinessVO bvo = new BusinessVO();
			bvo.setBusinessId(id);
			bvo = businessService.getBusiness(bvo);
			// 2. business의 사업자 번호 가져와 넣기
			vo.setBusinessNumber(bvo.getBusinessNumber());
			vo.setCode(bvo.getBusinessCode());
			// 3. 코드값 변환
			if (vo.getCode().equals("10"))
				vo.setCode("HOTEL");
			else if (vo.getCode().equals("30"))
				vo.setCode("CAFE");
			else if (vo.getCode().equals("40"))
				vo.setCode("BEAUTY");
			else if (vo.getCode().equals("50"))
				vo.setCode("EDU");
			else if (vo.getCode().equals("60"))
				vo.setCode("TAXI");
			return vo.getCode();
		}// end of sessionSelect
		
		//seq를 code값으로 변환
		public void seqConversion(IntegratedVO vo) {
			if (vo.getCode().equals("10"))
				vo.setCode("HOTEL");
			else if (vo.getCode().equals("30"))
				vo.setCode("CAFE");
			else if (vo.getCode().equals("40"))
				vo.setCode("BEAUTY");
			else if (vo.getCode().equals("50"))
				vo.setCode("EDU");
			else if (vo.getCode().equals("60"))
				vo.setCode("TAXI");
		}

}
