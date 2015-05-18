package slv.musicplayer.settings;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class DatabaseSettings {
	private static String databaseName = "musicplayer";
	private static String username = "root";
	private static String password = "root";
//	 private static String password="W3dB@z@rP@s";
	private static String url = "jdbc:mysql://localhost:3306/";
	private static String driverName = "com.mysql.jdbc.Driver";

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url + databaseName, username,password);
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return con;
	}

	public static String getOneColumn(String sql) {
//		 System.out.println("$$$ "+sql);
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String value = "";
		try {
			con = DatabaseSettings.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				value += rs.getString(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DatabaseSettings.closeConnection(con, stmt, rs);
		}
		return value;
	}

	public static ArrayList<String> getOneColumnN(String sql) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<String> value = new ArrayList<String>();
		try {
//			System.out.println(sql);
			con = DatabaseSettings.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				value.add(rs.getString(1));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DatabaseSettings.closeConnection(con, stmt, rs);
		}
		return value;
	}

	public static void closeConnection(Connection con, PreparedStatement pstmt,
			ResultSet rs) {
		try {
			if (con != null)
				con.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void closeConnection(Connection con, Statement stmt,
			ResultSet rs) {
		try {
			if (con != null)
				con.close();
			if (stmt != null)
				stmt.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void closeConnection(Connection con, PreparedStatement pstmt,
			Statement stmt, ResultSet rs) {
		try {
			if (con != null)
				con.close();
			if (pstmt != null)
				stmt.close();
			if (stmt != null)
				stmt.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
