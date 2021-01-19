package masterService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;

public class OpenStorage implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		MasterDao md = MasterDao.getInstance();
		try {
			String st_code = request.getParameter("st_code");
			result = md.openSt(st_code);			
		} catch (Exception e) {
			String[] st_code_list = request.getParameterValues("st_code_list");
			List<String> list = new ArrayList<String>(Arrays.asList(st_code_list));
			result = md.openStList(list);
		}		
		request.setAttribute("result", result);
		return "openStorage";
	}

}
