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

	// 입금대기중인 주문 리스트
	@SuppressWarnings("unchecked")
	public List<MasterOrderView> waitDeposit() {		
		return session.selectList("masterOrderViewns.waitDeposit");
	}

	// 한건 입금완료처리
	public int depositOne(long order_no) {		
		return session.update("orderns.depositOne", order_no);
	}
	
	// 여러건 입금완료처리
	public int depositAll(List<Long> list) {		
		return session.update("orderns.depositAll", list);
	}

	// 만기일 입력(여러건)
	public int expireUpdateAll(List<Long> list) {		
		return session.update("orderns.expireUpdateAll", list);
	}
	
	// 만기일 입력(한건)
	public int expireUpdateOne(long order_no) {		
		return session.update("orderns.expireUpdateOne", order_no);
	}
	
	// 입금기한을 넘겼으나 입금안된 주문건 리스트
	@SuppressWarnings("unchecked")
	public List<MasterOrderView> timeoutList() {		
		return session.selectList("masterOrderViewns.timeoutList");
	}
	
	// 전체선택해서 취소했을때
	public int cancelAll(List<Long> list) {		
		return session.update("orderns.cancelAll", list);
	}
	
	// 한 건 취소시킴
	public int cancelOne(long order_no) {		
		return session.update("orderns.cancelOne", order_no);	
	}
	
	// list에 들어있는 주문번호 주문건 취소시킴	
	public int userCancel(List<Long> list) {		
		return session.update("orderns.userCancel", list);
	}	
	
	// 입금대기 & 입금완료 상태인 주문번호만 담긴 리스트 반환
	@SuppressWarnings("unchecked")
	public List<Long> wholeList() {	
		return session.selectList("orderns.wholeList");
	}
	
	// 전체주문조회
	@SuppressWarnings("unchecked")
	public List<MasterOrderView> allList(List<Integer> startEnd) {		
		return session.selectList("masterOrderViewns.allList", startEnd);
	}
	
	// 옵션에 맞는 주문 조회 // 수정해야함
	@SuppressWarnings("unchecked")
	public List<MasterOrderView> selList(String opt) {		
		return session.selectList("masterOrderViewns.selList", opt);
	}
	
	// 전체 주문 수 카운트
	public int totAllList() {		
		return (int)session.selectOne("masterOrderViewns.totAllList");
	}

	// 입금대기 주문 수 카운트
	public int totWaitList() {
		return (int)session.selectOne("masterOrderViewns.totWaitList");
	}
	
	// 입금대기 주문 조회
	@SuppressWarnings("unchecked")
	public List<MasterOrderView> selWaitList(List<Integer> startEnd) {		
		return session.selectList("masterOrderViewns.selWaitList", startEnd);
	}

	// 입금완료 주문 수 카운트
	public int totDepositList() {
		return (int)session.selectOne("masterOrderViewns.totDepositList");
	}
		
	// 입금완료 주문 조회
	@SuppressWarnings("unchecked")
	public List<MasterOrderView> selDepositList(List<Integer> startEnd) {		
		return session.selectList("masterOrderViewns.selDepositList", startEnd);
	}
	
	// 취소된 주문 수 카운트
	public int totCancelList() {
		return (int)session.selectOne("masterOrderViewns.totCancelList");
	}
		
	// 취소된 주문 조회
	@SuppressWarnings("unchecked")
	public List<MasterOrderView> selCancelList(List<Integer> startEnd) {		
		return session.selectList("masterOrderViewns.selCancelList", startEnd);
	}
	
	// 지점코드 입력해 해당지점 입금대기 주문 반환
	@SuppressWarnings("unchecked")
	public List<MasterOrderView> waitBrDeposit(String br) {		
		return session.selectList("masterOrderViewns.waitBrDeposit", br);
	}

	// 지점코드 입력해 해당지점 입금기한초과 주문 반환
	@SuppressWarnings("unchecked")
	public List<MasterOrderView> timeoutBrList(String br) {		
		return session.selectList("masterOrderViewns.timeoutBrList", br);
	}	
}
