package com.company.question.service;

import lombok.Data;

@Data
public class QuestionVO {
	String questionNumber;
	String title;
	String calendar;
	String content;
	String writer;
	String fromPerson;
	String category;
	String memberId;

}
