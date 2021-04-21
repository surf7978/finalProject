package com.company.eventAndNotice.service;

import lombok.Data;

@Data
public class EventAndNoticeSearchVO extends EventAndNoticeVO {
	String search;
	String searchValue;
	// paging
	Integer page = 1;  
	Integer start = 1;
	Integer end = 10;
	String[] categoryList;
}
