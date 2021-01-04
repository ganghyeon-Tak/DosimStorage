package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;


public class MainAfter implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//                            세션 시작 메서드
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		MemberDao md = MemberDao.getInstance();
		if (m_id != null) {
			Member ds_member = md.select(m_id);
			request.setAttribute("ds_member", ds_member);
		}
		return "mainAfter";
	}

		
}
