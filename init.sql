create table user_info (
	user_id VARCHAR(20) NOT NULL,
	nickname VARCHAR(20) NOT NULL,
	user_photo VARCHAR(200),
	PRIMARY KEY(user_id)
);
----------------------------------
create table cinema_info (
	c_id int NOT NULL,
	c_name VARCHAR(50) NOT NULL,
	c_loc VARCHAR(200) NOT NULL,
	PRIMARY KEY(c_id)
);
-----------------------------------
create table film_info (
	f_title VARCHAR(100) NOT NULL,
	f_brief VARCHAR(1000) NOT NULL,
	f_date DATE NOT NULL,
	PRIMARY KEY(f_title)
);
-----------------------------------
create table film_play (
	c_id int NOT NULL,
	nth_id int NOT NULL,
	f_title VARCHAR(100) NOT NULL,
	PRIMARY KEY(c_id,nth_id)
);
-----------------------------------
create table seats_info (
	c_name VARCHAR(50) NOT NULL,
	f_title VARCHAR(100) NOT NULL,
	seats_id INT NOT NULL,
	f_date DATE NOT NULL,
	f_time TIME NOT NULL,
	seats_status int NOT NULL,
	user_id VARCHAR(20) NOT NULL,
	PRIMARY KEY(c_name,f_title,seats_id,f_date,f_time)
);
-----------------------------------
create table user_comment_film (
	user_id VARCHAR(20) NOT NULL,
	f_title VARCHAR(100) NOT NULL,
	user_comment VARCHAR(1000) NOT NULL,
	stars double,
	c_date DATE,
	c_time TIME,
	PRIMARY KEY(user_id,f_title,c_date,c_time)
);
------------------------------------
create table order_table (
	order_id VARCHAR(32) NOT NULL,
	user_id VARCHAR(20) NOT NULL,
	f_title VARCHAR(100) NOT NULL,
	c_id int NOT NULL,
	nth_id int NOT NULL,
	PRIMARY KEY(order_id)
);
------------------------------------
create table order_seat (
	order_id VARCHAR(32) NOT NULL,
	seats_id int NOT NULL,
	PRIMARY KEY(order_id,seats_id)
);
------------------------------------
create table actors_info (
	actor_name VARCHAR(100) NOT NULL,
	actor_birth DATE,
	actor_brief VARCHAR(500),
	actor_photo VARCHAR(100),
	PRIMARY KEY(actor_name)
);
------------------------------------
create table actor_film (
	f_title VARCHAR(100) NOT NULL,
	actor_name VARCHAR(100) NOT NULL,
	role_name VARCHAR(100) NOT NULL,
	PRIMARY KEY(f_title,actor_name)
);
------------------------------------
create table directors (
	director_name VARCHAR(100) NOT NULL,
	f_title VARCHAR(100) NOT NULL,
	PRIMARY KEY(director_name,f_title)
);
---
insert into user_info (user_id,nickname,user_photo) values('root','�ȼù���Ա','img/photo/root.jpg');

---
insert into film_info (f_title,f_brief,f_date) values('�������׸�','���������׸����Ĺ��·����ڡ������ط��ա��еġ��ط��ա�֮�ǡ������С����켣�ڱ���ҵ������ӵ�����Ա�����㣨�������ݣ��������ʧ����������ӡ�������������͹ȵ�������������̨����š�һ���»���ʮ���ʽ𡱵���ս������Ϊ��������ʹ˿�ʼ��������ȴ��һ�θе�����Ǯ�ط��ա�����Ҫ������ת�����۷壬���û����ô�򵥡�','2018-07-31','img/Popular1.jpg');


insert into directors (director_name,f_title) values('�Ʒ�','�������׸�'),('���ħ','�������׸�');

