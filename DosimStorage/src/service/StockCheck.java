package service;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Stock_viewDao;


//	재고체크해서 매진된 항목 사용불가 표시하는 것이 목적
public class StockCheck implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Stock_viewDao svd = Stock_viewDao.getInstance();
			
		List<String> soldout = new ArrayList<String>();
		// 해당 타입의 창고가 모두 소진된 지점이 타입+지점코드 형태로 list에 저장됨
		soldout = svd.select();		
		request.setAttribute("soldout", soldout);		
		return "stockCheck";
	}

}
