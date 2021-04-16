package com.company.question.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QuestionVO {
	String questionNumber;
	String title;
	String calendar;
	String content;
	String writer;
	String toPerson;
	String category;
	String memberId;
	String businessId;	//insertQuestionBusi쿼리용으로 추가
	String probisNumber;	//제품번호별 문의글 리스트출력하기위해 추가
	String image;
	MultipartFile uploadFile;
}
