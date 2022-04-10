package com.chinasoft.news.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.news.dao.impl.KindsDaoImpl;

public class AddKindServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AddKindServlet：添加分类信息");
		request.setCharacterEncoding("utf-8");
		String kname =request.getParameter("kname");
		KindsDaoImpl dao = new KindsDaoImpl();
		if(dao.addKind(kname)){
			response.sendRedirect("SelectKindsServlet");
		}else{
			response.sendRedirect("addKind.jsp");
		}
	}

}
