package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class DeleteAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(m_id);
		if (result > 0) 
			session.invalidate();
		request.setAttribute("result", result);
		return "delete";
	}

}
