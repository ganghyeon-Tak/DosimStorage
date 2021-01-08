package service;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DsBoard1;
import dao.DsBoard1Dao;
public class ListAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		DsBoard1Dao dbd = DsBoard1Dao.getInstance();
		int total = dbd.count();  // 게시글 겟수 저장
		ArrayList<DsBoard1> list = dbd.getMemberList();
		request.setAttribute("total",total);
		request.setAttribute("list", list);

		return "list";
	}
}