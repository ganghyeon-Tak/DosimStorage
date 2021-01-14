package masterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MasterMain implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		return "m_main";
	}

}
