package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDao;

public class BankDo implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String bank = request.getParameter("bank");			
		OrderDao ad = OrderDao.getInstance();
		String account = ad.select_ac(bank);
		System.out.println(account);
		request.setAttribute("account", account);
		return "bank";
	}

}
