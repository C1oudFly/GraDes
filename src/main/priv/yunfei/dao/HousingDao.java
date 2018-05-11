package main.priv.yunfei.dao;

import java.util.List;

import main.priv.yunfei.real.housing.entity.Housing;

//房屋用途分析模块Dao接口
public interface HousingDao {
	//房屋用途分析模块获取数据的方法
	public List<Housing> getHousingList();
}
