package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String selected_branch = request.getParameter("");
		String selected_storage = request.getParameter("");
		
		return "orderForm";
	}

}
