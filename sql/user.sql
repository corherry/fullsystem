--商家注册表
drop table business;

create table business (	
	id number primary key,
	account varchar2(20) unique,
	password varchar2(50),
	type number default 0,
	status number default 0,--0-未注册     1-提交注册
	last_login_time varchar2(20),
	created_at varchar2(20),
	updated_at varchar2(20)
);

drop sequence business_seq;

create sequence business_seq increment by 1 start with 1;

drop trigger business_trig;

create trigger business_trig before
insert on business for each row when (new.id is null)
begin
select business_seq.nextval into:new.id from dual;
end;

select *from business;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--店铺信息表
drop table store;

create table store(
	id number  primary key,
  merchant_store_number  varchar2(20), --店铺编号
  account  varchar2(20),
  name  varchar2(20),
	location  varchar2(100),
	service_time  varchar2(50),
	delivery_area  varchar2(200),
	store_img  varchar2(200),
	publicity  varchar2(200),
	status number default 9,
  created_at  varchar2(20),
  updated_at  varchar2(20)
);

drop sequence store_seq;

create sequence store_seq increment by 1 start with 1;

drop trigger store_trig;

create trigger store_trig before
insert on store for each row when (new.id is null)
begin
select store_seq.nextval into:new.id from dual;
end;

select * from store;

----------------------------------------------------------------------------------------------------------------------------------------------------------
--店铺图片表
drop table store_pic;

create table store_pic(
   id number primary key,
   store_id number,--店铺编号
   img varchar2(200),
	 priority number default 0,--优先级 数字越大 优先级越高
   created_at varchar2(20),
   updated_at varchar2(20)
);

drop sequence store_pic;

create sequence store_pic_seq increment by 1 start with 1;

drop trigger store_pic_trig;

create trigger store_pic_trig before
insert on store_pic for each row when (new.id is null)
begin
select store_pic_seq.nextval into:new.id from dual;
end;

select *from store_pic;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--菜单信息表(menu)

drop table menu;

create table menu(
	id number primary key,
	store_id number,--对应店铺
	name varchar2(20),
	introduced varchar2(200),
	price number(7,2),
	stock number,
	img varchar2(200),
	priority number default 0,--优先级 数字越大 优先级越高
	status number default 0,--0-上架   1-下架
	created_at varchar2(20),
	updated_at varchar2(20)
);

drop sequence menu_seq;

create sequence menu_seq increment by 1 start with 1;

drop trigger menu_trig;

create trigger menu_trig before
insert on menu for each row when (new.id is null)
begin
select menu_seq.nextval into:new.id from dual;
end;

select *from menu;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--菜品图片表

drop table dish_pic;

create table dish_pic(
    id number primary key,
    menu_id number,--menu  id
    img varchar2(200),
	  priority number default 0,--优先级 数字越大 优先级越高
    created_at varchar2(20),
    updated_at varchar2(20)
);

drop sequence dish_pic_seq;

create sequence dish_pic_seq increment by 1 start with 1;

drop trigger dish_pic_trig;

create trigger dish_pic_trig before
insert on dish_pic for each row when (new.id is null)
begin
select dish_pic_seq.nextval into:new.id from dual;
end;

select *from dish_pic;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--客户表

drop table customer;

create table customer (	
	id number primary key,
	account varchar2(20) unique,
	password varchar2(50),
	type number default 0,
	customer_name varchar2(20) unique,
	head_pic varchar2(200),
	balance number(8,2),
	last_login_time varchar2(20),
	created_at varchar2(20),
	updated_at varchar2(20)
);

drop sequence customer_seq;

create sequence customer_seq increment by 1 start with 1;

drop trigger customer_trig;

create trigger customer_trig before
insert on customer for each row when (new.id is null)
begin
select customer_seq.nextval into:new.id from dual;
end;

select *from customer;


