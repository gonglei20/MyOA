<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script>
			function setit()
			{
				document.forms[0].submit();
			}
		</script>
	</head>
	
	<body>
		<div class="top">
			<div class="global-width">
				<img src="${pageContext.request.contextPath}/Images/logo.gif" class="logo" />
			</div>
		</div>
		<div class="status">
			<div class="global-width">
				${sessionUser.username }你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="location.href='loginOut.do'";>注销</a>
			</div>
		</div>
		<form id="myForm" name="myForm" action="userInfo!editData.action" method="post">
		<input type="hidden" name="u.id" value="26"/>
		<input type="hidden" name="u.sex" value="2" id="u_sex"/>
		<input type="hidden" name="u.supper" value="0" id="u_supper"/>
		<div class="main">
			<div class="global-width">
				
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	</head>
  
  <body>
    <div class="nav" id="nav">
					<div class="t"></div>
					<dl>
							<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理 
						</dt>
						<dd>
							<a href="forwardPersonInfo.do" target="_self">个人信息</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							邮件管理
						</dt>
						<dd>
							<a href="mailWrite.action" target="_self">写邮件</a>
						</dd>
						<dd>
							<a href="mailReceive!receive.action" target="_self">收邮件</a>
						</dd>
						<dd>
							<a href="mailGarage!garage.action" target="_self">垃圾邮件</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							考勤管理
						</dt>
						<c:if test="${sessionUser.isadmin == 0 }">
						<dd>
							<a href="forwardLeave.do" target="_self">休假</a>
						</dd>
						</c:if>
						
						<c:if test="${sessionUser.isadmin == 1 }">
						<dd>
							<a href="forwardLeave.do" target="_self">休假</a>
						</dd>
						<dd>
							<a href="forwardCheck.do" target="_self">审核休假</a>
						</dd>
						</c:if>
					</dl>
					
					<dl >
					
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							权限管理
						</dt>
						<dd>
							<a href="forwardPersonAccount.do" target="_self">个人账户</a>
						</dd>
						<dd>
							<a href="adminAccount.do" target="_self">管理账户</a>
						</dd>
						
					</dl>
				</div>
  </body>
</html>



					<!-- 休假信息列表-->
 					<div class="action">
						<div class="t">
							休假信息列表
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td width="15%">申请人</td>
									<td  width="15%">开始时间</td>
									<td  width="20%">结束时间</td>
									<td  width="20%">天数</td>
									<td  width="20%">审批状态</td>
									<td  width="20%">原因</td>
								</tr>
								<c:forEach items="${leaveSession }" var="leave">
									<tr >
									<td width="15%">${leave.username } </td>
									<td  width="15%">${leave.starttime }</td>
									<td  width="20%">${leave.endtime }</td>
									<td  width="20%">${leave.day }</td>
									
									<c:if test="${leave.status ==0 }">
									<td  width="20%">
									未审核
									</td>
									</c:if>
									<c:if test="${leave.status ==1 }">
									<td  width="20%">
									已通过
									</td>
									</c:if>
									<c:if test="${leave.status ==2 }">
									<td  width="20%">
									审核拒绝
									</td>
									</c:if>
									
									
									<td  width="20%">${leave.reason }</td>
								</tr>
								</c:forEach>
								
								<tr >
									<td align="right" colspan="3"><br/><a href="applyLeave.do"><input type="button"  id="save" value="申请休假"  /></a></td>
								</tr>
								</table>
								
						</div>
					</div>

			</div>
		</div>
		</form>
		<div class="copyright">
			Copyright &nbsp; &copy; &nbsp; 
		</div>
 
	</body>
</html>