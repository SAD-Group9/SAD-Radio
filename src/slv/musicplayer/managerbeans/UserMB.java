package slv.musicplayer.managerbeans;

import slv.musicplayer.beans.UserBean;
import slv.musicplayer.deligators.RegistrationDeligator;

public class UserMB {
	public static boolean doGotoAddUser(UserBean userBean)
	{
		boolean status=RegistrationDeligator.doGotoAddUser(userBean);
		return status;
	}
}
