package com.company.question.service;

import lombok.Data;

@Data
public class QuestionVO {
	private String questionNumber;// 문의번호
	private String title;// 제목
	private String calender;// 날짜
	private String content;// 내용
	private String writer;// 작성자
	private String toPerson;// 받는사람
	private String category;// 글분류
	private String memberId;// 아이디(FK)
	// paging
	Integer page = 1;
	Integer start = 1;
	Integer end = 10;
}