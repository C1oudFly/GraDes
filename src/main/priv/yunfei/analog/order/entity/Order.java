package main.priv.yunfei.analog.order.entity;

//数据实体类
public class Order {
	private String date;
	private String oid;
	private int successCount;
	private int refundCount;
	private int orderNumber;
	private int orderCount;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getSuccessCount() {
		return successCount;
	}
	public void setSuccessCount(int successCount) {
		this.successCount = successCount;
	}
	public int getRefundCount() {
		return refundCount;
	}
	public void setRefundCount(int refundCount) {
		this.refundCount = refundCount;
	}
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	
}
