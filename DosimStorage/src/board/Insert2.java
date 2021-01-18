package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board2Dao;
import model.Board2;

public class Insert2 implements CommandProcess {

//	아직 입력하는 부분 미완성
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pageNum = request.getParameter("pageNum");
		String ip = request.getRemoteAddr(); 
		Board2Dao bd2 = Board2Dao.getInstance();
		// Board2 board2 = bd2.select(num);
		int nextNum = bd2.getNextNum();
		Board2 board = new Board2();
		board.setNum(nextNum);
		board.setContent(content);
		board.setTitle(title);
		board.setIp(ip);
		board.setReadcount(0);
		board.setRef(nextNum);
		board.setRef_level(0);
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("writer");
		board.setWriter(writer);
		
		int result = bd2.insert(board);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "insert2";
	}

}
