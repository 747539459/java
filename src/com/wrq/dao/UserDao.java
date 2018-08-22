package com.wrq.dao;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sun.java_cup.internal.internal_error;
import com.wrq.model.User;
import com.wrq.utils.JdbcUtils;
import com.wrq.utils.PageBean;

public class UserDao {
	JdbcUtils jd = new JdbcUtils();
	//登陆
	public Map<String, Object> login(String account,String password){
		String sql = "select * from user where account=? and password=? ";
		Map<String, Object> userMap = jd.login(sql, account, password);
		return userMap;
	}
	//查询list
	public List<Map<String, Object>> userList(HttpServletRequest request,User user,int pages,int records){
		StringBuilder sq = new StringBuilder("select * from user where 1=1 ");
		if(user.getAccount()!=null&&user.getAccount()!=""){
			sq.append(" and account like '%"+user.getAccount()+"%'");
		}
		if(user.getUser_name()!=null&&user.getUser_name()!=""){
			sq.append(" and user_name like '%"+user.getUser_name()+"%'");
		}
		String sql = sq.toString();
		List<Map<String, Object>> userList = jd.listForPage(sql,pages,records,null);
		PageBean.setPage(sql, jd, request, pages);
		return userList;
		
	}
	
	//添加
	public int add(User user){
		String sql="insert into user (user_name,account,tel,sex,age,power,card,password,status) values (?,?,?,?,?,?,?,?,?)";
		int result = jd.update(sql, new Object[]{user.getUser_name(),user.getAccount(),user.getTel(),user.getSex(),user.getAge(),user.getPower(),user.getCard(),user.getPassword(),user.getStatus()});
		return result;
	
	}
	//通过id查询数据
	public Map<String, Object> load(int user_id){
		String sql = "select * from user where user_id=?";
		Map<String, Object> userMap = jd.queryById(sql, user_id);
		return userMap;
		
	}
	//修改
	public int mdi(User user){
		String sql="update user set user_name=?,account=?,tel=?,sex=?,age=?,power=?,card=? where user_id=?";
		int result = jd.update(sql, new Object[]{user.getUser_name(),user.getAccount(),user.getTel(),user.getSex(),user.getAge(),user.getPower(),user.getCard(),user.getUser_id()});
		System.out.println(result);
		return result;
	}
	
	//删除
	public int del(User user){
		String sql = "update user set status=-1 where user_id=?";
		int result = jd.update(sql, new Object[]{user.getUser_id()});
		return result;
	}
	
}
