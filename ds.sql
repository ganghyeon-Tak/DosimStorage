-- 회원(member)
DROP TABLE ds_member CASCADE CONSTRAINTS;

-- 관리자(master)
DROP TABLE ds_master CASCADE CONSTRAINTS;

-- 지점(branch)
DROP TABLE ds_branch CASCADE CONSTRAINTS;

-- 창고서비스(service)
DROP TABLE ds_service CASCADE CONSTRAINTS;

-- 창고목록(storage_list)
DROP TABLE ds_storage_list CASCADE CONSTRAINTS;

-- 주문(order)
DROP TABLE ds_order CASCADE CONSTRAINTS;

-- 계좌(account)
DROP TABLE ds_account CASCADE CONSTRAINTS;

-- 1:1게시판(board1)
DROP TABLE ds_board1 CASCADE CONSTRAINTS;

-- Q&A게시판(board2)
DROP TABLE ds_board2 CASCADE CONSTRAINTS;



-- 회원(member)
CREATE TABLE ds_member (
	m_id      VARCHAR2(12) NOT NULL, -- 회원ID
	m_pw      VARCHAR2(12) NOT NULL, -- 회원PW
	m_name    VARCHAR2(20) NOT NULL, -- 이름
	m_email   VARCHAR2(20) NOT NULL, -- 이메일
	m_tel     VARCHAR2(20) NOT NULL, -- 전화번호
	m_regdate DATE         NOT NULL, -- 가입일
	total_use NUMBER(4)    NOT NULL, -- 누적이용일
	m_del     CHAR(1)      NOT NULL -- 탈퇴여부
);


-- 회원(member)
ALTER TABLE ds_member
    MODIFY m_regdate DEFAULT sysdate; -- 가입일
ALTER TABLE ds_member
    MODIFY total_use DEFAULT 0; -- 누적이용일
ALTER TABLE ds_member
    MODIFY m_del DEFAULT 'n'; -- 탈퇴여부
-- 회원(member)    
ALTER TABLE ds_member 
	ADD
		CONSTRAINT PK_member -- 회원(member) 기본키
		PRIMARY KEY (
			m_id -- 회원ID            
		);

-- 관리자(master)
CREATE TABLE ds_master (
	master_id VARCHAR2(12) NOT NULL, -- 관리자ID
	master_pw VARCHAR2(12) NOT NULL  -- 관리자PW
);

-- 관리자(master)
ALTER TABLE ds_master
	ADD
		CONSTRAINT PK_ds_master -- 관리자(master) 기본키
		PRIMARY KEY (
			master_id -- 관리자ID
		);

-- 지점(branch)
CREATE TABLE ds_branch (
	b_code  NUMBER(10)   NOT NULL, -- 지점코드
	b_title VARCHAR2(10) NOT NULL, -- 지점명
	b_tel   VARCHAR2(20) NOT NULL, -- 지점전화번호
	b_addr  VARCHAR2(50) NOT NULL  -- 지점주소
);

-- 지점(branch)
ALTER TABLE ds_branch
	ADD
		CONSTRAINT PK_ds_branch -- 지점(branch) 기본키
		PRIMARY KEY (
			b_code -- 지점코드
		);

-- 창고서비스(service)
CREATE TABLE ds_service (
	s_kind  VARCHAR2(10) NOT NULL, -- 창고서비스종류
	s_price NUMBER(10)   NOT NULL  -- 창고서비스가격
);

-- 창고서비스(service)
ALTER TABLE ds_service
	ADD
		CONSTRAINT PK_ds_service -- 창고서비스(service) 기본키
		PRIMARY KEY (
			s_kind -- 창고서비스종류
		);

-- 창고목록(storage_list)
CREATE TABLE ds_storage_list (
	st_code     VARCHAR2(10) NOT NULL, -- 창고코드
	b_code      NUMBER(10)   NOT NULL, -- 지점코드
	s_kind      VARCHAR2(10) NOT NULL, -- 창고서비스종류
	borrower_id VARCHAR2(12) NULL,     -- 대여자ID
	rented      CHAR(1)      NOT NULL, -- 대여중
	usable      CHAR(1)      NOT NULL -- 사용가능여부
);

