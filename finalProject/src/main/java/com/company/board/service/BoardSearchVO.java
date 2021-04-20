package com.company.board.service;

import lombok.Data;

@Data
public class BoardSearchVO extends BoardVO {
	String search;
	String searchValue;
	// paging
	Integer page = 1;  
	Integer start = 1;
	Integer end = 10;
	String[] categoryList;
}
