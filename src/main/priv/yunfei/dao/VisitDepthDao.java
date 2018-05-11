package main.priv.yunfei.dao;

import java.util.List;

import main.priv.yunfei.analog.visitdepth.entity.VisitDepth;

//用户访问深度分析模块Dao接口
public interface VisitDepthDao {
	//用户访问深度分析模块获取数据的方法
	public List<VisitDepth> getVisitDepthList();
}
