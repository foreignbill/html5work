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
insert into user_info (user_id,nickname,user_photo) values('root','救济管理员','img/photo/root.jpg');

---
insert into film_info (f_title,f_brief,f_date) values('西红柿首富','《西虹市首富》的故事发生在《夏洛特烦恼》中的“特烦恼”之城“西虹市”。混迹于丙级业余足球队的守门员王多鱼（沈腾饰演），因比赛失利被开除离队。正处于人生最低谷的他接受了神秘台湾财团“一个月花光十亿资金”的挑战。本以为快乐生活就此开始，王多鱼却第一次感到“花钱特烦恼”！想要人生反转走上巅峰，真的没有那么简单。','2018-07-31','img/Popular1.jpg');


insert into directors (director_name,f_title) values('闫非','西红柿首富'),('彭大魔','西红柿首富');

insert into actors_info (actor_name,actor_birth,actor_brief,actor_photo)
values('张一鸣','1986-06-06','张一鸣，1986年6月6日出生于辽宁省鞍山市，中国内地男演员、导演，毕业于中央戏剧学院表演系。','img/actors/zhangyiming.jpg');
('宋芸桦','1992-10-21','宋芸桦（Vivian Sung），1992年10月21日出生于中国台湾，毕业于辅仁大学，中国台湾女演员。','img/actors/songyunye.jpg');
('沈腾','1979-10-23','沈腾，1979年10月23日出生于黑龙江省齐齐哈尔市，中国内地影视导演、演员，开心麻花舞台剧签约艺人。毕业于解放军艺术学院戏剧表演系。','img/actors/shenteng.jpg');


insert into actor_film (f_title,actor_name,role_name)
values('西红柿首富','沈腾','王多鱼'),('西红柿首富','宋芸桦','夏竹'),('西红柿首富','张一鸣','庄强');


insert into film_info (f_title,f_brief,f_date,file_poster)
values('肆式青春','《肆式青春》是CoMix Wave Films制作的动画电影，由易小星、竹内良贵、李豪凌联合执导。作品以北京、广州、上海3个中国城市为舞台，讲述了以“衣食住行”为主题的《一碗乡愁》、《霓裳浮光》和《纤雨初晴》这3个青春短篇故事。','2018-08-04','img/Incoming0.jpg'),('爱情公寓','《爱情公寓》是上海电影（集团）公司出品，上海高格文化传播有限公司承制，张力摄影指导的都市青春喜剧，由汪远编剧、韦正执导，陈赫、娄艺潇、王传君、邓家佳、孙艺洲、李金铭、赵霁、金世佳、赵文琪、李佳航领衔主演。','2018-08-10','img/Incoming1.jpg');

insert into actors_info (actor_name,actor_birth,actor_brief,actor_photo)
values('坂泰斗','1992-12-18','日本男性声优，福冈县出身，毕业于pro-fit声优养成所，pro-fit所属。',''),
('寿美菜子','1991-09-17','日本的女性声优、歌手、演员。','img/actors/shoumeixizi.jpg'),
('陈赫','1985-11-09','中国内地男演员','img/actors/chenhe.jpg'),
('孙艺洲','1983-10-23','中国内地男演员','img/actors/sunyizhou.jpg'),
('娄艺潇','1988-12-27','中国内地女演员','img/actors/louyixiao.jpg');

insert into actor_film (f_title,actor_name,role_name)
values('肆式青春','坂泰斗','小明'),
('肆式青春','寿美菜子','依琳'),
('爱情公寓','陈赫','曾小贤'),
('爱情公寓','孙艺洲','吕子乔'),
('爱情公寓','娄艺潇','胡一菲');

insert into directors (director_name,f_title)
values('韦正','爱情公寓'),
('李豪凌','肆式青春');


insert into cinema_info(c_id,c_name,c_loc)
values(1,'卢米埃影城(金鹰新街口店)','秦淮区汉中路101号金鹰购物中心B座9层'),
(2,'新街口国际影城(德基广场IMAX店)','玄武区中山路18号德基广场7楼（近地铁新街口站）'),
(3,'幸福蓝海IMAX影城(常发广场店)','玄武区红山路88号常发广场5楼');


insert into film_play(c_id,nth_id,f_title,f_date,f_time)
values(1,2,'肆式青春','2018-08-06','10:00:00');
(1,0,'西红柿首富','2018-08-01','10:00:00'),
(1,1,'西红柿首富','2018-08-01','14:00:00'),
(2,0,'西红柿首富','2018-08-01','10:00:00'),
(2,1,'西红柿首富','2018-08-01','14:00:00'),
(3,0,'西红柿首富','2018-08-01','10:00:00'),
(3,1,'西红柿首富','2018-08-01','14:00:00');

create table seats_info
