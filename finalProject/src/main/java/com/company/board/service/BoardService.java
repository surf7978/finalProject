package com.company.board.service;

import java.util.List;

public interface BoardService {
	
	
	public int insertBoardCr4(BoardVO vo);	
	public BoardVO getBoard(BoardVO vo);	
	public List<BoardVO> getSearchBoard(BoardVO vo);	//구매내역 상세리스트
	public int updateBoard(BoardVO vo);	//환불하기
	public int deleteBoard(BoardVO vo);
	public int insertBoard(BoardVO vo);	
}
