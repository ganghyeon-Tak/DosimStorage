select * from STOCK_VIEW;
update DS_STORAGE_LIST set usable = 'y' where b_code = 1 and s_kind = 'medium';


select * from ds_account;	
update DS_ACCOUNT set account_no = '111-2222-333333' where bank= '국민은행';

select st_code from DS_STORAGE_LIST where b_code = 1 and s_kind = 'large' and usable = 'y' and rownum = 1;


select * from DS_STORAGE_LIST;

delete ds_order;
delete ds_storage_list;

select * from DS_STORAGE_LIST;


select * from DS_BOARD1;

