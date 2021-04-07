package com.company.board.service;

import java.util.List;

public interface BoardService {
	
	
	public BoardVO getBoard(BoardVO vo);	
	public List<BoardVO> getSearchBoard(BoardVO vo);	//구매내역 상세리스트
	public int updateBoard(BoardVO vo);	//환불하기
	public int deleteBoard(BoardVO vo);
	//--------------------------------
	public int insertBoard(BoardVO vo);	// 자유게시판 글쓰기
	public int insertBoard2(BoardVO vo); // 자랑하기 글쓰기
	public List<BoardVO> getSearchBoardCategiry1(BoardVO vo); // 자유게시판 전체조회
	public List<BoardVO> getSearchBoardCategiry2(BoardVO vo); // 자랑하기 전체조회
}
