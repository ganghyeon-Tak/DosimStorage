package board;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Board1;
import dao.Board1Dao;

public class WriteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pageNum = request.getParameter("pageNum");
		String ip = request.getRemoteAddr(); //
		Board1Dao dbd = Board1Dao.getInstance();
		int nextNum = dbd.getNextNum();
		Board1 board = new Board1();
		board.setNum(nextNum);
		board.setContent(content);
		board.setTitle(title);
		board.setIp(ip);
		board.setReadcount(0);
		board.setRef(nextNum);
		board.setRef_level(0);
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		board.setM_id(m_id);
		
		
		
		int result = dbd.insert(board);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "write";
	}
}