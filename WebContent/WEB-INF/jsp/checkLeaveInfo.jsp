<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />

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
		<form id="myForm" name="myForm" action="submitApply.do" method="post">
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
							<a href="writeEmail.do" target="_self">写邮件</a>
						</dd>
						<dd>
							<a href="receiveEmail.do" target="_self">收邮件</a>
						</dd>
						<dd>
							<a href="garageEmail.do" target="_self">垃圾邮件</a>
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
					
						<c:if test="${sessionUser.isadmin == 1 }">
						<dd>
							<a href="adminAccount.do" target="_self">管理账户</a>
						</dd>
							</c:if>
					</dl>
				</div>
  </body>
</html>



					<!-- 申请休假-->
 					<div class="action">
						<div class="t">
							申请休假
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">姓名：</td>
									<td  align="left">
									<input type="text" disabled="disabled" value="${leaveInfo.username }"/>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">开始时间：</td>
									<td  align="left">
									<input type="text" disabled="disabled" value="${leaveInfo.starttime }"/>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">结束时间：</td>
									<td  align="left">
									<input type="text" disabled="disabled" value="${leaveInfo.endtime }"/>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">请假天数：</td>
									<td  align="left">
									<input type="text" disabled="disabled" value="${leaveInfo.day }"/>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">请假原因：</td>
									<td  align="left">
									<textarea rows="6" cols="22" disabled="disabled" >
									${leaveInfo.reason }
									</textarea>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">申请人：</td>
									<td  align="left">
									 <input type="text" disabled="disabled" value="${leaveInfo.username }"/> 
									</td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/>
									<a href="checkPass.do?id=${leaveInfo.id }"><input type="button"  value="审核通过"  /></a>
									<a href="checkFail.do?id=${leaveInfo.id }"><input type="button" value="审核不通过"  /></a></td>
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