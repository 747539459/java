package com.wrq.servlet;


import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wrq.service.UserService;

public class LoginServlet extends HttpServlet {
	UserService userService = new UserService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String url = "login.jsp";
		try {
			Map<String, Object> userMap = userService.login(account, password);
			HttpSession session = request.getSession();
			session.setAttribute("userMap", userMap);
			url = "main.jsp";
		} catch (RuntimeException e) {
			request.setAttribute("message", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request,response);
	}

}
