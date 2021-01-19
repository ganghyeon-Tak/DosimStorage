package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;
import model.Storage_list;

public class MasterStorageList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String br = request.getParameter("br");
		List<String> br_list = new ArrayList<String>();
		if (br.equals("0")) {
			br_list.add("1"); br_list.add("2"); br_list.add("3");
		} else {
			br_list.add(br);
		}
		MasterDao md = MasterDao.getInstance();
		List<Storage_list> list = new ArrayList<Storage_list>();
		list = md.stList(br_list);		
		request.setAttribute("list", list);
		request.setAttribute("br", br);
		return "masterStorageList";
	}

}
