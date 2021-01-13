package board;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board1Dao;
import model.Board1;

public class Content implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		Board1Dao dbd = Board1Dao.getInstance();
		dbd.updateReadCount(num);
		Board1 board = dbd.select(num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		return "content";
	}

}
