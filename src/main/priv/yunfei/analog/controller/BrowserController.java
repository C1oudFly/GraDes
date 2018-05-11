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

import main.priv.yunfei.analog.browser.entity.Browser;
import main.priv.yunfei.analog.browser.entity.BrowserEntity;
import main.priv.yunfei.dao.BrowserDao;

@Controller
@RequestMapping(value="/browser")
public class BrowserController 
{
	@Resource
	BrowserDao browserDao;

	public BrowserDao getBrowserDao() {
		return browserDao;
	}

	public void setBrowserDao(BrowserDao browserDao) {
		this.browserDao = browserDao;
	}

	//用于映射“browseruserList”的请求
	@ResponseBody
	@RequestMapping(value="/browseruserList")
	public void showOrderList(HttpServletResponse response ,String sdate)
	{
		//从数据库获取具体数据
		List<Browser> list= browserDao.getBrowserList(sdate);
		//X轴
		List<String> browserList = new ArrayList<>();
		//新增用户
		List<Integer> adduserCount = new ArrayList<>();
		//活跃用户
		List<Integer> visitCount = new ArrayList<>();
		//总访客
		List<Integer> userCount = new ArrayList<>();
	
		//通过遍历获取到的数据，暂存一定的数据格式
		for (Browser browser : list) {
			browserList.add(browser.getBrowser());
			adduserCount.add(browser.getAdduserCount());
			visitCount.add(browser.getVisitCount());
			userCount.add(browser.getUserCount());
		}
		
		//定义实体类型，用于封装一定格式的数据
		BrowserEntity entity = new BrowserEntity();
		entity.setBrowserData(browserList);
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
	
	//用于映射“browsermemberList”的请求
	@ResponseBody
	@RequestMapping(value="/browsermemberList")
	public void showMemberList(HttpServletResponse response ,String sdate)
	{
		//从数据库获取具体数据
		List<Browser> list= browserDao.getBrowserList(sdate);
		//X轴
		List<String> browserList = new ArrayList<>();
		//新增用户
		List<Integer> adduserCount = new ArrayList<>();
		//活跃用户
		List<Integer> visitCount = new ArrayList<>();
		//总访客
		List<Integer> userCount = new ArrayList<>();
	
		//通过遍历获取到的数据，暂存一定的数据格式
		for (Browser browser : list) {
			browserList.add(browser.getBrowser());
			adduserCount.add(browser.getAddmemberCount());
			visitCount.add(browser.getActiveCount());
			userCount.add(browser.getMemberCount());
		}
		
		//将数据封装到具体的实体类中
		BrowserEntity entity = new BrowserEntity();
		entity.setBrowserData(browserList);
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
	
	//用于映射“browsersessionList”的请求
	@ResponseBody
	@RequestMapping(value="/browsersessionList")
	public void showSessionList(HttpServletResponse response,String sdate)
	{
		//从数据库获取具体数据
		List<Browser> list= browserDao.getBrowserList(sdate);
		//X轴
		List<String> browserList = new ArrayList<>();
		//新增用户
		List<Integer> adduserCount = new ArrayList<>();
		//活跃用户
		List<Integer> visitCount = new ArrayList<>();
		//总访客
		List<Integer> userCount = new ArrayList<>();
	
		//通过遍历获取到的数据，暂存一定的数据格式
		for (Browser browser : list) {
			browserList.add(browser.getBrowser());
			adduserCount.add(browser.getSessionnumberCount());
			visitCount.add(browser.getSessionlengthdvalue());
			userCount.add(browser.getAveragesessionlength());
		}
		
		//将数据封装到具体的实体类中
		BrowserEntity entity = new BrowserEntity();
		entity.setBrowserData(browserList);
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
	
	//用于映射“browserpvList”的请求
	@ResponseBody
	@RequestMapping(value="/browserpvList")
	public void showPvList(HttpServletResponse response,String sdate)
	{
		//从数据库获取具体数据
		List<Browser> list= browserDao.getBrowserList(sdate);
		//X轴
		List<String> browserList = new ArrayList<>();
		//新增用户
		List<Integer> adduserCount = new ArrayList<>();
		//活跃用户
		List<Integer> visitCount = new ArrayList<>();
		//总访客
		List<Integer> userCount = new ArrayList<>();
		
		//通过遍历获取到的数据，暂存一定的数据格式
		for (Browser browser : list) {
			browserList.add(browser.getBrowser());
			adduserCount.add(browser.getBrowserPv());
		}
		
		//将数据封装到具体的实体类中
		BrowserEntity entity = new BrowserEntity();
		entity.setBrowserData(browserList);
		entity.setAdduserData(adduserCount);
		
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
