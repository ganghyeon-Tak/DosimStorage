package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BranchInfo implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String br = request.getParameter("br");
		if (br.equals("") || br.equals(null)) br = "1";
		request.setAttribute("br", br);
		return "branchInfo";
	}

}