insert into actors_info (actor_name,actor_birth,actor_brief,actor_photo)
values('��һ��','1986-06-06','��һ����1986��6��6�ճ���������ʡ��ɽ�У��й��ڵ�����Ա�����ݣ���ҵ������Ϸ��ѧԺ����ϵ��','img/actors/zhangyiming.jpg');
('��ܿ��','1992-10-21','��ܿ�루Vivian Sung����1992��10��21�ճ������й�̨�壬��ҵ�ڸ��ʴ�ѧ���й�̨��Ů��Ա��','img/actors/songyunye.jpg');
('����','1979-10-23','���ڣ�1979��10��23�ճ����ں�����ʡ��������У��й��ڵ�Ӱ�ӵ��ݡ���Ա�������黨��̨��ǩԼ���ˡ���ҵ�ڽ�ž�����ѧԺϷ�����ϵ��','img/actors/shenteng.jpg');


insert into actor_film (f_title,actor_name,role_name)
values('�������׸�','����','������'),('�������׸�','��ܿ��','����'),('�������׸�','��һ��','ׯǿ');


insert into film_info (f_title,f_brief,f_date,file_poster)
values('��ʽ�ഺ','����ʽ�ഺ����CoMix Wave Films�����Ķ�����Ӱ������С�ǡ������������������ִ������Ʒ�Ա��������ݡ��Ϻ�3���й�����Ϊ��̨���������ԡ���ʳס�С�Ϊ����ġ�һ�����������Ѹ��⡷�͡�������硷��3���ഺ��ƪ���¡�','2018-08-04','img/Incoming0.jpg'),('���鹫Ԣ','�����鹫Ԣ�����Ϻ���Ӱ�����ţ���˾��Ʒ���Ϻ��߸��Ļ��������޹�˾���ƣ�������Ӱָ���Ķ����ഺϲ�磬����Զ��硢Τ��ִ�����ºա�¦���졢���������˼Ҽѡ������ޡ�������������������ѡ�����������Ѻ��������ݡ�','2018-08-10','img/Incoming1.jpg');

insert into actors_info (actor_name,actor_birth,actor_brief,actor_photo)
values('��̩��','1992-12-18','�ձ��������ţ������س�����ҵ��pro-fit������������pro-fit������',''),
('��������','1991-09-17','�ձ���Ů�����š����֡���Ա��','img/actors/shoumeixizi.jpg'),
('�º�','1985-11-09','�й��ڵ�����Ա','img/actors/chenhe.jpg'),
('������','1983-10-23','�й��ڵ�����Ա','img/actors/sunyizhou.jpg'),
('¦����','1988-12-27','�й��ڵ�Ů��Ա','img/actors/louyixiao.jpg');

insert into actor_film (f_title,actor_name,role_name)
values('��ʽ�ഺ','��̩��','С��'),
('��ʽ�ഺ','��������','����'),
('���鹫Ԣ','�º�','��С��'),
('���鹫Ԣ','������','������'),
('���鹫Ԣ','¦����','��һ��');

insert into directors (director_name,f_title)
values('Τ��','���鹫Ԣ'),
('�����','��ʽ�ഺ');


insert into cinema_info(c_id,c_name,c_loc)
values(1,'¬�װ�Ӱ��(��ӥ�½ֿڵ�)','�ػ�������·101�Ž�ӥ��������B��9��'),
(2,'�½ֿڹ���Ӱ��(�»��㳡IMAX��)','��������ɽ·18�ŵ»��㳡7¥���������½ֿ�վ��'),
(3,'�Ҹ�����IMAXӰ��(�����㳡��)','��������ɽ·88�ų����㳡5¥');


insert into film_play(c_id,nth_id,f_title,f_date,f_time)
values(1,2,'��ʽ�ഺ','2018-08-06','10:00:00');
(1,0,'�������׸�','2018-08-01','10:00:00'),
(1,1,'�������׸�','2018-08-01','14:00:00'),
(2,0,'�������׸�','2018-08-01','10:00:00'),
(2,1,'�������׸�','2018-08-01','14:00:00'),
(3,0,'�������׸�','2018-08-01','10:00:00'),
(3,1,'�������׸�','2018-08-01','14:00:00');

create table seats_info
