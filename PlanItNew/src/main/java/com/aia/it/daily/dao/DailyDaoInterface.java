package com.aia.it.daily.dao;

import java.util.List;

import com.aia.it.daily.model.Daily;

public interface DailyDaoInterface {
	
	public int insertDaily(Daily daily);

	//pidx조인해서 뽑기
	public int totalCnt(int pidx);

	public List<Daily> selectTotalList(int pidx);


}
