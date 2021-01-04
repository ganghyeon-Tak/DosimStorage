package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class UpdateDo implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");		
		String m_email = request.getParameter("m_email");
		String m_tel = request.getParameter("m_tel");
		
		MemberDao md = MemberDao.getInstance();
		Member member = new Member();
		member.setM_id(m_id);
		member.setM_pw(m_pw);
		member.setM_name(m_name);
		member.setM_email(m_email);
		member.setM_tel(m_tel);
		int result = md.update(member); // memberDao에 update메소드없어서 빨간줄
		request.setAttribute("result", result);
		return "update";
	}

}
