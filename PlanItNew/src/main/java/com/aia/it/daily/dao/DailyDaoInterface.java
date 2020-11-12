package com.aia.it.daily.dao;

import java.util.List;

import com.aia.it.daily.model.Daily;
import com.aia.it.daily.model.DailyOrderEditForm;

public interface DailyDaoInterface {
	
	public int insertDaily(Daily daily);
	//pidx조인해서 뽑기
	public int totalCnt(int pidx);

	public List<Daily> selectTotalList(int pidx);

	public int editDailyOrder(DailyOrderEditForm editDailyOrder);

	public int deleteDailyByIdx(int didx);

	public int editDaily(Daily daily);

	public Daily selectByIdx(int didx);
	
	
}
