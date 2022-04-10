package com.chinasoft.news.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chinasoft.news.dao.impl.KindsDaoImpl;

public class DelKindServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DelKindServlet£º¸ù¾Ý±àºÅÉ¾³ý");
		KindsDaoImpl dao = new KindsDaoImpl();
		int kid = Integer.parseInt(request.getParameter("kid"));
		//HttpSession ses = request.getSession();
		if(dao.deleteKind(kid)){
			response.sendRedirect("SelectKindsServlet");
		}
	}

}
