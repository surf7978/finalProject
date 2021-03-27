package com.company.eventAndNotice.service.impl;

import java.util.List;

import com.company.eventAndNotice.service.EventAndNoticeVO;

public interface EventAndNoticeMapper {
	public int insertMember(EventAndNoticeVO vo);
	public EventAndNoticeVO getMember(EventAndNoticeVO vo);
	public List<EventAndNoticeVO> getSearchMember(EventAndNoticeVO vo);
	public int updateMember(EventAndNoticeVO vo);
	public int deleteMember(EventAndNoticeVO vo);
}
