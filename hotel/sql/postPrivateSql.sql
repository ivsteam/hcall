SHOW DATABASES;
show variables like 'c%';
ALTER DATABASE hotelctc DEFAULT CHARACTER SET utf8;
SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_server = utf8;
SET character_set_filesystem = utf8;




/******** ȣ�� ********/
DROP TABLE HOTEL_MEMBER;

/* public */
CREATE TABLE HOTEL_MEMBER(
	mem_id		SERIAL primary key,
	mem_email	varchar(300),
	mem_pw		varchar(300),
	mem_nm		varchar(300),
	mem_nickname varchar(100),
	mem_level	varchar(100),
	mem_icon	varchar(100),
	mgr_id		integer,
	first_date	date,
	last_date	date,
	mem_drawYn	varchar(10),
	access_token varchar(512),
	refresh_token varchar(512)
);

/* private */
CREATE TABLE HOTEL_MEMBER(
	mem_id		SERIAL primary key ,
	mem_email	varchar(300),
	mem_pw		varchar(300),
	mem_nm		varchar(300),
	mem_nickname varchar(100),
	mem_level	varchar(100),
	mem_icon	varchar(100)
);

INSERT INTO HOTEL_MEMBER(mem_email, mem_pw) VALUES ('11@11.11','11111111');


/******** ȣ�� ������ ���� ********/
DROP TABLE HOTEL;

CREATE TABLE HOTEL(
	hotel_seq			integer primary key not null,
	hotel_name			varchar(300) not null,
	hotel_address		varchar(500) not null,
	hotel_website		varchar(300) not null,
	hotel_phone			varchar(30) not null,
	hotel_info			varchar(5000) not null,
	hotel_first_date 	date,
	hotel_last_date		date,
	hotel_location_width varchar(100) not null,
	hotel_location_height varchar(100) not null --,
	
-- 	CONSTRAINT fk_Seq FOREIGN KEY ( hotel_seq ) REFERENCES HOTEL_MEMBER ( mem_id ) ON DELETE CASCADE
);


/******** ȣ�� �� ********/
DROP TABLE HRM;

CREATE TABLE HRM(
	hotel_seq		integer not null,
	hrm_seq			SERIAL primary key,
	hrmN_name		varchar(200),
	personnel_max	integer,
	room_num		varchar(100),
	hrm_configuration varchar(200),
	hrm_information	varchar(4000),
	hrm_service		varchar(2000),
	hrm_fee			integer,
	hrm_fee_type	varchar(10) default 'USD',
	hrm_kinds		varchar(50) default 'Standard',
	hrm_use			bool default true,
	state			varchar(10),

	CONSTRAINT hrm_seq FOREIGN KEY ( hotel_seq ) REFERENCES HOTEL ( hotel_seq ) ON DELETE CASCADE
);

/* ��������
CREATE TABLE HRM(
	hotelSeq		int(10) not null,
	hrmSeq		int(100) primary key auto_increment,
	hrmName		varchar(200),
	reservationName varchar(100),
	guestName		varchar(100),
	personnel		int(10),
	personnelMax	int(10),
	term			int(10),
	roomNum		varchar(100),
	checkIn		date,
	checkOut		date,
	hrmConfiguration varchar(200),
	hrmInformation	varchar(4000),
	hrmService	varchar(2000),
	hrmFee		int(10),
	hrmFeeType	varchar(10) default 'USD',
	hrmKinds		varchar(50) default 'Standard',
	hrmUse		bool default true,
	state		varchar(10),

	CONSTRAINT hrm_seq FOREIGN KEY ( hotelSeq ) REFERENCES MEMBER ( memId ) ON DELETE CASCADE
);
*/


/******** ȣ�� �� �̹��� ********/
DROP TABLE HRMIMG;

CREATE TABLE HRMIMG(
	img_seq			SERIAL primary key,
	hrm_seq			integer,
	path			varchar(500),
	file_Ori_name	varchar(200),
	file_Change_name varchar(200),
	
	CONSTRAINT hrmImg_seq FOREIGN KEY ( hrm_seq ) REFERENCES HRM ( hrm_seq ) ON DELETE CASCADE
);


