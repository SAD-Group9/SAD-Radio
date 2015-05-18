<%@page import="slv.musicplayer.settings.DatabaseSettings"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>


<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	String task = request.getParameter("task");

	if (task.equalsIgnoreCase("validateEmail")) {
		String email = request.getParameter("email_id");
		System.out.println("Task: "+task+" Email: "+email);
		try {
			con = DatabaseSettings.getConnection();
			st = con.createStatement();
			String sql = "SELECT user_name FROM login where user_name='"+ email + "'";
			System.out.println(sql);
			rs = st.executeQuery(sql);
			if (rs.next()) {
				out.print("This Email-ID is already registered!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DatabaseSettings.closeConnection(con, st, rs);
		}
	}
%>
