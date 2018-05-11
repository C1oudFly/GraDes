package main.priv.yunfei.dao;

import java.util.List;

import main.priv.yunfei.real.year.entity.Year;

//年成交额分析模块Dao接口
public interface YearDao {
	//年成交额分析模块获取数据的方法
	public List<Year> getYearAmountList();
}
