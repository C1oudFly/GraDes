package main.priv.yunfei.analog.order.entity;

import java.util.List;

//数据封装实体类
public class OrderEntity {
	//x轴数据
	List<String> listXaxis ;
	//订单id
	List<String> oidData;
	//成功交易数据
	List<Integer> successData ;
	//失败订单数据
	List<Integer> refundData;
	//订单数据
	List<Integer> orderData;
	
	public List<String> getOidData() {
		return oidData;
	}
	public void setOidData(List<String> oidData) {
		this.oidData = oidData;
	}
	public List<String> getListXaxis() {
		return listXaxis;
	}
	public void setListXaxis(List<String> listXaxis) {
		this.listXaxis = listXaxis;
	}
	public List<Integer> getSuccessData() {
		return successData;
	}
	public void setSuccessData(List<Integer> successData) {
		this.successData = successData;
	}
	public List<Integer> getRefundData() {
		return refundData;
	}
	public void setRefundData(List<Integer> refundData) {
		this.refundData = refundData;
	}
	public List<Integer> getOrderData() {
		return orderData;
	}
	public void setOrderData(List<Integer> orderData) {
		this.orderData = orderData;
	}
	
}
