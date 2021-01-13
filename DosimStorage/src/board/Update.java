package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board1Dao;
import model.Board1;

public class Update implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum=request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Board1 board = new Board1();
		board.setContent(content);
		board.setTitle(title);
		board.setNum(num);
		Board1Dao dbd = Board1Dao.getInstance();
		int result = dbd.update(board);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num",num);
		return "update";
	}

}
