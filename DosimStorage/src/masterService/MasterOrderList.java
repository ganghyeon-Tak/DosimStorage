package masterService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;
import model.MasterOrderView;

public class MasterOrderList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String list_opt = request.getParameter("list_opt");
		String br = request.getParameter("br");
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
		List<MasterOrderView> list = new ArrayList<MasterOrderView>();
		// 시작번호 끝번호 map에 담음. 경우에 따라 지점코드도 담을 hashmap
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		// switch로 검색조건, if else로 지점 분류
		switch (list_opt) {
		case "1":	// 전체검색
			if (br.equals("0")) {	// 전체지점
				tot = md.totAllList();
				list = md.allList(map);
			} else {	// 각 지점
				tot = md.totBrAllList(br);				
				map.put("br", Integer.parseInt(br));
				list = md.brAllList(map);
			}			
			break;
		case "2":	// 입금대기건
			if (br.equals("0")) {	// 전체지점
				tot = md.totWaitList();
				list = md.selWaitList(map);				
			} else {	// 각 지점
				tot = md.totBrWaitList(br);
				map.put("br", Integer.parseInt(br));
				list = md.brWaitList(map);
			}
			break;
		case "3":	// 입금완료건
			if (br.equals("0")) {	// 전체지점
				tot = md.totDepositList();
				list = md.selDepositList(map);
			} else {	// 각 지점
				tot = md.totBrDepositList(br);
				map.put("br", Integer.parseInt(br));
				list = md.brDepositList(map);
			}			
			break;
		case "4":	// 주문취소건
			if (br.equals("0")) {	// 전체지점
				tot = md.totCancelList();
				list = md.selCancelList(map);
			} else {	// 각 지점
				tot = md.totBrCancelList(br);
				map.put("br", Integer.parseInt(br));
				list = md.brCancelList(map);
			}			
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
		request.setAttribute("br", br);
		return "masterOrderList";
	}
}
