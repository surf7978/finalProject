
package com.company.bCart.service.impl;

import java.util.List;

import com.company.bCart.service.BCartVO;

public interface BCartMapper {
	public int insertBCart(BCartVO vo);

	public BCartVO getBCart(BCartVO vo);

	public List<BCartVO> getSearchBCart(BCartVO vo);

	public int updateBCart(BCartVO vo);

	public int deleteBCart(BCartVO vo);
}
