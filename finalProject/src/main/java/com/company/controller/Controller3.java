package com.company.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.abandonment.common.AbandonmentAPI;
import com.company.product.service.ProductVO;

@Controller
public class Controller3 {

		@Autowired AbandonmentAPI abanAPI;	
		
		//유기동물 API
		@RequestMapping("/getAban")
		public void getAban(HttpServletResponse response,  String pageNo, String upr_cd) throws IOException{
			response.setContentType("text/xml; charset=UTF-8");
			response.getWriter().print(abanAPI.getAban(pageNo, upr_cd));
		}
		
		//유기동물 LIST
		@RequestMapping("/getAbanList")
		public String getAbanList() {
			return "abandonment/getabandonment";
		}
		
		
		//유기동물 API 시도
		@RequestMapping("/getAbanSido")
		public void getAbanSido(HttpServletResponse response) throws IOException{
			response.setContentType("text/xml; charset=UTF-8");
			response.getWriter().print(abanAPI.getAbanSido());
		}
		
		//유기동물 상세보기
		@RequestMapping("/getSearchAban")
		public String getSearchAban(String desertionNo, Model model, String pageNo, String upr_cd) {
			model.addAttribute("desertionNo", desertionNo);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("upr_cd", upr_cd);
			return "abandonment/getSearchAban";
		}
		
		@RequestMapping("/getSearchProduct")
		public String getSearchProduct(ProductVO vo){
			List<ProductVO> list = new ArrayList<ProductVO>();
			return "product/getSearchProduct";
		}
		@GetMapping("/insertProduct")
		public String insertProductForm() {
			return "product/insertProduct";
		}
	
}
