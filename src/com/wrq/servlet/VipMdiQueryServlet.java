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
import com.wrq.utils.JdbcUtils;

public class VipMdiQueryServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int vip_id = Integer.parseInt(request.getParameter("vip_id"));
		String sql = "select * from vip where vip_id=?";
		String sql1 = "select * from grade";
		JdbcUtils jd = new JdbcUtils();
		Map<String, Object> vipMap = jd.queryById(sql, vip_id);
		List<Map<String, Object>> gradeList = jd.query(sql1, null);
		request.setAttribute("vipMap", vipMap);
		request.setAttribute("gradeList", gradeList);
		request.setAttribute("vip_id", vip_id);
		request.getRequestDispatcher("vipMdi.jsp").forward(request,response);
}
}
