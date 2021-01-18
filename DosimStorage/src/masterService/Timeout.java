package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;
import model.MasterOrderView;

public class Timeout implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MasterDao md = MasterDao.getInstance();
		String br = request.getParameter("br");
		List<MasterOrderView> timeoutList = new ArrayList<MasterOrderView>();
		switch (br) {
		case "0":
			timeoutList = md.timeoutList();
			break;
		case "1":			
		case "2":			
		case "3":			
			timeoutList = md.timeoutBrList(br);			
		}		
		request.setAttribute("br", br);
		request.setAttribute("timeoutList", timeoutList);
		return "timeout";
	}
}