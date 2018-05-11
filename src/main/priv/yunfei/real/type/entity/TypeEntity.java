package main.priv.yunfei.real.type.entity;

import java.util.HashMap;
import java.util.List;

//数据封装实体类
public class TypeEntity {
	//用于给前台页面传送数据封装的数据格式
	private List<HashMap<String, String>> typeMap;
	
	public List<HashMap<String, String>> getTypeMap() {
		return typeMap;
	}
	public void setTypeMap(List<HashMap<String, String>> typeMap) {
		this.typeMap = typeMap;
	}
	
}
