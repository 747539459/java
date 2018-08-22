<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	List<Map<String, Object>> vipList = (List<Map<String, Object>>) request.getAttribute("vipList");
	
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.js"></script>

		


	</head>


	<body>

		<div class="place">
			<span><br>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">数据表</a>
				</li>
				<li>
					<a href="#">基本内容</a>
				</li>
			</ul>
		</div>

		<div class="rightinfo">

			<div class="tools">

				<ul class="toolbar">
					<li class="click">
						<a href="vipAdd.jsp"><span><img src="images/t01.png" />
						</span>添加</a>
					</li>

				</ul>

				<form action="VipListServlet.do" method="post">
				<ul class="toolbar1">
					<li>
						等级：
						<select name="vip_grade">
							<option<%if(request.getAttribute("vip_grade")!=null&&request.getAttribute("vip_grade").equals("1")){ %>selected="selected"<%} %> value="1">vip1</option>
							<option<%if(request.getAttribute("vip_grade")!=null&&request.getAttribute("vip_grade").equals("2")){ %>selected="selected"<%} %> value="2">vip2</option>
							<option<%if(request.getAttribute("vip_grade")!=null&&request.getAttribute("vip_grade").equals("3")){ %>selected="selected"<%} %> value="3">vip3</option>
							<option<%if(request.getAttribute("vip_grade")!=null&&request.getAttribute("vip_grade").equals("4")){ %>selected="selected"<%} %> value="4">vip4</option>
							<option<%if(request.getAttribute("vip_grade")!=null&&request.getAttribute("vip_grade").equals("5")){ %>selected="selected"<%} %> value="5">vip5</option>
							<option<%if(request.getAttribute("vip_grade")!=null&&request.getAttribute("vip_grade").equals("6")){ %>selected="selected"<%} %> value="6">vip6</option>
							<option<%if(request.getAttribute("vip_grade")!=null&&request.getAttribute("vip_grade").equals("7")){ %>selected="selected"<%} %> value="7">vip7</option>
						</select>
						账号：<input value="${vip_name }" type="text" name="vip_name">
						<input type="submit" value="查询">
					</li>
				</ul>
				</form>
			</div>


			<table class="tablelist">
				<thead>
					<tr>
						<th>
							<input name="" type="checkbox" value="" checked="checked" />
						</th>
						<th>
							姓名
							<i class="sort"><img src="images/px.gif" />
							</i>
						</th>
						<th>
							电话
						</th>
						<th>
							身份证
						</th>
						<th>
							性别
						</th>
						<th>
							地址
						</th>
						<th>
							交易金额
						</th>
						<th>
							等级
						</th>
						<th>
							操作
						</th>
						
					</tr> 
				</thead>
				<tbody>
					<%if(vipList.size()>0&& vipList!=null){
						for(Map<String,Object> vipMap : vipList){
					 %>
					
					<tr>
						<td>
							<input name="user_id" type="checkbox" value="<%=vipMap.get("vip_id") %>" />
						</td>
						<td>
							<%=vipMap.get("vip_name") %>
						</td>
						<td>
							<%=vipMap.get("vip_tel") %>
						</td>
						<td>
							<%=vipMap.get("vip_card") %>
						</td>
						<td> 
							<%if(vipMap.get("vip_sex").equals(1)){ %>男<%}else{ %>
							女<%} %>
						</td>
						<td>
							<%=vipMap.get("vip_address") %>
						</td>
						<td>
							<%=vipMap.get("all_money") %>
						</td>
						<td>
							<%=vipMap.get("grade_name") %>
						</td>
						
						<td>
							<a href="VipMdiQueryServlet.do?vip_id=<%=vipMap.get("vip_id") %>" class="tablelink">修改</a>
							<a href="vipDel.jsp?vip_id=<%=vipMap.get("vip_id") %>" class="tablelink"> 删除</a>
						</td>
					</tr>
					<%} }else{%>
						<td colspan="10" align="center">
							<font color="red" >${message }</font>
						</td>
					<%} %>

				</tbody>
			</table>

			<jsp:include page="pages.jsp"></jsp:include>
			
		</div>

		<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

	</body>

</html>
