package main.priv.yunfei.dao;

import java.util.List;

import main.priv.yunfei.analog.order.entity.Order;

//订单分析模块Dao接口
public interface OrderDao {
	//订单分析模块获取数据的方法
	public List<Order> getOrdreList();
}