/******** ȣ�� �� ********/
DROP TABLE customer;

CREATE TABLE customer(
	hotel_seq	integer not null,
	cust_seq	SERIAL primary key,
	cust_name	varchar(100) not null,
	cust_pw		varchar(100) not null,
	cust_phone	varchar(20) not null,
	cust_email	varchar(100) not null,
	cust_rating	varchar(10),
	signup_date	date,

	CONSTRAINT cust_seq FOREIGN KEY ( hotel_seq ) REFERENCES HOTEL ( hotel_seq ) ON DELETE CASCADE
);


/******** ���๮�� ********/
DROP TABLE reservation;

CREATE TABLE reservation(
	reserv_seq	SERIAL primary key,
	hotel_seq	integer not null,
	hrm_seq		integer not null,
	cust_seq	integer not null,
	guest_name	varchar(100),
	personnel	integer,
	hrm_count	integer,
	add_date	timestamp,
	first_date	date,
	last_date	date,
	check_in	timestamp,
	check_out	timestamp,
	etc			varchar(300),
	state		varchar(10) --,

-- 	CONSTRAINT re_hrm_seq FOREIGN KEY ( hrm_seq ) REFERENCES HRM ( hrm_seq ) ON UPDATE CASCADE,	
-- 	CONSTRAINT re_cust_seq FOREIGN KEY ( cust_seq ) REFERENCES customer ( cust_seq ) ON UPDATE CASCADE
);

/******* ���๮�� ���̵����� ********/
DELETE FROM reservation;

INSERT INTO reservation (hotelSeq, hrmSeq, custSeq, reservationName, guestName, roomNum, personnel, addDate, firstDate, lastDate, checkIn, checkOut, etc, state) 
		SELECT 2, 1, 1, '�Ƹ���', null, '101ȣ', 2, NOW(), '2017-11-11', '2017-12-11', null, null, 'Ÿ�� 10�� �ּ���', '�����' 
	FROM DUAL WHERE NOT EXISTS (SELECT * FROM reservation WHERE hotelSeq=2 AND hrmSeq=1 AND custSeq=1);

INSERT INTO reservation (hotelSeq, hrmSeq, custSeq, reservationName, guestName, roomNum, personnel, addDate, firstDate, lastDate, checkIn, checkOut, etc, state) 
		SELECT 2, 2, 1, '�Ƹ���', null, '1', 2, NOW(), '2017-11-11', '2017-12-11', null, null, null, '����Ϸ�'
	FROM DUAL WHERE NOT EXISTS (SELECT * FROM reservation WHERE hotelSeq=2 AND hrmSeq=2 AND custSeq=1);




/******** ������ ��¥ ********/
DROP TABLE reservationDay;

CREATE TABLE reservationDay(
	reservSeq			int(100) not null,
	hotelSeq			int(100) not null,
	registrationDate	date,

	CONSTRAINT regist_seq FOREIGN KEY ( reservSeq ) REFERENCES reservation ( reservSeq ) ON DELETE CASCADE
);





/******** �ȵ�� ********/
DROP TABLE pickdrop;

CREATE TABLE pickdrop (
	pd_seq				SERIAL primary key,
	hotel_seq			integer not null,
	reserv_seq			integer not null,
	cust_seq			integer not null,
	personnel			integer,
	add_date			timestamp,
	want_date			timestamp,
	start_address		varchar(200),
	start_point_width	varchar(100),
	start_point_height	varchar(100),
	end_address			varchar(200),
	end_point_width		varchar(100),
	end_point_height	varchar(100),
	complete_check		bool default false,

	CONSTRAINT pickdrop_hotel_seq FOREIGN KEY ( hotel_seq ) REFERENCES HOTEL ( hotel_seq ) ON UPDATE CASCADE,
	CONSTRAINT pickdrop_reserv_seq FOREIGN KEY ( reserv_seq ) REFERENCES reservation ( reserv_seq ) ON UPDATE CASCADE,
	CONSTRAINT pickdrop_cust_seq FOREIGN KEY ( cust_seq ) REFERENCES customer ( cust_seq ) ON UPDATE CASCADE
);












