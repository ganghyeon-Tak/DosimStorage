package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board1Dao;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum=request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		Board1Dao dbd = Board1Dao.getInstance();
		int result = dbd.delete(num);
		request.setAttribute("result",result);
		request.setAttribute("pageNum",pageNum);
		return "delete";
	}

}
