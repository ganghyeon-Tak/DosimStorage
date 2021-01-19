package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;

public class LoginAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(m_id);
		
		if (member == null || member.getM_del().equals("y")) result = -1;
		else {
			String dbPass = member.getM_pw();			
			if (dbPass.equals(m_pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("m_id", m_id);
				result = 1;
			} else result = 0;
		}
		request.setAttribute("result", result);
		return "login";
	}

}