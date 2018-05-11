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

import main.priv.yunfei.dao.HousingDao;
import main.priv.yunfei.real.housing.entity.Housing;
import main.priv.yunfei.real.housing.entity.HousingEntity;

@Controller
@RequestMapping(value="housing")
public class HousingController {
	@Resource
	HousingDao housingDao;

	public HousingDao getHousingDao() {
		return housingDao;
	}

	public void setHousingDao(HousingDao housingDao) {
		this.housingDao = housingDao;
	}
	
	//用于映射“housingList”的请求
	@ResponseBody
	@RequestMapping(value="housingList")
	public void showHoingList(HttpServletResponse response){
		//定义实体类型，用于封装一定格式的数据
		HousingEntity entity = null;
		//从数据库获取具体数据
		List<Housing> housingList = housingDao.getHousingList();
		//定义传输数据的格式
		List<HashMap<String, String>> housingValue = new ArrayList<>();
		
		//通过遍历获取到的数据，暂存一定的数据格式
		for(Housing h : housingList){
			HashMap<String, String> hashMap = new HashMap<>();
			hashMap.put("name", h.getHousing());
			hashMap.put("value", h.getCount());
			housingValue.add(hashMap);
		}
		
		//将数据封装到具体的实体类中
		entity = new HousingEntity();
		entity.setHousingMap(housingValue);
		
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
