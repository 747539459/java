package com.wrq.servlet;


import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.java_cup.internal.internal_error;
import com.wrq.service.UserService;
import com.wrq.utils.JdbcUtils;

public class UserMdiQueryServlet extends HttpServlet {
	UserService userService = new UserService();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		Map<String, Object> userMap = userService.load(user_id);
		request.setAttribute("userMap", userMap);
		request.setAttribute("user_id", user_id);
		request.getRequestDispatcher("userMdi.jsp").forward(request,response);
		
}
}

