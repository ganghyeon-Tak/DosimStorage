package masterService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;

public class ClosureStorage implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		int chk = 0;
		MasterDao md = MasterDao.getInstance();
		try {
			String st_code = request.getParameter("st_code");
			chk = md.chkOne(st_code);
			if (chk > 0 ) {
				return "closuerErr";
			}
			result = md.closuerSt(st_code);			
		} catch (Exception e) {
			String[] st_code_list = request.getParameterValues("st_code_list");
			List<String> list = new ArrayList<String>(Arrays.asList(st_code_list));
			chk = md.chkList(list);
			if (chk > 0 ) {
				return "closuerErr";
			}
			result = md.closuerStList(list);
		}		
		request.setAttribute("result", result);
		return "closureStorage";
	}

}
