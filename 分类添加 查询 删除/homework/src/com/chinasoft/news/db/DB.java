package com.chinasoft.news.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//当前类作用：可以自动连接，并完成任何表的CRUD 通过调用当前类的方法并发送sql即可
public class DB {
	private Connection conn;

	//在构造方法中，完成连接
	public DB() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/news?useUnicode=true&characterEncoding=utf-8";
			this.conn = DriverManager.getConnection(url,"root","1");
			//System.out.println(this.conn.isClosed());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//执行增删改
	public int update(String sql){
		System.out.println("sql: "+sql);
		try {
			Statement stmt = this.conn.createStatement();
			return stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//执行查询
	public ResultSet query(String sql){
		System.out.println("sql: "+sql);
		try {
			Statement stmt = this.conn.createStatement();
			return stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		DB db = new DB();		
	}
	
}
