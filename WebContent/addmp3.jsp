<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="musicplayerMap" prefix="slv"%>
<jsp:useBean id="loginBean" class="slv.musicplayer.beans.LoginBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />

<title>Insert title here</title>
<script>
	$(document).ready(
			function() {
				alert("dasdadasd");
				var names = GetParameterValues('msg');
				if (names == "success") {
					alert("User Created Successfully");
				} else if (names == "fail") {
					alert("User Creation Fail!");
				}
				function GetParameterValues(param) {
					var url = window.location.href.slice(
							window.location.href.indexOf('?') + 1).split('&');
					for ( var i = 0; i < url.length; i++) {
						var urlparam = url[i].split('=');
						if (urlparam[0] == param) {
							return urlparam[1];
						}
					}
				}
			});
</script>
<script type="text/javascript">
	function validation() {
		var email = document.getElementById("email");
		var emailReg = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,3})$/;
		if (!email.value.match(emailReg)) {
			alert("Enter Valid Email Address!");
			return false;
		}
		var pass = document.getElementById("password");
		if (pass.value.length == 0) {
			alert("Enter Password!");
			return false;
		}
	}
</script>
</head>
<body>
	<c:if test="${pageContext.request.method eq 'POST'}">
		<jsp:setProperty property="email" name="loginBean"
			value="${param.email}" />
		<jsp:setProperty property="password" name="loginBean"
			value="${param.password}" />

		<c:set var="loginDetails" value="${slv:doGotoCheckLogin(loginBean)}" />
		<c:choose>
			<c:when test="${loginDetails}">
				<c:redirect url="index?msg=success" />
			</c:when>
			<c:otherwise>
				<c:redirect url="index?msg1=fail" />
			</c:otherwise>
		</c:choose>
	</c:if>

	<div id="templatemo_container">

		<div id="templatemo_header">
			<div id="templatemo_title">
				<div id="templatemo_sitetitle">
					Music <span>Player</span>
				</div>
			</div>
		</div>

		<div id="templatemo_content">

			<div id="templatemo_left_column">

				<h2>Blog Entries</h2>
				<marquee behavior="scroll" direction="up">
					<div class="left_col_box">
						<div class="blog_box">
							<h3>
								<a href="#">Curabitur quis velit quis tortor</a>
							</h3>
							Suspendisse vitae neque eget ante tristique vestibulum.
							Pellentesque vitae magna.<br /> Posted by <a href="#"><span>Admin</span></a>
							in <a href="#"><span>Videos</span></a><br /> 14 December 2020
						</div>
						<div class="blog_box">
							<h3>
								<a href="#">Duis vitae velit sed dui</a>
							</h3>
							Pellentesque vitae magna. Suspendisse vitae neque eget ante
							tristique vestibulum.<br /> Posted by <a href="#"><span>Admin</span></a>
							in <a href="#"><span>Audios</span></a><br /> 20 December 2020
						</div>
						<div class="blog_box">
							<h3>
								<a href="#">Donec mollis aliquet ligula</a>
							</h3>
							Suspendisse vitae neque eget ante tristique vestibulum.<br />
							Posted by <a href="#"><span>Admin</span></a> in <a href="#"><span>Samples</span></a><br />
							22 December 2020
						</div>
						<div class="more_button">
							<a href="#">View All</a>
						</div>

					</div>
				</marquee>
			</div>

			<div id="templatemo_right_column">
				<div class="left_col_box">
					<form action="index" method="post">
						<div class="form_row" id="log">
							<h1 align="center">User Login</h1>
							<div align="right" style="float: right">
								<a href="javascript: window.history.go(-1)" style="text-decoration: none;"><img
									class="backs" src="images/back.png" /></a>
							</div>
							<%
								String slv = request.getParameter("msg");
								if (slv != null) {
									out.print("<h3><font color='#f36d21'><center>Login Successfull</center></font></h3>");
// 									response.sendRedirect("admindashboard.jsp");
								}
								String slv1 = request.getParameter("msg1");
								if (slv1 != null) {
									out.print("<h3><font color='#f36d21'><center>Enter Correct Email and Password!</center></font></h3>");
								}
							%>
							<table border="0" align="center">
								<tr>
									<td align="left"><label>News Header  <span style="color: red;font-size: 15px">*</span></label></td>
									<td><input class="inputfield" name="news" type="text"
										id="news" /></td>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
									<td><label>News Details  <span style="color: red;font-size: 15px">*</span></label></td>
									<td><input class="inputfield" name="newsdetails"
										type="text" id=""newsdetails"" /></td>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
									<td colspan="2" align="center"><input class="button"
										type="submit" name="Submit" value="Login"
										onclick="return validation()" style="cursor: pointer;" /> <a
										href="signup"><input class="button" type="button"
											name="Submit" value="SignUp" style="cursor: pointer;" /></a></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>