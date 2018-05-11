package main.priv.yunfei.real.housing.entity;

import java.util.HashMap;
import java.util.List;

//数据封装实体类
public class HousingEntity {
	//用于给前台页面传送数据封装的数据格式
	private List<HashMap<String, String>> housingMap;
	
	public List<HashMap<String, String>> getHousingMap() {
		return housingMap;
	}

	public void setHousingMap(List<HashMap<String, String>> housingMap) {
		this.housingMap = housingMap;
	}
	
}
