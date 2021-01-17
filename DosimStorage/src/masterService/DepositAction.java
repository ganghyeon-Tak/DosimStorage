package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;

public class DepositAction implements CommandProcess {	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MasterDao md = MasterDao.getInstance();
		int result = 0;
		try {
			String[] deposit_list = request.getParameterValues("deposit_list");
			List<Long> list = new ArrayList<Long>();
			for(String d:deposit_list) {
				list.add(Long.parseLong(d));
			}
			result = md.depositAll(list);
			result += md.expireUpdateAll(list);
		} catch (Exception e) {
			long order_no = Long.parseLong(request.getParameter("order_no"));
			result = md.depositOne(order_no);
			result += md.expireUpdateOne(order_no);
		}		
		request.setAttribute("result", result);
		return "deposit";
	}

}
