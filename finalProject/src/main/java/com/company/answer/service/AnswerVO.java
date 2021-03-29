package com.company.answer.service;

import lombok.Data;

@Data
public class AnswerVO {
	private String answerNumber;// 답변번호
	private String writer;// 작성자
	private String content;// 내용
	private String calendar;// 날짜
	private String memberId;// 아이디
	private String questionNumber;// 문의번호

}