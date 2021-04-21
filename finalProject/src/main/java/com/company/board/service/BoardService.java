package com.company.board.service;

import java.util.List;

import com.company.common.PagingVOCr4;



public interface BoardService {
	
	

	
	
	
	public BoardVO getBoard(BoardVO vo);
	public BoardVO getBoard2(BoardVO vo);
	
	public List<BoardVO> getSearchBoard(BoardVO vo);	//구매내역 상세리스트
	public int updateBoard(BoardVO vo);
	public int updateBoard2(BoardVO vo);

	public int deleteBoard(BoardVO vo);
	//카테고리별 리스트 출력
	public List<BoardVO> getSearchBoardCategiry1(PagingVOCr4 vo);	
	public List<BoardVO> getSearchBoardCategiry2(BoardVO vo);	
	public int getCount(BoardVO vo);// 레코드 조회
	// 게시물 총 갯수
	public int countBoard();
	
	public int insertBoard2(BoardVO vo);	
	public int insertBoard(BoardVO vo);
	
	public List<BoardVO> getSearchBoardCategory199(BoardVO vo); //일반사용자 내가쓴글 조회
	
	// 조회수 +1
	public int updateViews(BoardVO vo);
	
}
