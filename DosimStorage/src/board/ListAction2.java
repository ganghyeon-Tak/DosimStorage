package board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board2Dao;
import model.Board2;

public class ListAction2 implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board2Dao bd2 = Board2Dao.getInstance();
		int total = bd2.count();  // 게시글 갯수 저장
		ArrayList<Board2> list = bd2.getBoardList();
		request.setAttribute("total",total);
		request.setAttribute("list", list);
		return "list2";
	}

}
