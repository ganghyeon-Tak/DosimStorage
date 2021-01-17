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
		List<Long> list = new ArrayList<Long>();
		for (String n:order_no) {
			list.add(Long.parseLong(n));
		}
		List<Long> wholeList = new ArrayList<Long>();
		wholeList = md.wholeList();		
		int result = md.userCancel(list);
		list.removeAll(wholeList);
		request.setAttribute("result", result);
		request.setAttribute("list", list);
		return "userCancel";
	}

}
