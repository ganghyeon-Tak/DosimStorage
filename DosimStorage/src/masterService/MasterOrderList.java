package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;
import model.MasterOrderView;

public class MasterOrderList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String list_opt = request.getParameter("list_opt");		
		MasterDao md = MasterDao.getInstance();
		int rowPerPage = 10; // 한페이지 보여주는 row갯수
		int pagePerBlock = 10; // 한 블럭에 몇 페이지
		int tot = 0; // 조회할 리스트 총 건수
		String pageNum = request.getParameter("pageNum");		
		int currentPage = Integer.parseInt(pageNum);
		// 시작번호 = (페이지번호 - 1)*페이지 당 글 수 + 1;
		int startRow = (currentPage-1)*rowPerPage + 1;
		// 끝번호 = 시작번호 + 페이당 글수 - 1;
		int endRow = startRow + rowPerPage - 1;
		List<Integer> startEnd = new ArrayList<Integer>();
		startEnd.add(startRow);
		startEnd.add(endRow);
		List<MasterOrderView> list = new ArrayList<MasterOrderView>();
		switch (list_opt) {
		case "1":
			tot = md.totAllList();
			list = md.allList(startEnd);
			break;
		case "2":			
			break;
		case "3":		
			break;
		case "4":			
		}
		int totalPage = (int)Math.ceil((double)tot / rowPerPage);
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		request.setAttribute("list_opt", list_opt);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		return "masterOrderList";
	}
}
