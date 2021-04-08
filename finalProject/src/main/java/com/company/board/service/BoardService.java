package com.company.board.service;

import java.util.List;

public interface BoardService {
	
	

	
	
	
	public BoardVO getBoard(BoardVO vo);
	
	
	public List<BoardVO> getSearchBoard(BoardVO vo);	//구매내역 상세리스트
	public int updateBoard(BoardVO vo);	//환불하기

	public int deleteBoard(BoardVO vo);
	//카테고리별 리스트 출력
	public List<BoardVO> getSearchBoardCategiry1(BoardVO vo);	
	public List<BoardVO> getSearchBoardCategiry2(BoardVO vo);	
	public int insertBoard2(BoardVO vo);	
	public int insertBoard(BoardVO vo);
}
