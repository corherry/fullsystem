


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--管理员表
drop table t_admin;

create table t_admin(
	id NUMBER primary key,
	account VARCHAR2(20) UNIQUE,
	password VARCHAR2(50),
	authority NUMBER default 0,
	last_login_time VARCHAR2(20),
	created_at VARCHAR2(20),
	updated_at VARCHAR2(20)
);

drop sequence t_admin_seq;

create sequence t_admin_seq increment by 1 start with 1;

drop trigger t_admin_trig;

create trigger t_admin_trig before
insert on t_admin for each row when (new.id is null)
begin
select t_admin_seq.nextval into:new.id from dual;
end;

select *from t_admin;

-------------------------------------------------------------------------------------------------------------------------------------------------------
--店铺表
drop table merchant;

create table merchant(
   id number primary key,
   account  varchar2(20),
   id_card varchar2(18) unique,
   merchant_name varchar2(20),
   id_card_img varchar2(200),
	 store_number varchar2(50) UNIQUE,
   store_name varchar2(20) UNIQUE,
   store_location varchar2(100),
   license_img  varchar2(200),
   status  number default 0, --0-未被拉黑 1-被拉黑
	 is_deleted number default 0,
   created_at  varchar2(20),
   updated_at  varchar2(20)
);

drop sequence merchant_seq;

create sequence merchant_seq increment by 1 start with 1;

drop trigger merchant_trig;

create trigger merchant_trig before
insert on merchant for each row when (new.id is null)
begin
select merchant_seq.nextval into:new.id from dual;
end;

select *from merchant;

---------------------------------------------------------------------------------------------------------------------------------------------------

--店铺注册流水表

drop table merchant_application_log;

create table merchant_application_log (
	id number primary key,
	account varchar2(20),
	id_card varchar2(18),
	merchant_name varchar2(20),
	id_card_img varchar2(200),
	store_name varchar2(20) UNIQUE,
	store_location varchar2(100),
	license_img varchar2(200),
	status number default 0,--  0-待处理   1-同意    2-不同意    3-驳回重改 
	t_admin_id number,
	is_deleted number default 0,
	created_at varchar2(20),
	updated_at varchar2(20)
);

drop sequence merchant_application_log_seq;

create sequence merchant_application_log_seq increment by 1 start with 1;

drop trigger merchant_application_log_trig;

create trigger merchant_application_log_trig before
insert on merchant_application_log for each row when (new.id is null)
begin
select merchant_application_log_seq.nextval into:new.id from dual;
end;

select *from merchant_application_log;


 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

--广告推荐表(recommend)

drop table recommend;

create table recommend(
	id number primary key,
	merchant_store_number varchar2(50),--店铺编号
	introduced varchar2(200),
	priority number default 0,
	status number default 0,--0-上架   1-下架
	created_at varchar2(20),
	updated_at varchar2(20)
);

drop sequence recommend_seq;

create sequence recommend_seq increment by 1 start with 1;

drop trigger recommend_trig;

create trigger recommend_trig before
insert on recommend for each row when (new.id is null)
begin
select recommend_seq.nextval into:new.id from dual;
end;

select * from recommend;

----------------------------------------------------------------------------------------------------------------------------------------------------------



 	
 	
 
