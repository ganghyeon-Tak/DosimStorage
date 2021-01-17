package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Master;
import model.MasterOrderView;

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

	@SuppressWarnings("unchecked")
	public List<MasterOrderView> waitDeposit() {		
		return session.selectList("masterOrderViewns.waitDeposit");
	}

	public int depositOne(long order_no) {		
		return session.update("orderns.depositOne", order_no);
	}

	public int depositAll(List<Long> list) {		
		return session.update("orderns.depositAll", list);
	}

	public int expireUpdateAll(List<Long> list) {		
		return session.update("orderns.expireUpdateAll", list);
	}
	public int expireUpdateOne(long order_no) {		
		return session.update("orderns.expireUpdateOne", order_no);
	}

	@SuppressWarnings("unchecked")
	public List<MasterOrderView> timeoutList() {		
		return session.selectList("masterOrderViewns.timeoutList");
	}

	public int cancelAll(List<Long> list) {		
		return session.update("orderns.cancelAll", list);
	}

	public int cancelOne(long order_no) {		
		return session.update("orderns.cancelOne", order_no);	
	}

	public int userCancel(List<Long> list) {		
		return session.update("orderns.userCancel", list);
	}	

	@SuppressWarnings("unchecked")
	public List<Long> wholeList() {	
		return session.selectList("orderns.wholeList");
	}
	
}
