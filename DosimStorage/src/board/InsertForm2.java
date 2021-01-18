package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;

public class InsertForm2 implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(m_id);
		request.setAttribute("member", member);
		return "insertForm2";
	}

}
