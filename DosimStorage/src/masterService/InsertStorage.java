package masterService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;

public class InsertStorage implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String br = request.getParameter("br");
		int br_num = Integer.parseInt(br);
		String st = request.getParameter("st");
		String s_kind = "";
		switch (st) {
		case "s":
			s_kind = "small";
			break;
		case "m":
			s_kind = "medium";
			break;
		default:
			s_kind = "large";
		}
		int num = Integer.parseInt(request.getParameter("num"));
		int cnt = 0;
		String code = st + br;
		MasterDao md = MasterDao.getInstance();
		cnt = md.stCount(code);
		String st_code = "";
		int result = 0;
		List<String> list = new ArrayList<String>();
		Map<String, String> code2 = new HashMap<String, String>();
		code2.put("br", br);
		code2.put("s_kind", s_kind);		
		
		for (int i=1; i<=num; i++) {
			st_code = st + (br_num*10000 + cnt + i);
			code2.put("st_code", st_code);
			result += md.insSt(code2);
			list.add(st_code);
		}
		request.setAttribute("list", list);
		request.setAttribute("result", result);
		return "insertStorage";
	}

}
