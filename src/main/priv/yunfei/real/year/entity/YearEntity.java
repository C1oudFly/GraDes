package main.priv.yunfei.real.year.entity;

import java.util.HashMap;
import java.util.List;

//数据封装实体类
public class YearEntity {
	//用于给前台页面传送数据封装的数据格式
	private List<HashMap<String, String>> yearAmountMap;

	public List<HashMap<String, String>> getYearAmountMap() {
		return yearAmountMap;
	}

	public void setYearMap(List<HashMap<String, String>> yearAmountMap) {
		this.yearAmountMap = yearAmountMap;
	}
	

}
