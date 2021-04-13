package com.company.integrated.service;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class IntegratedSearchVO extends IntegratedVO {
	String category1;//카테고리
	String[] searchLocation;//지역
	String search;//검색
	String searchValue;//검색값
	// paging
	Integer page = 1;
	Integer start = 1;
	Integer end = 10;
}
