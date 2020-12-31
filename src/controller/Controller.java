package controller;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CommandProcess;

@WebServlet(urlPatterns="*.do",
	initParams={@WebInitParam(name="config",//이름 config
	value="/WEB-INF/command.properties")})  // 이름에 대한 값
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<>();
	public void init(ServletConfig config) throws ServletException { 
	   	String props = config.getInitParameter("config");
	   	// props : "/WEB-INF/command.properties"
	   	Properties pr = new Properties();
	   	// Java 11장 Properties클래스의 특징 키=값을 가진 Map을 구현
	    FileInputStream f = null;
	    try {
	          String configFilePath = 
	         		config.getServletContext().getRealPath(props);
	          // configFilePath 실제 사용할 위치에 있는 이름
	          f = new FileInputStream(configFilePath);
	          pr.load(f);
	          // pr에는 command.properties라는 file의 데이터를 사용
	          // =앞에 있는 hello.do을 key
	          // =뒤에 있는 ch13.service.Hello을 값
	    } catch (IOException e) { throw new ServletException(e);
	     } finally {
	          if (f != null) try { f.close(); } catch(IOException ex) {}
	     }
	     Iterator<Object> keyIter = pr.keySet().iterator();
	     // Message.do
	     while( keyIter.hasNext() ) {
	          String command = (String)keyIter.next(); 
	          // command : Message.do
	          String className = pr.getProperty(command); 
	          // className : service.Message문자
	          try {
	               Class<?> commandClass = Class.forName(className);
	               // commandClass : service.Message 클래스 생성
	               Object commandInstance = commandClass.newInstance();
	               // commandInstance : service.Message객체
	               commandMap.put(command, commandInstance);
	               // commnadMap에는
	               // key가 Message.do
	               // 값이 Message객체
	          } catch (Exception e) {
	               throw new ServletException(e);
	          }
	     }
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
		String view = null;
	    CommandProcess com=null;
	    try { 
	    	  String command = request.getRequestURI();
	    	  //url : http://localhost:8080/ch13/message.do
	    	  // command, uri : /ch13/Message.do
	    	  // request.getContextPath() : /ch13
	    	  // request.getContextPath().length()+1 : 6
		      command = command.substring(
		    		 request.getContextPath().length()+1); 
		      // command : Message.do
	          com = (CommandProcess)commandMap.get(command); 
	          // com : service.Message객체를 CommandProcess로 형변환
	          // 자식 즉 Message객체의 requestPro()메소드 실행
	          view = com.requestPro(request, response);
	          // view는 "message" 문자
	    } catch(Throwable e) { throw new ServletException(e); } 
	    RequestDispatcher dispatcher =
	      	request.getRequestDispatcher(
	      		"/WEB-INF/views/"+view+".jsp");
	   dispatcher.forward(request, response);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
    		request.setCharacterEncoding("utf-8");
    		doGet(request, response);
	}
}