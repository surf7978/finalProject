package com.company.comment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.comment.service.CommentService;
import com.company.comment.service.CommentVO;

@Service
public class CommentServiceimpl implements CommentService{
	
	@Autowired CommentMapper CommentMapper;
	//등록
	@Override
	public int insertComment(CommentVO vo) {
		return CommentMapper.insertComment(vo);
	}
	//단건조회
	@Override
	public CommentVO getComment(CommentVO vo) {
		return CommentMapper.getComment(vo);
	}
	//전체조회
	@Override
	public List<CommentVO> getSearchComment(CommentVO vo) {
		return CommentMapper.getSearchComment(vo);
	}
	//수정
	@Override
	public int updateComment(CommentVO vo) {
		return CommentMapper.updateComment(vo);
	}
	
	//탈퇴
	@Override
	public int deleteComment(CommentVO vo) {
		return CommentMapper.deleteComment(vo);
	}


}
