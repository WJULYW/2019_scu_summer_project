package com.chinasoft.news.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.chinasoft.news.dao.IKindsDao;
import com.chinasoft.news.db.DB;
import com.chinasoft.news.po.Kinds;

public class KindsDaoImpl implements IKindsDao {
	private DB db;
	
	public KindsDaoImpl() {
		this.db=new DB();
	}

	@Override  //添加新类型 OK
	public boolean addKind(String kind) {
		String sql="insert into kinds values(null,'"+kind+"')";
		if(db.update(sql)==1){
			return true;
		}
		return false;
	}

	@Override //删除分类  OK
	public boolean deleteKind(int kid) {
		String sql="delete from kinds where kid="+kid+"";
		if(db.update(sql)==1){
			return true;
		}
		return false;
	}

	@Override //根据编号查询名称 OK
	public String getKname(int kid) {
		String sql="select kname from kinds where kid="+kid+"";
		ResultSet rs = db.query(sql);
		try {
			if(rs.next()){
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override  //根据编号查询对象 OK
	public Kinds getKinds(int kid) {
		String sql="select * from kinds where kid="+kid+"";
		ResultSet rs = db.query(sql);
		try {
			if(rs.next()){				
				Kinds kind = new Kinds(kid, rs.getString(2));
				return kind;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override  //查询所有 OK
	public ArrayList<Kinds> selectKinds() {
		String sql="select * from kinds";
		ResultSet rs = db.query(sql);
		ArrayList<Kinds> list = new ArrayList<>();
		try {
			while(rs.next()){				
				Kinds kind = new Kinds(rs.getInt(1), rs.getString(2));
				list.add(kind);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		//单页测试：在本页调用所有的方法，并提供需要的参数
		KindsDaoImpl dao = new KindsDaoImpl();
		//dao.addKind("高校");
		//dao.deleteKind(13);
		/*String kname = dao.getKname(11);
		System.out.println(kname);*/
		
		/*Kinds kind = dao.getKinds(11);
		System.out.println(kind.getKid()+" "+kind.getKname());*/
		
		/*ArrayList<Kinds> list = dao.selectKinds();
		for (Kinds kind : list) {
			System.out.println(kind.getKid()+" "+kind.getKname());
		}*/
		
	}
	
}
