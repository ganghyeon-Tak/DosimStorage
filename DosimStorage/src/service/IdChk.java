package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
public class IdChk implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(m_id);
		String msg = "";
		if (member == null) msg="사용가능한 아이디입니다";
		else msg="사용중이니 다른 아이디를 쓰시오";
		
		request.setAttribute("msg", msg);
		return "idChk";
	}
}