-- 창고목록(storage_list)
ALTER TABLE ds_storage_list
	ADD
		CONSTRAINT PK_ds_storage_list -- 창고목록(storage_list) 기본키
		PRIMARY KEY (
			st_code -- 창고코드
		);

-- 창고목록(storage_list)
ALTER TABLE ds_storage_list
    MODIFY rented DEFAULT 'n'; -- 대여중
ALTER TABLE ds_storage_list
    MODIFY usable DEFAULT 'y';-- 사용가능여부

-- 주문(order)
CREATE TABLE ds_order (
	order_no         NUMBER(10)   NOT NULL, -- 주문번호
	m_id             VARCHAR2(12) NOT NULL, -- 회원ID
	st_code          VARCHAR2(10) NOT NULL, -- 창고코드
	order_totalPrice NUMBER(10)   NOT NULL, -- 주문총액
	order_date       DATE         NOT NULL, -- 주문일
	expire_date      DATE         NOT NULL, -- 이용만료일
	account_no       VARCHAR2(16) NOT NULL, -- 계좌번호
	depo_dueDate     DATE         NOT NULL, -- 입금기한
	order_state      VARCHAR2(16) NOT NULL -- 주문상태
);

-- 주문(order)
ALTER TABLE ds_order
	ADD
		CONSTRAINT PK_ds_order -- 주문(order) 기본키
		PRIMARY KEY (
			order_no -- 주문번호
		);

-- 주문(order)
ALTER TABLE ds_order
    MODIFY order_state DEFAULT '입금대기'; -- 주문상태

-- 계좌(account)
CREATE TABLE ds_account (
	account_no   VARCHAR2(16) NOT NULL, -- 계좌번호
	bank         VARCHAR2(10) NOT NULL, -- 은행
	account_name VARCHAR2(20) NOT NULL  -- 예금주
);

-- 계좌(account)
ALTER TABLE ds_account
	ADD
		CONSTRAINT PK_ds_account -- 계좌(account) 기본키
		PRIMARY KEY (
			account_no -- 계좌번호
		);

-- 1:1게시판(board1)
CREATE TABLE ds_board1 (
	num       NUMBER        NOT NULL, -- 게시글번호
	m_id      VARCHAR2(12)  NOT NULL, -- 회원ID
	order_no  NUMBER(10)    NULL,     -- 주문번호
	m_email   VARCHAR2(20)  NULL,     -- 이메일
	title     VARCHAR2(50)  NOT NULL, -- 제목
	content   VARCHAR2(100) NOT NULL, -- 내용
	readcount NUMBER        NOT NULL, -- 조회수
	ip        VARCHAR2(39)  NULL,     -- 아이피
	ref       NUMBER        NOT NULL, -- 참조번호
	ref_level NUMBER        NOT NULL, -- 참조레벨
	reg_date  DATE          NOT NULL, -- 작성일
	reply     CHAR(1)       NULL     , -- 답변여부
	del       CHAR(1)       NOT NULL -- 삭제여부
);

-- 1:1게시판(board1)
ALTER TABLE ds_board1
	ADD
		CONSTRAINT PK_ds_board1 -- 1:1게시판(board1) 기본키
		PRIMARY KEY (
			num -- 게시글번호
		);
        
-- 1:1게시판(board1)
ALTER TABLE ds_board1
    MODIFY readcount DEFAULT 0; -- 조회수
ALTER TABLE ds_board1
    MODIFY reg_date DEFAULT sysdate; -- 작성일
ALTER TABLE ds_board1
    MODIFY reply DEFAULT 'n'; -- 답변여부
ALTER TABLE ds_board1
    MODIFY del DEFAULT 'n'; -- 삭제여부
    
