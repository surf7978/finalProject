package com.company.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.abandonment.common.AbandonmentAPI;

@Controller
public class Controller3 {

		@Autowired AbandonmentAPI abanAPI;	
		
		//유기동물 API
		@RequestMapping("/getAban")
		public void getAban(HttpServletResponse response,  String pageNo) throws IOException{
			response.setContentType("text/xml; charset=UTF-8");
			response.getWriter().print(abanAPI.getAban(pageNo));
		}
		
		//유기동물 API LIST(시도군)
		@RequestMapping("/getAbanSidoGun")
		public void getAbanSidoGun(HttpServletResponse response,String upr_cd) throws IOException{
			response.setContentType("text/xml; charset=UTF-8");
			response.getWriter().print(abanAPI.getAbanSidoGun(upr_cd));
		}
		
		//유기동물 LIST
		@RequestMapping("/getAbanList")
		public String getAbanList() {
			return "abandonment/getabandonment";
		}
		
		//유기동물 시군구 API
		@RequestMapping("/getAbanSigungu")
		public void getAbanSigungu(HttpServletResponse response,  String uprCd) throws IOException{
			response.setContentType("text/xml; charset=UTF-8");
			response.getWriter().print(abanAPI.getAbanSigungu(uprCd));
		}
		
		//유기동물 API 시도
		@RequestMapping("/getAbanSido")
		public void getAbanSido(HttpServletResponse response) throws IOException{
			response.setContentType("text/xml; charset=UTF-8");
			response.getWriter().print(abanAPI.getAbanSido());
		}
		
		//유기동물 상세보기
		@RequestMapping("/getSearchAban")
		public String getSearchAban(String desertionNo, Model model, String pageNo) {
			model.addAttribute("desertionNo", desertionNo);
			model.addAttribute("pageNo", pageNo);
			return "abandonment/getSearchAban";
		}
	
}
