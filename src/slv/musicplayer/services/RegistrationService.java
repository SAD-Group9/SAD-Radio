package slv.musicplayer.services;

import slv.musicplayer.beans.LoginBean;
import slv.musicplayer.beans.UserBean;

public interface RegistrationService {

	public boolean doGotoCheckLogin(LoginBean loginBean);
	public boolean doGotoAddUser(UserBean userBean);
}
