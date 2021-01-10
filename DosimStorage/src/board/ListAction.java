package board;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board1Dao;
import model.Board1;


public class ListAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board1Dao dbd = Board1Dao.getInstance();
		System.out.println("1");
		int total = dbd.count();  // 게시글 겟수 저장
		System.out.println("2");
		ArrayList<Board1> list = dbd.getMemberList();
		request.setAttribute("total",total);
		request.setAttribute("list", list);

		return "list";
	}
}