package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;
import model.MasterOrderView;

public class WaitDeposit implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MasterDao md = MasterDao.getInstance();
		List<MasterOrderView> list = new ArrayList<MasterOrderView>();
		list = md.waitDeposit();		
		request.setAttribute("list", list);		
		return "waitDeposit";
	}

}
