package main.priv.yunfei.dao;

import java.util.List;

import main.priv.yunfei.analog.region.entity.Region;

//地域分析模块Dao接口
public interface RegionDao {
	//地域分析模块获取数据的方法
	public List<Region> getRegionList();
	//地域分析模块通过页面传入日期来获取数据的方法
	public List<Region> getRegionListBypro(String sdate);
}
