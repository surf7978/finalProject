package com.company.question.service;

import lombok.Data;

@Data
public class QuestionVO {
	private String questionNumber;
	private String title;
	private String calender;
	private String content;
	private String writer;
	private String toPerson;
	private String category;
	private String memberId;
	// paging
	Integer page = 1;
	Integer start = 1;
	Integer end = 10;
}
