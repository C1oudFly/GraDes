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

import main.priv.yunfei.dao.TypeDao;
import main.priv.yunfei.real.type.entity.Type;
import main.priv.yunfei.real.type.entity.TypeEntity;

@Controller
@RequestMapping(value="/type")
public class TypeController {
	@Resource
	TypeDao typeDao;

	public TypeDao getTypeDao() {
		return typeDao;
	}

	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}
	
	//用于映射“typeList”的请求
	@ResponseBody
	@RequestMapping(value="typeList")
	public void showTypeList(HttpServletResponse response){
		//定义实体类型，用于封装一定格式的数据
		TypeEntity entity = null;
		//从数据库获取具体数据
		List<Type> typeList = typeDao.getTypeList();
		//定义传输数据的格式
		List<HashMap<String, String>> typeValue = new ArrayList<>();
		
		//通过遍历获取到的数据，暂存一定的数据格式
		for(Type t : typeList){
			HashMap<String, String> hashMap = new HashMap<>();
			hashMap.put("name", t.getType());
			hashMap.put("value", t.getCount());
			typeValue.add(hashMap);
		}
		
		//将数据封装到具体的实体类中
		entity = new TypeEntity();
		entity.setTypeMap(typeValue);
		
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
