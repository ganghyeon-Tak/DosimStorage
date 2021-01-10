package board;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DsBoard1;
import dao.DsBoard1Dao;

public class WriteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr(); //ip
		DsBoard1Dao dbd = DsBoard1Dao.getInstance();
		int nextNum = dbd.getNextNum();
		DsBoard1 board = new DsBoard1();
		board.setNum(nextNum);
		board.setContent(content);
		board.setTitle(title);
		board.setIp(ip);
		board.setReadcount(0);
		board.setRef(nextNum);
		board.setRef_level(0);
		HttpSession session = request.getSession();
		String m_id = session.getId();
		return "write";
	}

}
