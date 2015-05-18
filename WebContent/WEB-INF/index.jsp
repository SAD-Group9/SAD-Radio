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
<link href="style1.css" rel="stylesheet" type="text/css" />
<!--   <link rel="stylesheet" href="reset.css"> -->
<link rel="shortcut icon" href="images/music.png" />
<title>Online Radio</title>
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
					Online <span>Radio</span>
				</div>
			</div>
		</div>

		<div id="templatemo_content" style="height: 528px;">

			<div id="templatemo_left_column">

				<h2>Latest News</h2>
				<marquee behavior="scroll" direction="up" onmouseover="this.stop();"
					onmouseout="this.start();">
					<div class="left_col_box">
						<div class="blog_box">
							<h3>
								<a href="#">Seminar</a>
							</h3>
							Seminars on latest trending technologies in the present modern market those are booming in the Tech world<br /> Posted by <a href="#"><span>Admin</span></a>
							in <a href="#"><span>latest news</span></a><br />  10 may 2015
						</div>
						<div class="blog_box">
							<h3>
								<a href="#">Presentations</a>
							</h3>
							About the Presentation: Presented the paper at National Conference on Emerging Trends in Information Technology (ETIT-2015.This covers the importance of flash memories to suit a wide range of applications like USB Storage and RAM Devices.<br /> Posted by <a href="#"><span>Admin</span></a>
							in <a href="#"><span>latest news</span></a><br /> 10 may 2015
						</div>
						<div class="blog_box">
							<h3>
								<a href="#">Latest Projects</a>
							</h3>
							Various project explainations presenting from various university students<br />
							Posted by <a href="#"><span>Admin</span></a> in <a href="#"><span>Samples</span></a><br />
							 10 may 2015
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
							<%
								String slv = request.getParameter("msg");
								if (slv != null) {
									out.print("<h3><font color='#f36d21'><center>Login Successfull</center></font></h3>");
									response.sendRedirect("userdashboardpop");
								}
								String slv1 = request.getParameter("msg1");
								if (slv1 != null) {
									out.print("<h3><font color='#f36d21'><center>Enter Correct Email and Password!</center></font></h3>");
								}
							%>
							<table border="0" align="center">
								<tr>
									<td align="left"><label>Email <span
											style="color: red; font-size: 15px">*</span></label></td>
									<td><input class="inputfield" name="email" type="text"
										id="email" /></td>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
									<td align="left"><label>Password <span
											style="color: red; font-size: 15px">*</span></label></td>
									<td><input class="inputfield" name="password"
										type="password" id="password" /></td>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
									<td></td>
									<td align="left"><a href="">Forgot Password?</a></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2" align="center"><input class="button"
										type="submit" name="Submit" value="Login"
										onclick="return validation()" style="cursor: pointer;" /> <a
										href="signup"><input class="button" type="button"
											name="Submit" value="SignUp" style="cursor: pointer;" /></a> <a
										href="userdashboardpop"><input class="button" type="button"
											name="guest" value="Guest" style="cursor: pointer;" /></a></td>
								</tr>
							</table>
						</div>
					</form>
					<br /> <img src="images/music.jpg" height="300px" width="625px" style="border:none;">
				</div>
			</div>
		</div>
	</div>
	<center>
		<div id="templatemo_footer">
			
			<div class='container'>
				<div class='row'>
					<i class='icon-facebook'></i><i class='icon-twitter'></i><i
						class='icon-googleplus'></i><i class='icon-pinterest'></i><i
						class='icon-dribbble'></i>
				</div>
			</div>
		</div>
	</center>
</body>
</html>