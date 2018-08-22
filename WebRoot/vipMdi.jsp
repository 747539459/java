<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<%Map<String,Object> vipMap = (Map<String,Object>)request.getAttribute("vipMap"); 
List<Map<String,Object>> gradeList = (List<Map<String,Object>>)request.getAttribute("gradeList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${basePath }">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript">
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 345
		});
		$(".select2").uedSelect({
			width : 167
		});
		$(".select3").uedSelect({
			width : 100
		});
	});
</script>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">添加用户</a></li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>基本信息</span>
		</div>
		<form action="VipMdiServlet.do" method="post">
			<input type="hidden" name="vip_id" value="<%=vipMap.get("vip_id")%>">
			<ul class="forminfo">
				<li><label>姓名</label><input name="vip_name" value="<%=vipMap.get("vip_name") %>" type="text"
					class="dfinput" /><i>请输入汉字</i></li>
				<li><label>电话</label><input name="vip_tel" value="<%=vipMap.get("vip_tel") %>" type="text"
					class="dfinput" /><i>请输入电话</i></li>
				<li><label>地址</label><input value="<%=vipMap.get("vip_address") %>" name="vip_address" type="text"
					class="dfinput" /><i>请输入地址</i></li>
				<li><label>性别</label><cite><input name="vip_sex"
						type="radio" <%if(vipMap.get("vip_sex").equals(1)){ %>checked="checked"<%} %> value="1" />男&nbsp;&nbsp;&nbsp;&nbsp;<input
						name="vip_sex" type="radio" <%if(vipMap.get("vip_sex").equals(-1)){ %>checked="checked"<%} %>  value="-1" />女</cite></li>
				<li><label>身份证</label><input value="<%=vipMap.get("vip_card") %>" name="vip_card" type="text"
					class="dfinput" /><i>请输入身份证</i></li>
				<li><label>权限</label>
					<div class="vocation">
						<select class="select1" name="vip_grade">
						<%for(Map<String,Object> gradeMap:gradeList) {%>
							<option <%if(vipMap.get("vip_grade").toString().equals(gradeMap.get("grade_id").toString())){ %>selected="selected"<%} %> value="<%=gradeMap.get("grade_id")%>"><%=gradeMap.get("grade_name")%></option>
						<%} %>
						</select>
					</div>
				<li><label>&nbsp;</label><input name="" type="submit"
					class="btn" value="确认保存" /></li>
			</ul>
		</form>

	</div>


</body>

</html>