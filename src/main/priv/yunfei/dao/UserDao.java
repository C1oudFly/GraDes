package main.priv.yunfei.dao;

import java.util.List;

import main.priv.yunfei.analog.user.entity.User;

//用户分析模块Dao接口
public interface UserDao {
	//用户分析模块获取数据方法
	public List<User> getUserList();
}
