package slv.musicplayer.serviceimpls;

import slv.musicplayer.beans.LoginBean;
import slv.musicplayer.beans.UserBean;
import slv.musicplayer.dao.RegistrationDao;
import slv.musicplayer.daoimpl.RegistrationDaoImpl;
import slv.musicplayer.services.RegistrationService;

public class RegistrationServiceImpl implements RegistrationService {
	
	private RegistrationDao registrationDaoImpl=new RegistrationDaoImpl();

	@Override
	public boolean doGotoCheckLogin(LoginBean loginBean) {
		boolean status=registrationDaoImpl.doGotoCheckLogin(loginBean);
		return status;
	}

	@Override
	public boolean doGotoAddUser(UserBean userBean) {
		boolean status=registrationDaoImpl.doGotoAddUser(userBean);
		return status;
	}

}
