package com.wrq.servlet;


import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java_cup.internal.internal_error;
import com.wrq.utils.JdbcUtils;
import com.wrq.utils.PageBean;

public class VipListServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int pages = 1;
		String vip_grade = request.getParameter("vip_grade");
		String vip_name = request.getParameter("vip_name");
		if (request.getParameter("pages")!=null) 
		{
			pages = Integer.parseInt(request.getParameter("pages"));
		}
		StringBuilder sq = new StringBuilder("select v.*,g.* from vip v left join grade g on v.vip_grade=g.grade_id where 1=1 ");
									
		if(vip_grade!=null&&vip_grade!=""){
			sq.append(" and vip_grade like '%"+vip_grade+"%'");
			request.setAttribute("vip_grade", vip_grade);
		}
		if(vip_name!=null&&vip_name!=""){
			sq.append(" and vip_name like '%"+vip_name+"%'");
			request.setAttribute("vip_name", vip_name);
		}
		String sql = sq.toString();
		JdbcUtils jd = new JdbcUtils();
		
		List<Map<String, Object>> vipList = jd.listForPage(sql,pages,5,null);
		PageBean.setPage(sql, jd, request, pages);
		request.setAttribute("vipList", vipList);
		request.setAttribute("url", "VipListServlet.do");
		if(vipList.size()==0){
			request.setAttribute("message", "没有要显示的数据");
		}
		request.getRequestDispatcher("vipList.jsp").forward(request, response);
	}

}
