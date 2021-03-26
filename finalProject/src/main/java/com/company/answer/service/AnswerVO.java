package com.company.answer.service;

import lombok.Data;

@Data
public class AnswerVO {
	
	String answerNumber;
	String writer;
	String content;
	String calender;
	String memberId;
	String questionNumber;
}
