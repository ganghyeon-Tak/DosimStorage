package service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;
import model.Order;
import model.Storage_list;

public class OrderDo implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {		
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
		// 원하는 지점과 창고타입 중 사용가능하고 주문안된 첫번째 창고코드를 st_code에 저장
		// 주문도중 먼저 매진된 상황 예외처리		
		try {
			st_code = od.sel_st(sl);	// 사용가능하고 주문자 없는 첫번째 창고코드 저장
			// 해당 창고에 주문자 비어있을 경우 기록
			// 만약 거의 동시에 같은 창고에 주문한다면, 두번째 주문은 에러 발생하게 처리
			// 실제 동시주문상황 발생시켜 테스트하는 방법을 모르겠어서 검증은 못해봤습니다
			int result1 = od.update_st(st_code);	
			if (result1 == 0)
				return "orderErr";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "orderErr";
		}		
		Order ord = new Order();
		ord.setM_id(m_id);
		ord.setSt_code(st_code);
		ord.setOrder_totalPrice(tot_price);
		ord.setHope_date(hope_date);
		ord.setUse_period(period);
		ord.setAccount_no(account_no);
		int result2 = od.insOrder(ord);
		// 데이터 입력에 실패했을 경우, od.update_st(st_code) 실행결과 원래대로 되돌리는 쿼리 실행		
		if (result2 == 0) {
			od.restore(st_code);
		}
		request.setAttribute("result", result2);
		return "orderDo";
	}
}
