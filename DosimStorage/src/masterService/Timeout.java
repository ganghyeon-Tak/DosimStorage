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
		List<MasterOrderView> timeoutList = new ArrayList<MasterOrderView>();
		timeoutList = md.timeoutList();
		request.setAttribute("timeoutList", timeoutList);
		return "timeout";
	}

}
