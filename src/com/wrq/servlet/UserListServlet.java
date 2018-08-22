package com.wrq.servlet;


import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java_cup.internal.internal_error;
import com.wrq.model.User;
import com.wrq.service.UserService;
import com.wrq.utils.JdbcUtils;
import com.wrq.utils.PageBean;

public class UserListServlet extends HttpServlet {
	UserService userService = new UserService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int pages = 1;
		int records = 5;
		
		if (request.getParameter("pages")!=null) 
		{
			pages = Integer.parseInt(request.getParameter("pages"));
		}
		 
		User user = new User();
		String account = request.getParameter("account");
		String user_name = request.getParameter("user_name");
		if(account!=null&&account!=""){
			user.setAccount(account);
			request.setAttribute("account", account);
		}
		if(user_name!=null&&user_name!=""){
			user.setUser_name(user_name);
			request.setAttribute("user_name", user_name);
		}
		try {
			List<Map<String, Object>> userList = userService.userList(request, user, pages, records);
			request.setAttribute("userList",userList);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
		request.getRequestDispatcher("userList.jsp").forward(request, response);
	}

}
