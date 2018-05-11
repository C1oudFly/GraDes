package main.priv.yunfei.analog.controller;

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

import main.priv.yunfei.analog.visitdepth.entity.VisitDepth;
import main.priv.yunfei.analog.visitdepth.entity.VisitDepthEntity;
import main.priv.yunfei.dao.VisitDepthDao;

@Controller
@RequestMapping(value="visitDepth")
public class VisitDepthController {
	@Resource
	VisitDepthDao visitDepthDao;

	public VisitDepthDao getVisitDepthDao() {
		return visitDepthDao;
	}

	public void setVisitDepthDao(VisitDepthDao visitDepthDao) {
		this.visitDepthDao = visitDepthDao;
	}
	
	//用于映射“visitDepthList”的请求
	@ResponseBody
	@RequestMapping(value="visitDepthList")
	public void showVisitDepthList(HttpServletResponse response){
		//从数据库获取具体数据
		List<VisitDepth> visitDepthList = visitDepthDao.getVisitDepthList();
		//X轴
		List<String> listXaxis = new ArrayList<>();
		//用户访问深度数据
		List<Integer> visitDepthData = new ArrayList<>();
		//用于暂存数据库中的数据
		HashMap<String, Integer> hashMap = new HashMap<>();
		
		//通过遍历获取到的数据，暂存一定的数据格式
		for(VisitDepth v: visitDepthList){
			if(hashMap.get(v.getDate()) == null){
				hashMap.put(v.getDate(), Integer.parseInt(v.getCount()));
			}else {
				hashMap.put(v.getDate(), hashMap.get(v.getDate())+Integer.parseInt(v.getCount()));
			}
		}
		
		for(String s : hashMap.keySet()){
			listXaxis.add(s);
			visitDepthData.add(hashMap.get(s));
		}
		
		//将数据封装到具体的实体类中
		VisitDepthEntity entity = new VisitDepthEntity();
		entity.setListXaxis(listXaxis);
		entity.setVisitDepthList(visitDepthData);
		
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
