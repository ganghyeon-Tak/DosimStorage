-- 최종 시연을 위해 세팅해야할 데이터들


-- job 자동만료
DECLARE
    X NUMBER;
BEGIN
    SYS.DBMS_JOB.SUBMIT
    ( JOB => X,
    WHAT => 'totaluse_and_expire;',
    NEXT_DATE => sysdate + 1/24/60/15,
    INTERVAL => null,
    NO_PARSE => false );
    commit;
END;
/

-- 시연용 창고 5개 생성
insert into ds_storage_list values('l30001', 3, 'large', null, 'n', 'y');
insert into ds_storage_list values('l30002', 3, 'large', null, 'n', 'y');
insert into ds_storage_list values('l30003', 3, 'large', null, 'n', 'y');
insert into ds_storage_list values('l30004', 3, 'large', null, 'n', 'y');
insert into ds_storage_list values('l30005', 3, 'large', null, 'n', 'y');


-- 시연용 유저 및 주문 생성. 만료용 1, 입금기한초과4
insert into ds_member values('expire', '1', '만료테스트', 'expire@time.out', '010-1234-5678', to_date('20-12-10', 'YY/MM/DD'), 30, 'n');
insert into ds_order VALUES(202012209995, 'expire', 'l30001', 168000, to_date('20-12-20', 'YY/MM/DD'), to_date('20-12-20', 'YY/MM/DD'), 1, to_date('20-12-20', 'YY/MM/DD'), to_date('21-01-19', 'YY/MM/DD'), '123-4567-890123',
		to_date('20-12-23', 'YY/MM/DD'), '입금완료');
update ds_storage_list set borrower_id='expire', rented='y' where st_code='l30001';


insert into ds_member values('timeout1', '1', '기한초과1', 'timeout1@time.out', '010-1234-5678', to_date('21-01-10', 'YY/MM/DD'), 0, 'n');
insert into ds_member values('timeout2', '1', '기한초과2', 'timeout2@time.out', '010-1234-5678', to_date('21-01-10', 'YY/MM/DD'), 0, 'n');
insert into ds_member values('timeout3', '1', '기한초과3', 'timeout3@time.out', '010-1234-5678', to_date('21-01-10', 'YY/MM/DD'), 0, 'n');
insert into ds_member values('timeout4', '1', '기한초과4', 'timeout4@time.out', '010-1234-5678', to_date('21-01-10', 'YY/MM/DD'), 0, 'n');

insert into ds_order VALUES(202101159996,	'timeout1', 'l30002', 168000, to_date('21-01-15', 'YY/MM/DD'), to_date('21-01-16', 'YY/MM/DD'), 1, null, null, '123-4567-890123',
		to_date('21-01-19', 'YY/MM/DD'), '입금대기');
insert into ds_order VALUES(202101159997,	'timeout2', 'l30003', 168000, to_date('21-01-15', 'YY/MM/DD'), to_date('21-01-16', 'YY/MM/DD'), 1, null, null, '123-4567-890123',
		to_date('21-01-19', 'YY/MM/DD'), '입금대기');
insert into ds_order VALUES(202101159998,	'timeout3', 'l30004', 168000, to_date('21-01-15', 'YY/MM/DD'), to_date('21-01-16', 'YY/MM/DD'), 1, null, null, '123-4567-890123',
		to_date('21-01-19', 'YY/MM/DD'), '입금대기');
insert into ds_order VALUES(202101159999,	'timeout4', 'l30005', 168000, to_date('21-01-15', 'YY/MM/DD'), to_date('21-01-16', 'YY/MM/DD'), 1, null, null, '123-4567-890123',
		to_date('21-01-19', 'YY/MM/DD'), '입금대기');
update ds_storage_list set borrower_id = '입금대기', rented='n', usable='n' where st_code in('l30002', 'l30003', 'l30004', 'l30005');

commit;
