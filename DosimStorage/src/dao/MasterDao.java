package dao;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Master;

public class MasterDao {

	private static MasterDao instance = new MasterDao();

	private MasterDao() {
	}

	public static MasterDao getInstance() {
		return instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("m_configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println("초기화에러 : " + e.getMessage());
		}
	}
	public int insert(Master master) {
		return session.insert("masterns.insert",master);
	}
	public Master select(String master_id) {
		return (Master)session.selectOne("masterns.select", master_id);
	}
	public int update(Master master) {
		return session.update("masterns.update", master);
	}
	public int delete(String master_id) {
		return session.update("masterns.delete", master_id);
	}
}
