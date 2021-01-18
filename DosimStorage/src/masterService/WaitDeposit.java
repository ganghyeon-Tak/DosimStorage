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
		String br = request.getParameter("br");		
		List<MasterOrderView> list = new ArrayList<MasterOrderView>();
		switch (br) {
		case "0":
			list = md.waitDeposit();
			break;
		case "1":			
		case "2":			
		case "3":			
			list = md.waitBrDeposit(br);			
		}			
		request.setAttribute("list", list);
		request.setAttribute("br", br);		
		return "waitDeposit";
	}
}