package slv.musicplayer.deligators;

import slv.musicplayer.beans.LoginBean;
import slv.musicplayer.beans.UserBean;
import slv.musicplayer.serviceimpls.RegistrationServiceImpl;
import slv.musicplayer.services.RegistrationService;


public class RegistrationDeligator {
	private static RegistrationService registrationServiceImpl=new RegistrationServiceImpl();
	
	public static boolean doGotoCheckLogin(LoginBean loginBean)
	{
		boolean status=registrationServiceImpl.doGotoCheckLogin(loginBean);
		return status;
	}
	
	public static boolean doGotoAddUser(UserBean userBean)
	{
		boolean status=registrationServiceImpl.doGotoAddUser(userBean);
		return status;
	}
	
	

}
