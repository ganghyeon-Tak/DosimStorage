package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;

public class UserCancel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String[] order_no = request.getParameterValues("order_no");
		MasterDao md = MasterDao.getInstance();
		// 취소폼에 입력된 값 담은 리스트
		List<Long> list = new ArrayList<Long>();
		for (String n:order_no) {
			list.add(Long.parseLong(n));
		}
		// 입금대기중인 주문번호가 전부 들어있는 리스트
		List<Long> wholeList = new ArrayList<Long>();
		wholeList = md.wholeList();
		// 취소처리
		int result = md.userCancel(list);
		// list - wholeList : 잘못 입력된 주문번호들
		// 입금완료돼서 이용중인 서비스 취소는 여기서 안됩니다		
		list.removeAll(wholeList);
		request.setAttribute("result", result);
		request.setAttribute("list", list);
		return "userCancel";
	}

}
