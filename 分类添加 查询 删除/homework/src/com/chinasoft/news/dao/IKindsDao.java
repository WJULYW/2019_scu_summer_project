package com.chinasoft.news.dao;

import java.util.ArrayList;

import com.chinasoft.news.po.Kinds;

public interface IKindsDao {
	//声明这个表所有需要执行的方法(sql语句)
	public boolean addKind(String kind);
	public boolean deleteKind(int kid);
	
	//根据kid查询kname
	public String getKname(int kid);
	//根据编号查询一行
	public Kinds getKinds(int kid);
	//查询所有分类
	public ArrayList<Kinds> selectKinds();
	
}
