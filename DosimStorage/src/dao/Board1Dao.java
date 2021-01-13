package dao;
import java.io.IOException;
import java.io.Reader;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board1;
public class Board1Dao {
	private static Board1Dao instance = new Board1Dao();

	private Board1Dao() {
	}

	public static Board1Dao getInstance() {
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
				return (int) session.selectOne("board1ns.count");
	}
	public ArrayList<Board1> getBoardList() {
		
		return (ArrayList<Board1>) session.selectList("board1ns.getBoardList");
	}
	public int getNextNum() {
		return (int) session.selectOne("board1ns.getNextNum");
	}

	public int insert(Board1 board) {
		return session.insert("board1ns.insert", board);
	}

	public Board1 select(int num) {
		return (Board1) session.selectOne("board1ns.select", num);
	}

	public int delete(int num) {
			return session.update("board1ns.delete", num);
	}

	public void updateReadCount(int num) {
		session.update("board1ns.updateReadCount", num);
		
	}
	
}
