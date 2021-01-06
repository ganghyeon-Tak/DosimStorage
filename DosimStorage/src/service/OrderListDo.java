package service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderListDao;
import model.OrderList;

public class OrderListDo implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		OrderListDao old = OrderListDao.getInstance();
		OrderList orderList = old.select(m_id);
		if (orderList == null) {
			result = -1;
		}
		request.setAttribute("result", result);
		return "orderList";
	}

}