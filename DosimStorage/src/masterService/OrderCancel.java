package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;

public class OrderCancel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MasterDao md = MasterDao.getInstance();
		int result = 0;
		try {
			String[] timeout_list = request.getParameterValues("timeout_list");
			List<Long> list = new ArrayList<Long>();
			for(String t:timeout_list) {
				list.add(Long.parseLong(t));
			}
			result = md.cancelAll(list);			
		} catch (Exception e) {
			long order_no = Long.parseLong(request.getParameter("order_no"));
			result = md.cancelOne(order_no);			
		}		
		request.setAttribute("result", result);
		return "orderCancel";
	}

}
