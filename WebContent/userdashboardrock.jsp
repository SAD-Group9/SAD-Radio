<%@page import="java.util.ArrayList"%>
<%@page import="slv.musicplayer.settings.DatabaseSettings"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="style1.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="images/music.png" />
<script src="js/jquery.js"></script>
<script src="js/mediaelement-and-player.min.js"></script>
<link rel="stylesheet" href="css/mediaelementplayer.min.css" />

<title>Online Radio</title>
<script>
	// 	$(".audioDemo").on("play", function() {
	// 		var _this = $(this);
	// 		$(".audioDemo").each(function(i, el) {
	// 			if (!$(el).is(_this))
	// 				$(el).get(0).pause();
	// 		});
	// 	});
	document.addEventListener('play', function(e) {
		var audios = document.getElementsByTagName('audio');
		for ( var i = 0, len = audios.length; i < len; i++) {
			if (audios[i] != e.target) {
				audios[i].pause();
			}
		}
	}, true);
	
	<div id="cp_widget_4b6626e5-bb8f-4718-bf44-b97f98ae97ef">...</div><script type="text/javascript">
	var cpo = []; cpo["_object"] ="cp_widget_4b6626e5-bb8f-4718-bf44-b97f98ae97ef"; cpo["_fid"] = "AcNAIisHseGM";
	var _cpmp = _cpmp || []; _cpmp.push(cpo);
	(function() { var cp = document.createElement("script"); cp.type = "text/javascript";
	cp.async = true; cp.src = "//www.cincopa.com/media-platform/runtime/libasync.js";
	var c = document.getElementsByTagName("script")[0];
	c.parentNode.insertBefore(cp, c); })(); </script>
<noscript>
	Powered by Cincopa <a href='http://www.cincopa.com/video-hosting'>Video
		Hosting for Business</a> solution.<span>POP</span><span>POP</span><span>KALIMBA</span><span>MAID
		WITH THE FLAXEN HAIR</span>
</noscript>
</head>
<body>

	<div id="templatemo_container">
		<div id="templatemo_header">
			<div id="templatemo_title">
				<div id="templatemo_sitetitle">
					online <span>Radio</span>
				</div>
			</div>
			<div id="templatemo_login">
				<form method="get" action="#">
					<label>Search:</label><input class="inputfield" name="keyword"
						type="text" id="keyword" />
					<!-- 						<input class="button" type="submit" name="Search" value="Search" /> -->
				</form>
			</div>
		</div>

		<div id="templatemo_menu" >
			<ul>
				<li><a href="userdashboardrock" class="current" style="width:90px;">ROCK MUSIC</a></li>
				<li><a href="quiz.html">TALK SHOW</a></li>
				<li><a href="news.html">EVENTS</a></li>
				<li><a href="userdashboardrock">PODCASTS</a></li>
				<li><a href="userdashboardrock">SPORTS</a></li>
				<li><a href="contact.html">CONTACT</a></li>
<!-- 				<li><a href="index">LOG IN</a></li> -->
<!-- 				<li><a href="signup">SIGN UP</a></li> -->
				<li style="float: right;"><a href="index">LOG OUT</a></li>
			</ul>
		</div>

		<center>
			<div id="templatemo_content" style="height: 477px;" align="center">
				<div class="left_col_box">
					<br />
					<h1 align="center" style="width: 700px;">Audio List (ROCK)</h1>
					<iframe width="600" height="430"
						src="//www.cincopa.com/media-platform/iframe.aspx?fid=AcNAIisHseGM"
						frameborder="0" allowfullscreen scrolling="no"></iframe>
					<noscript>
						<span>POP</span><span>POP</span><span>KALIMBA</span><span>MAID
							WITH THE FLAXEN HAIR</span>
					</noscript>

					<!-- 							<table border="0" align="center"> -->
					<!-- 								<tr> -->
					<!-- 									<td align="left"><a href="addnews"><label -->
					<!-- 											style="font-size: 16px">> Add News</label></a></td> -->
					<!-- 								</tr> -->
					<!-- 								<tr> -->
					<!-- 									<td align="left"><a href="addmp3"><label -->
					<!-- 											style="font-size: 16px">> Add Audio</label></a></td> -->
					<!-- 								</tr> -->
					<!-- 							</table> -->

					<!-- 					<table border="0" style="width: 660px;" align="center"> -->
					<%
						// 							ArrayList<String> aaa = DatabaseSettings.getOneColumnN("select audioname from audio");
					%>
					<!-- 						<tr> -->
					<%-- 							<td style="font-size: 13px"><%=aaa.get(i)%></td> --%>
					<!-- 							<td style="width: 50px;"><audio id="play" name="play" -->
					<!-- 									controls preload="none"> <source -->
					<%-- 									src="<%=aaa.get(i).toString().replace(" ", "")%>" --%>
					<!-- 									type="audio/mp3" /> </audio></td> -->
					<!-- 						</tr> -->
					<%
						// 							}
					%>
					<!-- 					</table> -->
				</div>
			</div>
		</center>
		<script>
			$('audio,video').mediaelementplayer();
		</script>
	</div>

	
</body>
</html>