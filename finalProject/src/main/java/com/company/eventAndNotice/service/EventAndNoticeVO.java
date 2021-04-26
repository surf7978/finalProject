
package com.company.eventAndNotice.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventAndNoticeVO{
	String eanNumber;
	String writer;
	String title;
	String content;
	String startDate;
	String endDate;
	String image =" ";
	String t_image =" ";
	String views;
	String category;
	String memberId;
	MultipartFile[] uploadFile;
	MultipartFile t_uploadFile;
	

}
