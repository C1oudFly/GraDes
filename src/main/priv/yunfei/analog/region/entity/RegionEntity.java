package main.priv.yunfei.analog.region.entity;

import java.util.HashMap;
import java.util.List;

//数据封装实体类
public class RegionEntity {
	//用于给前台页面传送数据封装的数据格式
	List<HashMap<String, String>> regionMap;
	
	public List<HashMap<String, String>> getRegionMap() {
		return regionMap;
	}
	public void setRegionMap(List<HashMap<String, String>> regionMap) {
		this.regionMap = regionMap;
	}
}
