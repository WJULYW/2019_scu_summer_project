package com.chinasoft.news.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chinasoft.news.dao.impl.KindsDaoImpl;
import com.chinasoft.news.po.Kinds;

public class SelectKindsServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SelectKindsServlet：查询所有分类信息");
		KindsDaoImpl dao = new KindsDaoImpl();
		ArrayList<Kinds> list = dao.selectKinds();
		
		//先保存到session
		HttpSession ses = request.getSession();
		ses.setAttribute("kindsList", list);
		
		//再跳转
		response.sendRedirect("showKinds.jsp");
		
	}

}
