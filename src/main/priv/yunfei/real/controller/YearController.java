package main.priv.yunfei.real.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import main.priv.yunfei.dao.YearDao;
import main.priv.yunfei.real.year.entity.Year;
import main.priv.yunfei.real.year.entity.YearEntity;

@Controller
@RequestMapping(value="year")
public class YearController {
	@Resource
	YearDao yearDao;

	public YearDao getYearDao() {
		return yearDao;
	}

	public void setYearDao(YearDao yearDao) {
		this.yearDao = yearDao;
	}
	
	//用于映射“yearAmountList”的请求
	@ResponseBody
	@RequestMapping(value="yearAmountList")
	public void showYearAmountList(HttpServletResponse response){
		//定义实体类型，用于封装一定格式的数据
		YearEntity entity = null;
		//从数据库获取具体数据
		List<Year> yearAmountList = yearDao.getYearAmountList();
		//定义传输数据的格式
		List<HashMap<String, String>> yearAmountValue = new ArrayList<>();
		
		//通过遍历获取到的数据，暂存一定的数据格式
		for(Year y : yearAmountList){
			HashMap<String, String> hashMap = new HashMap<>();
			hashMap.put("name", y.getDate());
			hashMap.put("value", y.getAmount());
			yearAmountValue.add(hashMap);
		}
		
		//将数据封装到具体的实体类中
		entity = new YearEntity();
		entity.setYearMap(yearAmountValue);
		
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
