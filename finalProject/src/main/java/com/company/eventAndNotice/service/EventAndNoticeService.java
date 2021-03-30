package com.company.eventAndNotice.service;

import java.util.List;

public interface EventAndNoticeService {
	public int insertEventAndNotice(EventAndNoticeVO vo);	//화원탈퇴
	public EventAndNoticeVO getEventAndNotice(EventAndNoticeVO vo);	//단건조회
	public List<EventAndNoticeVO> getSearchEventAndNotice(EventAndNoticeVO vo);	//전체조회
	public int updateEventAndNotice(EventAndNoticeVO vo);	//회원수정
	public int deleteEventAndNotice(EventAndNoticeVO vo);	//화원탈퇴
}
