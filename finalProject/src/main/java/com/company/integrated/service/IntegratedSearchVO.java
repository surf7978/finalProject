package com.company.integrated.service;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class IntegratedSearchVO extends IntegratedVO {
	String category1;
	String[] searchLocation;
	String search;
	String searchValue;
	// paging
	Integer page = 1;
	Integer start = 1;
	Integer end = 10;
}
