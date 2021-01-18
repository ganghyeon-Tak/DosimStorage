package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;
import model.MasterOrderView;

public class MasterSelectList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String list_opt = request.getParameter("list_opt");
		String opt = "";
		MasterDao md = MasterDao.getInstance();
		List<MasterOrderView> list = new ArrayList<MasterOrderView>();
		switch (list_opt) {
		case "1":
			list = md.allList();
			break;
		case "2":
			opt = "입금대기";
			list = md.selList(opt);
			break;
		case "3":
			opt = "입금완료";
			list = md.selList(opt);
			break;
		case "4":
			opt = "주문취소";	
			list = md.selList(opt);
		}
		request.setAttribute("list", list);
		return "masterSelectList";
	}

}
