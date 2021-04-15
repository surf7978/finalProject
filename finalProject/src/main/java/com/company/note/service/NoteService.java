package com.company.note.service;

import java.util.List;

public interface NoteService {
	public int insertNote(NoteVO vo);	//의료내역 등록
	public NoteVO getNote(NoteVO vo);	//단건조회
	public List<NoteVO> getSearchNote(NoteVO vo);	//의료내역 전체조회
	public int updateNote(NoteVO vo);	//의료내역 수정
	public int deleteNote(NoteVO vo);	//의료내역 삭제
	public NoteVO getNoteCount(NoteVO vo);	//의료내역 건수 & 합계 출력
}
