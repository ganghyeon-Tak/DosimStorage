package masterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MasterDao;
import model.Master;


public class MasterLogin implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String master_id = request.getParameter("master_id");
		String master_pw = request.getParameter("master_pw");
		MasterDao msd = MasterDao.getInstance();
		Master master = msd.select(master_id);
		
		if (master == null) result = -1;
		else {
			String dbPass = master.getMaster_pw();
			String dbId = master.getMaster_id();
			if (dbPass.equals(master_pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("master_id", master_id);
				result = 1;
			} else result = 0;
		}
		request.setAttribute("result", result);
		return "m_login";
	}

}
