package main.priv.yunfei.analog.visitdepth.entity;

import java.util.List;

//数据封装实体类
public class VisitDepthEntity {
	//x轴数据
	List<String> listXaxis;
	//访问深度数据
	private List<Integer> visitDepthList;
	
	public List<String> getListXaxis() {
		return listXaxis;
	}
	public void setListXaxis(List<String> listXaxis) {
		this.listXaxis = listXaxis;
	}
	public List<Integer> getVisitDepthList() {
		return visitDepthList;
	}
	public void setVisitDepthList(List<Integer> visitDepthList) {
		this.visitDepthList = visitDepthList;
	}
	
	
}
