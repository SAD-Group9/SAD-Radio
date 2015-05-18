package slv.musicplayer.managerbeans;

import slv.musicplayer.beans.LoginBean;
import slv.musicplayer.deligators.RegistrationDeligator;


public class LoginMB {

	public static boolean doGotoCheckLogin(LoginBean loginBean)
	{
		boolean status=RegistrationDeligator.doGotoCheckLogin(loginBean);
		return status;
	}
}
