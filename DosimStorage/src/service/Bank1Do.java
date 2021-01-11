package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDao;

public class Bank1Do implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String bank = request.getParameter("bank");			
		OrderDao ad = OrderDao.getInstance();
		String account_name = ad.select_an(bank);		
		request.setAttribute("account_name", account_name);
		return "bank1";
	}

}
