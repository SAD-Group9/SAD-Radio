package slv.musicplayer.dao;

import slv.musicplayer.beans.LoginBean;
import slv.musicplayer.beans.UserBean;

public interface RegistrationDao {
	
	public boolean doGotoCheckLogin(LoginBean loginBean);
	public boolean doGotoAddUser(UserBean userBean);
}
