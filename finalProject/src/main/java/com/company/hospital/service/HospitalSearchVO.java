package com.company.hospital.service;

import lombok.Data;

@Data
public class HospitalSearchVO extends HospitalVO {
	String search;
	String searchValue;
	// paging
	Integer page = 1;  
	Integer start = 1;
	Integer end = 10;
	String[] categoryList;
}
