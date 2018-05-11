package main.priv.yunfei.analog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import main.priv.yunfei.analog.order.entity.Order;
import main.priv.yunfei.analog.order.entity.OrderEntity;
import main.priv.yunfei.dao.OrderDao;


@Controller
@RequestMapping(value="/order")
public class OrderController 
{
	@Resource
	OrderDao orderDao;
	
	public OrderDao getOrderDao() {
		return orderDao;
	}
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	//用于映射“orderList”的请求
	@ResponseBody
	@RequestMapping(value="/orderList")
	public void showOrderList(HttpServletResponse response )
	{
		//从数据库获取具体数据
		List<Order> list=orderDao.getOrdreList();
		//X轴
		List<String> listXaxis = new ArrayList<>();
		//订单ID
		List<String> oidID = new ArrayList<>();
		//成功订单数
		List<Integer> successCount = new ArrayList<>();
		//退单数
		List<Integer> refundCount = new ArrayList<>();
		//订单金额总数
		List<Integer> orderCount = new ArrayList<>();
		
		//通过遍历获取到的数据，暂存一定的数据格式
		for (Order order : list) {
			listXaxis.add(order.getDate());
			oidID.add(order.getOid());
			successCount.add(order.getSuccessCount());
			refundCount.add(order.getRefundCount());
			orderCount.add(order.getOrderCount());
		}
		
		//定义实体类型，用于封装一定格式的数据
		OrderEntity entity = new OrderEntity();
		entity.setListXaxis(listXaxis);
		entity.setOidData(oidID);
		entity.setSuccessData(successCount);
		entity.setRefundData(refundCount);
		entity.setOrderData(orderCount);
		
		//定义Gson格式数据
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(entity);
		
		try {
			System.out.println(json);
			response.setContentType("json/application;charset=UTF-8");
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
