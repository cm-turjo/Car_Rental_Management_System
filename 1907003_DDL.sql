drop table booking_details;
drop table car_details;
drop table customer_details;
drop table ins_details;
drop table dest_details;


----creating table customer_details

create table customer_details (
nid number(10) not null,
name varchar(30) not null,
mobile number(11)  unique,
Email_id varchar(30),
address varchar(100) not null,
primary key(nid)
);


--creating table car_details

create table car_details(
reg_no varchar(25) not null ,
engine_no varchar(20) not null ,
model_name varchar(20) not null,
model_year number(4) not null,
mileage number(6) not null,
condition varchar(10) check (condition in ('WORKING','GOOD','BEST')),
primary key(reg_no)
);

----creating table dest_details


create table dest_details(
dest_id number(4) not null,
dest_name varchar (15) not null,
dest_address varchar(100) not null,
primary key(dest_id)
);

----creating table ins_details

create table ins_details(
ins_code number(4) not null,
ins_name varchar(130),
coverage_type varchar(50),
cost_per_day number(5),
primary key(ins_code)
);


----creating table booking_details


create table booking_details(
booking_id number(4) not null,
start_time date not null,
return_time date not null,
constraint check_date_status check (return_time>start_time),
dest_id number(4) not null,
reg_no varchar(25) not null,
ins_code number(4) not null,
paid_amount number(10),
due_amount number(10),
late_fee number(10),
nid number(10) not null,
primary key (booking_id),
foreign key(dest_id) references dest_details(dest_id) on delete cascade,
foreign key(reg_no) references car_details(reg_no),
foreign key(ins_code) references ins_details(ins_code),
foreign key(nid) references customer_details(nid)
);





--add column to the table

alter table dest_details add dest_description varchar(50);

describe dest_details;



----modify column defintion

alter table dest_details modify dest_description varchar(10);

describe dest_details;


----rename column name

alter table dest_details rename column dest_description to description;

describe dest_details;


----drop column from the table;

alter table dest_details drop column description;

describe dest_details;

