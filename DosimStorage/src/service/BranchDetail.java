package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BranchDetail implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String br = request.getParameter("br");
		String page = "";	// 리턴할 jsp 페이지 이름
		switch (br) {
		case "1":
			page = "branchDetail1";
			break;
		case "2":
			page = "branchDetail2";
			break;
		case "3":
			page = "branchDetail3";		
		}
		return page;
	}

}
