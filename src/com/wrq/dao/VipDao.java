package com.wrq.dao;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sun.java_cup.internal.internal_error;
import com.wrq.model.User;
import com.wrq.model.Vip;
import com.wrq.utils.JdbcUtils;
import com.wrq.utils.PageBean;

public class VipDao {
	JdbcUtils jd = new JdbcUtils();
	
	//查询list
	public List<Map<String, Object>> vipList(HttpServletRequest request,Vip vip,int pages,int records){
		StringBuilder sq = new StringBuilder("select v.*,g.* from vip v left join grade g on v.vip_grade=g.grade_id where 1=1 ");
		if(vip.getVip_grade()!=null&&vip.getVip_grade()!=""){
			sq.append(" and vip_grade like '%"+vip.getVip_grade()+"%'");
			request.setAttribute("vip_grade", vip.getVip_grade());
		}
		if(vip.getVip_name()!=null&&vip.getVip_name()!=""){
			sq.append(" and vip_name like '%"+vip.getVip_name()+"%'");
			request.setAttribute("vip_name", vip.getVip_name());
		}
		String sql = sq.toString();
		List<Map<String, Object>> vipList = jd.listForPage(sql,pages,5,null);
		PageBean.setPage(sql, jd, request, pages);
		return vipList;
		
	}
	
//	//添加
//	public int add(Vip vip){
//		
//	
//	}
//	//通过id查询数据
//	public Map<String, Object> load(int vip_id){
//		
//	}
//	//修改
//	public int mdi(vip vip){
//		
//		return result;
//	}
//	
//	//删除
//	public int del(Vip vip){
//		
//		
//		return result;
//	}
	
}
