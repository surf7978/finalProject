package com.company.note.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.note.service.NoteService;
import com.company.note.service.NoteVO;

@Service
public class NoteServiceimpl implements NoteService{
	
	@Autowired NoteMapper NoteMapper;
	//등록
	@Override
	public int insertNote(NoteVO vo) {
		return NoteMapper.insertNote(vo);
	}
	//단건조회
	@Override
	public NoteVO getNote(NoteVO vo) {
		return NoteMapper.getNote(vo);
	}
	//전체조회
	@Override
	public List<NoteVO> getSearchNote(NoteVO vo) {
		return NoteMapper.getSearchNote(vo);
	}
	//수정
	@Override
	public int updateNote(NoteVO vo) {
		return NoteMapper.updateNote(vo);
	}
	
	//탈퇴
	@Override
	public int deleteNote(NoteVO vo) {
		return NoteMapper.deleteNote(vo);
	}


}
