<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
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
				<li>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">添加用户</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<div class="formtitle">
				<span>基本信息</span>
			</div>
			<form action="UserMdiServlet.do" method="post">
				<input type="hidden" name="user_id" value="${userMap.user_id}">
				<ul class="forminfo">
					<li>
						<label>
							姓名
						</label>
						<input value="${userMap.user_name}" name="user_name" type="text" class="dfinput" />
						<i>请输入汉字</i>
					</li>
					<li>
						<label>
							账号
						</label>
						<input value="${userMap.account}" name="account" type="text" class="dfinput" />
						<i>请输入账号</i>
					</li>
					<li>
						<label>
							年龄
						</label>
						<input value="${userMap.age}" name="age" type="text" class="dfinput" />
						<i>请输入数字</i>
					</li>
					<li> 
						<label>
							性别
						</label>
		
						<cite><input <c:if  var="s" test="${userMap.sex eq 1}">checked="checked"</c:if> name="sex" type="radio" value="1" />男&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="sex" <c:if test="${!s}">checked="checked"</c:if> type="radio" value="-1" />女</cite>
					</li>
					<li>
						<label>
							身份证
						</label>
						<input name="card" type="text" class="dfinput"
							value="${userMap.card}" />
						<i>请输入身份证</i>
					</li>
					<li>
						<label>
							电话
						</label>
						<input value="${userMap.tel}" name="tel" type="text"
							class="dfinput" />
						<i>请输入电话号</i>
					</li>
					<li>
						<label>
							权限
						</label>
						<div class="vocation">
							<select class="select1" name="power">
					
								<option<c:if test="${userMap.power eq 1}"> selected="selected" </c:if> value="1">
									总经理
								</option>
								<option<c:if test="${userMap.power eq 2}"> selected="selected" </c:if>  value="2">
									人事部经理
								</option>
								<option <c:if test="${userMap.power eq 3}"> selected="selected" </c:if>  value="3">
									客户经理
								</option>
								<option <c:if test="${userMap.power eq 4}"> selected="selected" </c:if>  value="4">
									前台
								</option>
							</select>
						</div>
					<li>
						<label>
							&nbsp;
						</label>
						<input name="" type="submit" class="btn" value="确认保存" />
					</li>
				</ul>
			</form>

		</div>


	</body>

</html>