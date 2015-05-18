<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="musicplayerMap" prefix="slv"%>
<jsp:useBean id="userBean" class="slv.musicplayer.beans.UserBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Radio</title>
<!-- <script type="text/javascript" src="js/testing.js"></script> -->
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<link rel="shortcut icon" href="images/music.png" />
<link type="text/css" href="css/jquery.datepick.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="style1.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(
			function() {
				var name = GetParameterValues('msg');
				if (name == "success") {
					alert("User Created Successfully");
					window.location.assign("index.jsp")
				} else if (name == "fail") {
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
	$(function() {
		$('#dob').datepick({
			dateFormat : "dd-mm-yyyy"
		}).val();
	});

	function validation() {
		var email = document.getElementById("email");
		var emailReg = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,3})$/;
		if (!email.value.match(emailReg)) {
			alert("Enter Valid Email Address!");
			return false;
		}
		if ($("#emailErr").text().trim() == "This Email-ID is already registered!") {
			alert('This Email-ID is already registered!');
			return false;
		}
		var pass = document.getElementById("password");
		if (pass.value.length == 0) {
			alert("Enter Password!");
			return false;
		}
		var name = document.getElementById("name");
		if (name.value.length == 0) {
			alert("Enter Name!");
			return false;
		}
		var dates = document.getElementById("dob");
		if (dates.value.length == 0) {
			alert("Select Appropriate Date!");
			return false;
		}
		// 		var dates = document.getElementById("dob");
		// 		var dateformat = /^(0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])[\/\-]\d{4}$/;
		// 		if (!dates.value.match(dateformat)) {
		// 			alert("Select Appropriate Date!");
		// 			return false;
		// 		}
	}

	function emailCheck(email) {
		$.ajax({
			type : 'post',
			url : 'validation.jsp',
			data : {
				task : 'validateEmail',
				email_id : email
			},
			success : function(msg) {
				$("#emailErr").text(msg);
			}
		});
	}
</script>
</head>
<body>
	<c:if test="${pageContext.request.method eq 'POST'}">
		<jsp:setProperty property="email" name="userBean"
			value="${param.email}" />
		<jsp:setProperty property="password" name="userBean"
			value="${param.password}" />
		<jsp:setProperty property="name" name="userBean" value="${param.name}" />
		<jsp:setProperty property="dob" name="userBean" value="${param.dob}" />
		<jsp:setProperty property="gender" name="userBean"
			value="${param.gender}" />

		<c:set var="userDetails" value="${slv:doGotoAddUser(userBean)}" />
		<c:choose>
			<c:when test="${userDetails}">
				<c:redirect url="signup?msg=success" />
			</c:when>
			<c:otherwise>
				<c:redirect url="signup?msg=fail" />
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

<!-- 		<div align="right" -->
<!-- 			style="padding-right: 20px; padding-top: 20px; font-size: 16px;"> -->
<!-- 			<a href="javascript:history.go(-1);" -->
<!-- 				style="text-decoration: none; vertical-align: top;"><img -->
<!-- 				class="backs" src="images/back.png" />Back</a> -->
<!-- 		</div> -->

		<div id="templatemo_content">

			<div id="templatemo_left_column">

				<h2>Latest news</h2>
				<marquee behavior="scroll" direction="up" onmouseover="this.stop();" onmouseout="this.start();">
					<div class="left_col_box">
						<div class="blog_box">
							<h3>
								<a href="#">Seminars</a>
							</h3>
							Seminars on latest trending technologies in the present modern market those are booming in the Tech world<br /> Posted by <a href="#"><span>Admin</span></a>
							in <a href="#"><span>latest news</span></a><br /> 14 December 2020
						</div>
						<div class="blog_box">
							<h3>
								<a href="#">Presentations</a>
							</h3>
							About the Presentation: Presented the paper at National Conference on Emerging Trends in Information Technology (ETIT-2015.This covers the importance of flash memories to suit a wide range of applications like USB Storage and RAM Devices.<br /> Posted by <a href="#"><span>Admin</span></a>
							in <a href="#"><span>latest news</span></a><br /> 20 December 2020
						</div>
						<div class="blog_box">
							<h3>
								<a href="#">Latest Projects</a>
							</h3>
							Various project explainations presenting from various university students<br />
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
					<form action="signup" method="post">
						<h1 align="center">User SignUp</h1>
						<center>
							<span id="emailErr" style="color: red;"></span>
						</center>
						<table border="0" align="center">
							<tr>
								<td align="left">Email <span
									style="color: red; font-size: 15px">*</span></td>
								<td>:</td>
								<td><input type="text" name="email" id="email"
									onblur="emailCheck(this.value)" /></td>
							</tr>
							<tr>
								<td align="left">Password <span
									style="color: red; font-size: 15px">*</span></td>
								<td>:</td>
								<td><input type="password" name="password" id="password" /></td>
							</tr>
							<tr>
								<td align="left">Name <span
									style="color: red; font-size: 15px">*</span></td>
								<td>:</td>
								<td><input type="text" name="name" id="name" /></td>
							</tr>
							<tr>
								<td align="left">DOB <span
									style="color: red; font-size: 15px">*</span></td>
								<td>:</td>
								<td><input type="text" name="dob" id="dob" /></td>
							</tr>
							<tr>
								<td align="left">Gender <span
									style="color: red; font-size: 15px">*</span></td>
								<td>:</td>
								<td align="left"><input type="radio" name="gender"
									id="gender" value="Male" checked="checked" />Male<input
									type="radio" name="gender" id="gender" value="Female" />Female</td>
							</tr>
							<tr align="center">
							<td></td>
							<td></td>
								<td><input type="submit" class="button"
									value="Submit" onclick="return validation()"
									style="cursor: pointer;"><a href="index">&nbsp;<input
										class="button" type="button" name="Submit" value="Login"
										style="cursor: pointer;" /></a></td>
							</tr>
						</table>
					</form>
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