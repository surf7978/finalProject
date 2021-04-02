
package com.company.eventAndNotice.service;

import lombok.Data;

@Data
public class EventAndNoticeVO{
	String eanNumber;
	String writer;
	String title;
	String content;
	String startDate;
	String endDate;
	String image;
	String views;
	String category;
	String memberId;


}
