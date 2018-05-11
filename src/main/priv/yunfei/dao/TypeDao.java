package main.priv.yunfei.dao;

import java.util.List;

import main.priv.yunfei.real.type.entity.Type;

//房屋户型分析模块Dao接口
public interface TypeDao {
	//房屋户型分析模块获取数据的方法
	public List<Type> getTypeList();
}
