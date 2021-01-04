package test;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class TestClass implements CommandProcess{	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "test";
	}
}
