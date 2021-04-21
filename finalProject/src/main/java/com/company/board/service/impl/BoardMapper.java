
package com.company.board.service.impl;

import java.util.List;

import com.company.board.service.BoardVO;
import com.company.common.PagingVOCr4;
import com.company.eventAndNotice.service.EventAndNoticeVO;


public interface BoardMapper {
	
	
	public BoardVO getBoard(BoardVO vo);
	public BoardVO getBoard2(BoardVO vo);
	
	
	public List<BoardVO> getSearchBoard(BoardVO vo);	//구매내역 상세리스트
	public int updateBoard(BoardVO vo);	
	public int updateBoard2(BoardVO vo);
	public int deleteBoard(BoardVO vo);
	//--------------------------------
	public int insertBoard(BoardVO vo);	// 자유게시판 글쓰기
	public int insertBoard2(BoardVO vo); // 자랑하기 글쓰기
	public List<BoardVO> getSearchBoardCategiry1(PagingVOCr4 vo); // 자유게시판 전체조회
	public List<BoardVO> getSearchBoardCategiry2(BoardVO vo); // 자랑하기 전체조회
	public int getCount(BoardVO vo);// 레코드 조회
	// 게시물 총 갯수
	public int countBoard();
	public List<BoardVO> getSearchBoardCategory199(BoardVO vo); //일반사용자 내가쓴글 조회
	
	// 조회수 +1
	public int updateViews(BoardVO vo);
	
}

