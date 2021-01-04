package dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	// singleton
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
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
	public int insert(Member ds_member) {
		return session.insert("memberns.insert",ds_member);
	}
	public Member select(String m_id) {
		return (Member)session.selectOne("memberns.select", m_id);
	}
	
	
}
