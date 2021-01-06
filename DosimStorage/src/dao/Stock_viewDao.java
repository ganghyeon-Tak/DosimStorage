package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



public class Stock_viewDao {
	// singleton
	private static Stock_viewDao instance = new Stock_viewDao();
	private Stock_viewDao() {}
	public static Stock_viewDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {  // 클래스변수 초기화 블럭
		try {  // myBatis를 이용해서 DB를 연동
			Reader reader =
				Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = 
				new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println("초기화에러 : "+e.getMessage());
		}
	}
	@SuppressWarnings("unchecked")
	public List<String> select() {		
		return session.selectList("stock_viewns.select");
		
	}
	
}