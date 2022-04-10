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
		System.out.println("SelectKindsServlet����ѯ���з�����Ϣ");
		KindsDaoImpl dao = new KindsDaoImpl();
		ArrayList<Kinds> list = dao.selectKinds();
		
		//�ȱ��浽session
		HttpSession ses = request.getSession();
		ses.setAttribute("kindsList", list);
		
		//����ת
		response.sendRedirect("showKinds.jsp");
		
	}

}
