package main.priv.yunfei.analog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import main.priv.yunfei.analog.region.entity.Region;
import main.priv.yunfei.analog.region.entity.RegionEntity;
import main.priv.yunfei.dao.RegionDao;

@Controller
@RequestMapping(value="/region")
public class RegionController 
{
	@Resource
	RegionDao regiondao;
	
	public RegionDao getRegiondao() {
		return regiondao;
	}

	public void setRegiondao(RegionDao regiondao) {
		this.regiondao = regiondao;
	}

	//用于映射“regionList”的请求
	@ResponseBody
	@RequestMapping(value="/regionList")
	public void showOrderList(HttpServletResponse response,String sdate)
	{
		//定义实体类型，用于封装一定格式的数据
		RegionEntity entity = null;
		String s = null;
		//从数据库获取具体数据
		List<Region> list = regiondao.getRegionListBypro(sdate);
		//定义传输数据的格式
		List<HashMap<String, String>> regionValue = new ArrayList<>();
	
		int i = 0;
		//通过遍历获取到的数据，暂存一定的数据格式
		for (Region region2 : list) {
			HashMap<String, String> hashMap = new HashMap<>();
			if(region2.getRegion().startsWith("内蒙")){
				
				s = region2.getRegion().substring(0,3);
				hashMap.put("name" ,s);
				hashMap.put("value", Integer.toString(region2.getRegionCount()));
			
			}else if(region2.getRegion().length() > 1){
				s = region2.getRegion().substring(0,2);
				hashMap.put("name" ,s);
				hashMap.put("value", Integer.toString(region2.getRegionCount()));
			}
			regionValue.add(hashMap);
		}
		
		//将数据封装到具体的实体类中
		entity = new RegionEntity();
		entity.setRegionMap(regionValue);
		
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
	
	/**  跳出率模块的分析，数据量过少，不便于页面的展示。
	//用于映射“regionjumpList”的请求
	@ResponseBody
	@RequestMapping(value="/regionjumpList")
	public void showjumpList(HttpServletResponse response,String sdate){
		//定义实体类型，用于封装一定格式的数据
		RegionEntity entity = null;
		String s = null;
		//从数据库获取具体数据	
		List<Region> list = regiondao.getRegionListBypro(sdate);
		//定义传输数据的格式
		List<HashMap<String, String>> jumpValue = new ArrayList<>();
		
		int i = 0;
		//通过遍历获取到的数据，暂存一定的数据格式
		for (Region region2 : list) {
			HashMap<String, String> hashMap = new LinkedHashMap<>();
			if(region2.getRegion().startsWith("内蒙")){
				
				s = region2.getRegion().substring(0,3);
				hashMap.put("value", Double.toString(region2.getJumpRate()));
				hashMap.put("name" ,s);
			
			}else if(region2.getRegion().length() > 1){
				s = region2.getRegion().substring(0,2);
				hashMap.put("value", Double.toString(region2.getJumpRate()));
				hashMap.put("name" ,s);
			}
			jumpValue.add(hashMap);
		}
		
		//将数据封装到具体的实体类中
		entity = new RegionEntity();
		entity.setRegionMap(jumpValue);
		
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
	**/
}