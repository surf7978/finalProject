package com.company.question.service;

import java.util.List;

public interface QuestionService {
	public int insertQuestion(QuestionVO vo);	
	public int insertQuestion1(QuestionVO vo); 	//고객센터 문의내역 상품 문의 글등록.
	public int insertQuestion2(QuestionVO vo); 	//고객센터 문의내역 고객센터 문의 글등록.
	public int insertQuestion3(QuestionVO vo);	//고객센터 문의내역 신고하기 글등록.
	
	
	public QuestionVO getQuestion(QuestionVO vo);	//단건조회
	public QuestionVO getQuestion1(QuestionVO vo);	//문의하기항목 1번상품문의 문의 단건조회
	public QuestionVO getQuestion2(QuestionVO vo);	//문의하기항목 2번고객센터 문의 단건조회
	public QuestionVO getQuestion3(QuestionVO vo);	//문의하기항목 3번신고하기 단건조회
	
	
	public QuestionVO getQuestion1Ans(QuestionVO vo);	//문의하기항목1번1번상품문의 문의 단건조회-문의답장하기로 넘기기
	public QuestionVO getQuestion2Ans(QuestionVO vo);	//문의하기항목2번고객센터 문의 단건조회-문의답장하기로 넘기기
	public QuestionVO getQuestion3Ans(QuestionVO vo);	//문의하기항목 3번신고하기 단건조회-신고답장하기로 넘기기
	
	
	
	public List<QuestionVO> getSearchQuestion(QuestionVO vo);	//전체조회
	public List<QuestionVO> getSearchQuestionCr4(QuestionVO vo);	//전체조회 -Cr4(김찬영)
	public List<QuestionVO> getSearchQuestionSelect1(QuestionVO vo);	// 문의하기항목 전체조회. 1번상품문의
	public List<QuestionVO> getSearchQuestionSelect2(QuestionVO vo);	// 문의하기항목 전체조회. 2번고객센터문의
	public List<QuestionVO> getSearchQuestionSelect3(QuestionVO vo);	// 문의하기항목 전체조회. 3번신고하기
	
	
	public int updateQuestion(QuestionVO vo);	//회원수정
	public int deleteQuestion(QuestionVO vo);	//화원탈퇴

	
	
	public int getCount(QuestionVO vo); // DB레코드 카운트
	
	//나경
	public int insertQuestionBusi(QuestionVO vo);	//병원, 카페 등 상품 상세보기에서 상품문의글 등록
	public List<QuestionVO> getSearchQuestionProbis(QuestionVO vo);	//병원, 카페 등 상품 상세보기에서 상품문의글 리스트 조회
	public QuestionVO getQuestionProbis(QuestionVO vo);		//병원, 카페 등 상품 상세보기에서 상품문의글 단건조회
	
	public List<QuestionVO> getSearchQuestion99(QuestionVO vo);	//마이페이지-유저-문의내역
	
}
