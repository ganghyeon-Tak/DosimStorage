package masterService;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class MasterMemberList implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
	return "m_memberList";
	}

}
