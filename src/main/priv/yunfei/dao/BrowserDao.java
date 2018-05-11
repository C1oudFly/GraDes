package main.priv.yunfei.dao;

import java.util.List;

import main.priv.yunfei.analog.browser.entity.Browser;

//浏览器分析模块Dao接口
public interface BrowserDao {
	//浏览器分析模块获取数据的方法
	public List<Browser> getBrowserList(String sdate);
}
