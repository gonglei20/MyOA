<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
//表单校验
$(function() {
	$("#myForm").validate({
						rules : {
							username:{
								required:true
							},
							phone:{
								required:true,
								digits:true,
								minlength:11
							}
						},
						messages : {
							username :{
								required:"用户名不能为空"
								} ,
							phone:{
								required:"手机号不能为空!",
								digits:"手机号必须是整数!",
								minlength:"手机号不得少于11位!"
							}
						}
					});
})
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
		<form id="myForm" name="myForm" action="editData.do" method="post">
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
					<!-- 编辑个人信息 -->
 					<div class="action">
						<div class="t">
							编辑个人信息
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td style="padding-top: 15px"  align="right" width="30%">
									<label style="color: red">*</label>
									用户名：</td>
									<td style="padding-top: 15px"  align="left">
									<input type="text" name="username" value="${sessionUser.username }"  id="nickname"/>
									</td>
								</tr>
								<tr >
									<td style="padding-top: 15px"  align="right" width="30%">年龄：</td>
									<td style="padding-top: 15px"  align="left">
									<input type="text" name="age" value="${sessionUser.age }"  id="age"/>
									</td>
								</tr>
								<tr >
									<td style="padding-top: 15px"  align="right" width="30%">性别：</td>
									<td style="padding-top: 15px"  align="left">
										<select name="sex" id="sex">
											<option>${sessionUser.sex }</option>
												<c:if test="${sessionUser.sex eq '男'}"><option>女</option></c:if>
												<c:if test="${sessionUser.sex eq '女'}"><option>男</option></c:if>
										</select>			
									</td>
								</tr>
								<tr >
									<td style="padding-top: 15px"  align="right" width="30%">
									<label style="color: red">*</label>
									手机：</td>
									<td style="padding-top: 15px"  align="left">
									<input type="text" name="phone" value="${sessionUser.phone }"  id="phone"/>
									</td>
								</tr>
								<tr >
									<td style="padding-top: 15px" align="right" width="30%">地址：</td>
									<td style="padding-top: 15px"  align="left"><input type="text" name="address" value="${sessionUser.address }"  id="address"/>
									</td>
								</tr>
								<tr >
									<td style="padding-top: 15px"  align="center" colspan="2"><br/>
									<input type="submit"  id="save" value="保存数据"  />
									<a href="forwardPersonInfo.do">
									<input type="button"  id="back" value="返回"  />
									</a>
									</td>
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