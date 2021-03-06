<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script>
function upload(ele){
	
	if(ele.files[0].size>9437184){
		alert("文件不允许超过9M");
		$("#sendEmail").attr('disabled',true);  
	}else{
		$("#sendEmail").attr('disabled',false);
	}
}
</script>
<script type="text/javascript">

//表单校验
$(function() {
	$("#myForm").validate({
						rules : {
							emailtitle:{
								required:true
							}
						},
						messages : {
							emailtitle :{
								required:"邮件标题不能为空"
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
				<a href="#" onclick="location.href='loginOut.do';">注销</a>
			</div>
		</div>
		<form id="myForm" name="myForm" action="sendEmail.do" method="post" enctype="multipart/form-data">
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

	<!-- 写邮件-->
 					<div class="action">
						<div class="t">
							写邮件
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td style="padding-top: 10px" align="right" width="30%">收件人：</td>
									<td style="padding-top: 10px" align="left">
									<select name="receiveuser" id="receiveuser">
									<c:forEach items="${allUserSession }" var="allUser">
										<option>${allUser.username }</option>
									</c:forEach>
									</select>
									</td>
								</tr>
								<tr >
									<td style="padding-top: 10px" align="right" width="30%"><label style="color: red">*</label>邮件标题：</td>
									<td style="padding-top: 10px" align="left">
									<input type="text" name="emailtitle" id="emailtitle" /> 
									</td>
								</tr>
								
								<tr >
									<td style="padding-top: 10px" align="right" width="30%">邮件内容：</td>
									<td style="padding-top: 10px" align="left">
									<textarea rows="10" cols="40" name="emailvalue"></textarea>
									</td>
								</tr>
								<tr >
									
									<td style="padding-top: 10px" align="right" width="30%"><label style="color: red">*</label>附件上传：</td>
									<td style="padding-top: 10px" align="left">
									<input type="file" name="file" onchange="upload(this)" />
									
									</td>
								</tr> 
								<tr >
									<td style="padding-top: 10px" align="center" colspan="2"><br/>
									<input type="submit"  id="sendEmail" value="发送邮件" />
					
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