package board;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board1Dao;
import model.Board1;


public class ListAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board1Dao dbd = Board1Dao.getInstance();
		int total = dbd.count();  // 게시글 겟수 저장
		ArrayList<Board1> list = dbd.getBoardList();
		request.setAttribute("total",total);
		request.setAttribute("list", list);
//		views밑에 board폴더 안에 있는 list
		return "list";
	}
}