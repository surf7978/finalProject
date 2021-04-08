
package com.company.board.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {
	String boardNumber;
	String image;
	String title;
	String calendar;
	String content;
	String writer;
	String views;
	String category;
	String memberId;
<<<<<<< HEAD
=======
	String t_image;
>>>>>>> branch 'master' of https://github.com/surf7978/finalProject.git
	MultipartFile uploadFile;
	MultipartFile t_uploadFile;
<<<<<<< HEAD
	
	


=======
>>>>>>> branch 'master' of https://github.com/surf7978/finalProject.git
}

