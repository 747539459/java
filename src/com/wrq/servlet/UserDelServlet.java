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
import com.wrq.dao.UserDao;
import com.wrq.model.User;
import com.wrq.service.UserService;
import com.wrq.utils.JdbcUtils;

public class UserDelServlet extends HttpServlet {
	UserService userService = new UserService();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		user.setUser_id(user_id);
		try {
			userService.del(user);
			request.setAttribute("message", "É¾³ý³É¹¦");
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("message", e.getMessage());
		}
		request.getRequestDispatcher("message.jsp").forward(request, response);

}
}

