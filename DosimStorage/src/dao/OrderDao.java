package dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class OrderDao {
	// singleton
	private static OrderDao instance = new OrderDao();
	private OrderDao() {}
	public static OrderDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {  // 클래스변수 초기화 블럭
		try {  // myBatis를 이용해서 DB를 연동
			Reader reader =
				Resources.getResourceAsReader("configulation.xml");
			SqlSessionFactory ssf = 
				new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println("초기화에러 : "+e.getMessage());
		}
	}	
	
	public String select_ac(String bank) {
		return (String)session.selectOne("accountns.select_ac", bank);
	}
	public String select_an(String bank) {
		return (String)session.selectOne("accountns.select_an", bank);
	}
}
