package com.company.note.service.impl;

import java.util.List;

import com.company.note.service.NoteVO;

public interface NoteMapper {
	public int insertNote(NoteVO vo);
	public NoteVO getNote(NoteVO vo);
	public List<NoteVO> getSearchNote(NoteVO vo);
	public int updateNote(NoteVO vo);
	public int deleteNote(NoteVO vo);
	public NoteVO getNoteCount(NoteVO vo);	//의료내역 건수 & 합계 출력
	public int deleteAnimalNote(NoteVO vo); //반려동물 삭제시 의료수첩리스트 삭제
}
