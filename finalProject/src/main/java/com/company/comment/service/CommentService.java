package com.company.comment.service;

import java.util.List;

public interface CommentService {
	public int insertComment(CommentVO vo);	//화원탈퇴
	public CommentVO getComment(CommentVO vo);	//단건조회
	public List<CommentVO> getSearchComment(CommentVO vo);	//전체조회
	public int updateComment(CommentVO vo);	//회원수정
	public int deleteComment(CommentVO vo);	//화원탈퇴
}