-- Q&A게시판(board2)
CREATE TABLE ds_board2 (
	num       NUMBER        NOT NULL, -- 게시글번호
	writer    VARCHAR2(20)  NOT NULL, -- 작성자
	password  VARCHAR2(12)  NULL,     -- 비밀번호
	email     VARCHAR2(20)  NULL,     -- 이메일
	title     VARCHAR2(50)  NOT NULL, -- 제목
	content   VARCHAR2(100) NOT NULL, -- 내용
	readcount NUMBER        NOT NULL, -- 조회수
	ip        VARCHAR2(39)  NULL,     -- 아이피
	ref       NUMBER        NOT NULL, -- 참조번호
	ref_level NUMBER        NOT NULL, -- 참조레벨
	reg_date  DATE          NOT NULL, -- 작성일
	private   CHAR(1)       NOT NULL, -- 비밀글
	reply     CHAR(1)       NULL, -- 답변여부
	del       CHAR(1)       NOT NULL -- 삭제여부
);

-- Q&A게시판(board2)
ALTER TABLE ds_board2
	ADD
		CONSTRAINT PK_ds_board2 -- Q&A게시판(board2) 기본키
		PRIMARY KEY (
			num -- 게시글번호
		);
        
-- Q&A게시판(board2)
ALTER TABLE ds_board2
    MODIFY readcount DEFAULT 0; -- 조회수
ALTER TABLE ds_board2
    MODIFY reg_date DEFAULT sysdate; -- 작성일
ALTER TABLE ds_board2
    MODIFY reply DEFAULT 'n'; -- 답변여부
ALTER TABLE ds_board2
    MODIFY del DEFAULT 'n'; -- 삭제여부

-- 창고목록(storage_list)
ALTER TABLE ds_storage_list
	ADD
		CONSTRAINT FK_branch_TO_storage_list -- 지점(branch) -> 창고목록(storage_list)
		FOREIGN KEY (
			b_code -- 지점코드
		)
		REFERENCES ds_branch ( -- 지점(branch)
			b_code -- 지점코드
		);

-- 창고목록(storage_list)
ALTER TABLE ds_storage_list
	ADD
		CONSTRAINT FK_service_TO_storage_list -- 창고서비스(service) -> 창고목록(storage_list)
		FOREIGN KEY (
			s_kind -- 창고서비스종류
		)
		REFERENCES ds_service ( -- 창고서비스(service)
			s_kind -- 창고서비스종류
		);

-- 주문(order)
ALTER TABLE ds_order
	ADD
		CONSTRAINT FK_member_TO_order -- 회원(member) -> 주문(order)
		FOREIGN KEY (
			m_id -- 회원ID
		)
		REFERENCES ds_member ( -- 회원(member)
			m_id -- 회원ID
		);

-- 주문(order)
ALTER TABLE ds_order
	ADD
		CONSTRAINT FK_account_TO_order -- 계좌(account) -> 주문(order)
		FOREIGN KEY (
			account_no -- 계좌번호
		)
		REFERENCES ds_account ( -- 계좌(account)
			account_no -- 계좌번호
		);

-- 주문(order)
ALTER TABLE ds_order
	ADD
		CONSTRAINT FK_storage_list_TO_order -- 창고목록(storage_list) -> 주문(order)
		FOREIGN KEY (
			st_code -- 창고코드
		)
		REFERENCES ds_storage_list ( -- 창고목록(storage_list)
			st_code -- 창고코드
		);

-- 1:1게시판(board1)
ALTER TABLE ds_board1
	ADD
		CONSTRAINT FK_member_TO_board1 -- 회원(member) -> 1:1게시판(board1)
		FOREIGN KEY (
			m_id -- 회원ID
		)
		REFERENCES ds_member ( -- 회원(member)
			m_id -- 회원ID
		);

-- 1:1게시판(board1)
ALTER TABLE ds_board1
	ADD
		CONSTRAINT FK_order_TO_board1 -- 주문(order) -> 1:1게시판(board1)
		FOREIGN KEY (
			order_no -- 주문번호
		)
		REFERENCES ds_order ( -- 주문(order)
			order_no -- 주문번호
		);