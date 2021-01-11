package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
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
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println("초기화에러 : " + e.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	public List<OrderList> select(String m_id) {
		return (List<OrderList>) session.selectList("orderListns.select", m_id);
	}
}
