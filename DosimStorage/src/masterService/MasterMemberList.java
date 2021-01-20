package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;
import model.Member;

public class MasterMemberList implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MasterDao md = MasterDao.getInstance();
		List<Member> list = new ArrayList<Member>();
		list = md.memberList();
		request.setAttribute("list", list);
		return "m_memberList";
	}
}
