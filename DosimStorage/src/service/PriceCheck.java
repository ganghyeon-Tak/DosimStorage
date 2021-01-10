package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDao;

public class PriceCheck implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {		
		String storage = request.getParameter("storage");		
		int period = Integer.parseInt(request.getParameter("period"));		
		OrderDao od = OrderDao.getInstance();
		int price = od.sel_price(storage);
		int tot_price = price * period;
		request.setAttribute("tot_price", tot_price);
		return "priceCheck";
	}

}
