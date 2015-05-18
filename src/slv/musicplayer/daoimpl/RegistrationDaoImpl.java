package slv.musicplayer.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import slv.musicplayer.beans.LoginBean;
import slv.musicplayer.beans.UserBean;
import slv.musicplayer.dao.RegistrationDao;
import slv.musicplayer.settings.DatabaseSettings;

public class RegistrationDaoImpl implements RegistrationDao{
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	@Override
	public boolean doGotoCheckLogin(LoginBean loginBean) {
//		System.out.println("Email: "+loginBean.getEmail()+" Password: "+loginBean.getPassword());
		int c=0;
		con=DatabaseSettings.getConnection();
		String sql="SELECT user_name, user_password FROM login WHERE user_name=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(++c, loginBean.getEmail());
//			System.out.println("sql: "+pstmt);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(loginBean.getEmail().equalsIgnoreCase(rs.getString(1)) && loginBean.getPassword().equals(rs.getString(2))){
					return true;
				}else{
					return false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DatabaseSettings.closeConnection(con, pstmt, rs);
		}
		return false;
	}

	@Override
	public boolean doGotoAddUser(UserBean userBean) {
		System.out.println("Email: "+userBean.getEmail()+" Password: "+userBean.getPassword());
		int c=0;
		con=DatabaseSettings.getConnection();
		
		String sql="insert into login (user_name, user_password, user_type) values (?,?,?)";
		try {
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(sql);
			pstmt.setString(++c, userBean.getEmail());
			pstmt.setString(++c, userBean.getPassword());
			pstmt.setString(++c, "User");
			System.out.println("sql1: "+pstmt);
			int k=pstmt.executeUpdate();
			c=0;
			sql="insert into user_details (name, email, dob, gender) values (?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(++c, userBean.getName());
			pstmt.setString(++c, userBean.getEmail());
			pstmt.setString(++c, userBean.getDob());
			pstmt.setString(++c, userBean.getGender());
			System.out.println("sql2: "+pstmt);
			k=pstmt.executeUpdate();
			con.commit();
			if(k>0){
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DatabaseSettings.closeConnection(con, pstmt, rs);
		}
		return false;
	}
}
