package com.company.board.service;

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


}
