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
			window.onload = function(){
				var mtb = document.getElementById("mtb");
				for(var i=0;i<mtb.tBodies[0].rows.length;i++){
					if(i%2==0){
						//奇数行
						mtb.tBodies[0].rows[i].style.backgroundColor = "white";
					}else{
						//偶数行
						mtb.tBodies[0].rows[i].style.backgroundColor = "#D3D3D3";
					}
				}				
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
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onclick="location.href='loginOut.do'";>注销</a>
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



					<!-- 个人信息 -->
 					<div class="action">
						<div class="t">
							管理账户
						</div>
						<div class="pages">
							
							<c:if test="${sessionUser.isadmin == 1 }">
								<table id="mtb" width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td width="20%">用户名</td>
									<td  width="20%">性别</td>
									<td  width="20%">手机</td>
									<td  width="20%">住址</td>
								</tr>
								
								
										<c:forEach items="${allUserSession }" var="list">
										<tr >
											<td width="20%">
												${list.username }
											</td>
											<td width="20%">
												${list.sex }
											</td>
											<td width="20%">
												${list.phone }
											</td>
											<td width="20%">
												${list.address }
											</td>
									
										</tr>
										</c:forEach>
									
								

								
								
								
								</table>
								<a href="forwardAddPersonAccount.do"><input type="button"  id="save" value="添加数据"  /></a>
							</c:if>
							
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