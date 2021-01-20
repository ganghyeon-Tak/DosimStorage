package dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Order;
import model.Storage_list;

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
				Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = 
				new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println("초기화에러 : "+e.getMessage());
		}
	}	
	
	// 은행 입력받고 계좌번호 반환
	public String select_ac(String bank) {
		return (String)session.selectOne("accountns.select_ac", bank);
	}
	
	// 은행 입력받고 예금주 반환
	public String select_an(String bank) {
		return (String)session.selectOne("accountns.select_an", bank);
	}
	
	// 창고타입 입력받고 한달대여가격 반환
	public int sel_price(String storage) {		
		return (int)session.selectOne("servicens.sel_price", storage);
	}
	
	// 창고타입, 지점코드가 들어있는 Storage_list 개체 입력해서 이용가능한 창고의 창고코드 하나 반환
	public String sel_st(Storage_list sl) {		
		return (String)session.selectOne("storage_listns.sel_st", sl);
	}
	
	// 주문입력
	public int insOrder(Order ord) {		
		return session.insert("orderns.insOrder", ord);
	}
	
	// 거의 동시에 두개 주문이 들어왔을 때, 뒤의 주문에서 에러를 발생시키기 위한 쿼리
	public int update_st(String st_code) {		
		return session.update("storage_listns.update_st", st_code);
	}
	
	// 주문입력에 실패했을때 중복입력 막기 위해 사용불가 처리했던 창고를 다시 사용가능하게 하는 쿼리
	public void restore(String st_code) {
		session.update("storage_listns.restore", st_code);
	}
	public int countUsable(Storage_list sl) {		
		return (int)session.selectOne("storage_listns.countUsable", sl);
	}	
}
