package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
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
		Member ds_member = md.select(m_id);
		if (ds_member == null) {
			ds_member = new Member();
			ds_member.setM_id(m_id);
			ds_member.setM_pw(m_pw);
			ds_member.setM_name(m_name);
			ds_member.setM_email(m_email);
			ds_member.setM_tel(m_tel);
			result = md.insert(ds_member);
		} else result = -1;
		request.setAttribute("result", result);
		return "join";
	}

}
