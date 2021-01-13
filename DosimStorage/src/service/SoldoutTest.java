package service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;
import model.Order;
import model.Storage_list;

public class SoldoutTest implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result1 = 0, result2 = 0;
		HttpSession session = request.getSession();		
		String m_id = (String)session.getAttribute("m_id");		
		int branch = Integer.parseInt(request.getParameter("branch"));		
		Date hope_date = Date.valueOf(request.getParameter("hope_date"));
		String storage = request.getParameter("storage");
		int period = Integer.parseInt(request.getParameter("period"));
		int tot_price = Integer.parseInt(request.getParameter("tot_price"));		
		String account_no = request.getParameter("account_no");		
		OrderDao od = OrderDao.getInstance();
		Storage_list sl = new Storage_list();
		sl.setB_code(branch);
		sl.setS_kind(storage);
		String st_code = "";
		for(int i = 0; i<9; i++) {
			st_code = od.sel_st(sl);
			result1 += od.update_st(st_code);
			Order ord = new Order();
			ord.setM_id(m_id);
			ord.setSt_code(st_code);
			ord.setOrder_totalPrice(tot_price);
			ord.setHope_date(hope_date);
			ord.setUse_period(period);
			ord.setAccount_no(account_no);
			result2 += od.insOrder(ord);			
		}
		request.setAttribute("result1", result1);
		request.setAttribute("result2", result2);
		return "test";
	}

}
