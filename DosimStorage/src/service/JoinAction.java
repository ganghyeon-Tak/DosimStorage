package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import dao.MasterDao;
import dao.MemberDao;
//import model.Master;
import model.Member;

public class JoinAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("m_email");
		String m_tel = request.getParameter("m_tel");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(m_id);
		if (member == null) {
			member = new Member();
			member.setM_id(m_id);
			member.setM_pw(m_pw);
			member.setM_name(m_name);
			member.setM_email(m_email);
			member.setM_tel(m_tel);
			result = md.insert(member);
		} 
		else result = -1;
		request.setAttribute("result", result);
		return "join";
	}

}
