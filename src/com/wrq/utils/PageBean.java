package com.wrq.utils;

import javax.servlet.http.HttpServletRequest;

import com.sun.java_cup.internal.internal_error;

public final class PageBean {
	private PageBean(){}
	public static void setPage(String sql,JdbcUtils jd,HttpServletRequest request,int  pages){
		int count = jd.count(sql, null);
		int sumPage = (count%5==0)?(count/5):(count/5+1);
		request.setAttribute("sumPage", sumPage);
		request.setAttribute("pages", pages);
	}
}
