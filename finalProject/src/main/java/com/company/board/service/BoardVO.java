
package com.company.board.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {
	String boardNumber;
	String t_image;
	String image;
	String title;
	String calendar;
	String content;
	String writer;	
	String views;
	String category;
	String memberId;
	MultipartFile uploadFile;
	MultipartFile t_uploadFile;
	
	


}

