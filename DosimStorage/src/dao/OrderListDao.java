package dao;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.OrderList;

public class OrderListDao {

	private static OrderListDao instance = new OrderListDao();

	private OrderListDao() {
	}

	public static OrderListDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configulation.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println("초기화에러 : " + e.getMessage());
		}
	}

	public OrderList select(String m_id) {
		return (OrderList)session.selectOne("orderListns.select", m_id);
	}
}
