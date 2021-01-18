package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board2;

public class Board2Dao {
	private static Board2Dao instance = new Board2Dao();

	private Board2Dao() {}
	public static Board2Dao getInstance() {
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
	public int count() {
		return (int) session.selectOne("board2ns.count");
	}
	public ArrayList<Board2> getBoardList() {

		return (ArrayList<Board2>) session.selectList("board2ns.getBoardList");
	}
	public int getNextNum() {
		return (int) session.selectOne("board2ns.getNextNum");
	}

	public int insert(Board2 board) {
		return session.insert("board2ns.insert", board);
	}

	public Board2 select(int num) {
		return (Board2) session.selectOne("board2ns.select", num);
	}

	public int delete(int num) {
		return session.update("board2ns.delete", num);
	}

	public void updateReadCount(int num) {
		session.update("board2ns.updateReadCount", num);

	}

	public int update(Board2 board) {
		return session.update("board2ns.update", board);
	}


}
