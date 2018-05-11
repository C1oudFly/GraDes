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

import main.priv.yunfei.analog.user.entity.User;
import main.priv.yunfei.analog.user.entity.UserEntity;
import main.priv.yunfei.dao.UserDao;

@Controller
@RequestMapping(value="/user")
public class UserController 
{
	@Resource
	UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	//用于映射“userList”的请求
	@ResponseBody
	@RequestMapping(value="/userList")
	public void showOrderList(HttpServletResponse response )
	{
		//从数据库获取具体数据
		List<User> list=userDao.getUserList();
		//X轴
		List<String> listXaxis = new ArrayList<>();
		//新增用户
		List<Integer> adduserCount = new ArrayList<>();
		//活跃用户
		List<Integer> visitCount = new ArrayList<>();
		//总访客
		List<Integer> userCount = new ArrayList<>();
		
		//通过遍历获取到的数据，暂存一定的数据格式
		for (User user : list) {
			listXaxis.add(user.getDate());
			adduserCount.add(user.getAdduserCount());
			visitCount.add(user.getVisitCount());
			userCount.add(user.getUserCount());
		}
		
		//将数据封装到具体的实体类中
		UserEntity entity = new UserEntity();
		entity.setListXaxis(listXaxis);
		entity.setAdduserData(adduserCount);
		entity.setVisitData(visitCount);
		entity.setUserData(userCount);
		
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
	
	//用于映射“memberList”的请求
	@ResponseBody
	@RequestMapping(value="/memberList")
	public void showMemberList(HttpServletResponse response )
	{
		//从数据库获取具体数据
		List<User> list=userDao.getUserList();
		//X轴
		List<String> listXaxis = new ArrayList<>();
		//新增用户
		List<Integer> adduserCount = new ArrayList<>();
		//活跃用户
		List<Integer> visitCount = new ArrayList<>();
		//总访客
		List<Integer> userCount = new ArrayList<>();
		
		//通过遍历获取到的数据，暂存一定的数据格式
		for (User user : list) {
			listXaxis.add(user.getDate());
			adduserCount.add(user.getAddmemberCount());
			visitCount.add(user.getActiveCount());
			userCount.add(user.getMemberCount());
		}
		
		//将数据封装到具体的实体类中
		UserEntity entity = new UserEntity();
		entity.setListXaxis(listXaxis);
		entity.setAdduserData(adduserCount);
		entity.setVisitData(visitCount);
		entity.setUserData(userCount);
		
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
	
	//用于映射“sessionList”的请求
	@ResponseBody
	@RequestMapping(value="/sessionList")
	public void showSessionList(HttpServletResponse response )
	{
		//从数据库获取具体数据
		List<User> list=userDao.getUserList();
		//X轴
		List<String> listXaxis = new ArrayList<>();
		//新增用户
		List<Integer> adduserCount = new ArrayList<>();
		//活跃用户
		List<Integer> visitCount = new ArrayList<>();
		//总访客
		List<Integer> userCount = new ArrayList<>();
		
		//通过遍历获取到的数据，暂存一定的数据格式
		for (User user : list) {
			listXaxis.add(user.getDate());
			adduserCount.add(user.getSessionnumberCount());
			visitCount.add(user.getSessionlengthCount());
			userCount.add(user.getAveragesessionlength());
		}
		
		//将数据封装到具体的实体类中
		UserEntity entity = new UserEntity();
		entity.setListXaxis(listXaxis);
		entity.setAdduserData(adduserCount);
		entity.setVisitData(visitCount);
		entity.setUserData(userCount);
		
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
