package com.company.note.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.note.service.NoteService;
import com.company.note.service.NoteVO;

@Service
public class NoteServiceimpl implements NoteService{
	
	@Autowired NoteMapper noteMapper;
	//의료내역 등록
	@Override
	public int insertNote(NoteVO vo) {
		return noteMapper.insertNote(vo);
	}
	//의료내역 단건조회
	@Override
	public NoteVO getNote(NoteVO vo) {
		return noteMapper.getNote(vo);
	}
	//의료내역 전체조회
	@Override
	public List<NoteVO> getSearchNote(NoteVO vo) {
		return noteMapper.getSearchNote(vo);
	}
	//의료내역 수정
	@Override
	public int updateNote(NoteVO vo) {
		return noteMapper.updateNote(vo);
	}
	
	//의료내역 삭제
	@Override
	public int deleteNote(NoteVO vo) {
		return noteMapper.deleteNote(vo);
	}


}
