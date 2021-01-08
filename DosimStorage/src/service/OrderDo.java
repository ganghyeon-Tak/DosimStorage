package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderDo implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String branch = request.getParameter("branch");
		String storage = request.getParameter("storage");
		int period = Integer.parseInt(request.getParameter("period"));
		int tot_price = Integer.parseInt(request.getParameter("tot_price"));
		String bank = request.getParameter("bank");
		String account_no = request.getParameter("account_no");
		
		return "orderDo";
	}

}
