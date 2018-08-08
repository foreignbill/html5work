var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use(express.static('public'));
var urlencodedParser = bodyParser.urlencoded({ extended: false })

app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By",' 3.2.1');
    req.setEncoding('utf8');// need fix
    if(req.method=="OPTIONS") res.send(200);/*让options请求快速返回*/
    else  next();
});

app.get('/index.html', function (req, res) {
	res.send(__dirname + "/" + "index.html");
})

app.get('/incoming.html', function (req, res) {
	res.send(__dirname + "/" + "incoming.html");
})

app.post('/incoming.html', function (req, res) {
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query('SELECT * FROM film_info ORDER BY f_date ASC', function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/cinema.html', function (req, res) {
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query('SELECT * FROM cinema_info', function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.get('/process_get', function (req, res) {
	var response = {
		"first_name":req.query.first_name,
		"last_name":req.query.last_name
	};
	console.log(response);
	res.end(JSON.stringify(response));
})

app.post('/login', function (req, res) {
	var response = {
		"user_name":req.query.user_name,
		"user_login":false
	};
	console.log(response);
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	connection.query('SELECT * FROM user_info', function (error, results, fields) {
		if (error) throw error;
		for(var i=0;i<results.length;i++){
			if(results[i].user_id == req.query.user_name)
				if(results[i].pwd == req.query.user_pwd){
					response.user_login = true;
				}
		}
		res.end(JSON.stringify(response));
	});
})

app.post('/', function (req, res) {
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query('SELECT * FROM film_info ORDER BY f_date ASC', function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/searchactors', urlencodedParser,function (req, res) {
	var film_name = req.query.film_name;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query("SELECT actor_name,role_name FROM actor_film WHERE f_title='"+film_name+"'", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/searchactors_detail', urlencodedParser,function (req, res) {
	var film_name = req.query.film_name;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query("SELECT actors_info.actor_name as actor_name,role_name,actor_photo FROM actor_film,actors_info WHERE f_title='"+film_name+"' and actor_film.actor_name=actors_info.actor_name", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/searchdirectors', urlencodedParser,function (req, res) {
	var film_name = req.query.film_name;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query("SELECT director_name FROM directors WHERE f_title='"+film_name+"'", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/incoming.html/searchactors', urlencodedParser,function (req, res) {
	var film_name = req.query.film_name;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query("SELECT actor_name,role_name FROM actor_film WHERE f_title='"+film_name+"'", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/incoming.html/searchdirectors', urlencodedParser,function (req, res) {
	var film_name = req.query.film_name;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query("SELECT director_name FROM directors WHERE f_title='"+film_name+"'", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/searchfilm', urlencodedParser,function (req, res) {
	var film_name = req.query.film_name;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query("SELECT * FROM film_info WHERE f_title='"+film_name+"'", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/searchcinema', urlencodedParser,function (req, res) {
	var c_name = req.query.c_name;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var response = [];
	connection.query("select distinct f_title from film_play,cinema_info where film_play.c_id=cinema_info.c_id and c_name='"+c_name+"'", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/searchfilm_and_cinema', urlencodedParser,function (req, res) {
	var film_name = req.query.film_name;
	var film_date = req.query.film_date;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	connection.query("select distinct c_name,c_loc from film_play,cinema_info where f_title='"+film_name+"' and film_play.c_id=cinema_info.c_id and f_date='"+film_date+"'", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/searchfilm_from_cinema', urlencodedParser,function (req, res) {
	var c_name = req.query.c_name;
	var film_date = req.query.film_date;
	var film_name = req.query.film_name;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	connection.query("select distinct f_title,f_time,f_date from film_play,cinema_info where c_name='"+c_name+"' and film_play.c_id=cinema_info.c_id and f_date='"+film_date+"' and f_title='"+film_name+"'", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/searchusername', urlencodedParser,function (req, res) {
	var u_id = req.query.user_name;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	connection.query("select * from user_info where user_id='"+u_id+"'", function (error, results, fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/create_user', urlencodedParser,function (req, res) {
	var u_id = req.query.user_name;
	var nick_name = req.query.nick_name;
	var pwd = req.query.pwd;
	console.log(u_id + " " + nick_name + " " + pwd);
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	var addSqlParams = [u_id,nick_name,"img/photo/root.jpg",pwd];
	connection.query("Insert into user_info(user_id,nickname,user_photo,pwd) values(?,?,?,?)",addSqlParams,function (error,results) {
		if (error) throw error;
		res.end(JSON.stringify("yes"));
	});
})

app.post('/create_order', urlencodedParser,function (req, res) {
	var u_id = req.query.user_id;
	var f_title = req.query.film_name;
	var c_name = req.query.c_name;
	var f_date = req.query.f_date;
	var f_time = req.query.f_time;
	var seat_info = req.query.seat_info;
	var order_id = "";
	for(var i=0;i<f_date.length;i++)
		if('0' <= f_date[i] && f_date[i] <= '9')
			order_id += f_date[i];
	for(var i=0;i<f_time.length;i++)
		if('0' <= f_time[i] && f_time[i] <= '9')
			order_id += f_time[i];
	var tmp = 0;
	for(var i=0;i<u_id.length;i++)
		tmp = (tmp * 23 + u_id[i].charCodeAt()) % 1000000;

	for(var i=0;i<c_name.length;i++)
		tmp = (tmp * 23 + c_name[i].charCodeAt()) % 1000000;

	for(var i=0;i<f_title.length;i++)
		tmp = (tmp * 23 + f_title[i].charCodeAt()) % 1000000;

	var tmp2 = 0;
	for(var i=0;i<seat_info.length;i++)
		tmp2 = (tmp2 * 128 + seat_info[i].charCodeAt() ) % 10000;

	order_id += "" + tmp + "" + tmp2;
	console.log(order_id);
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	res.end(JSON.stringify(order_id));
	connection.connect();
	var addSqlParams=[order_id,u_id,f_title,f_date,f_time,c_name];
	connection.query("Insert into order_table(order_id,user_id,f_title,f_date,f_time,c_name) values(?,?,?,?,?,?)",addSqlParams,function (error,results) {
		if (error) throw error;
	});
	seat_info = seat_info.split('-');
	for(var i=0;i<seat_info.length;i++) {
		connection.query("Insert into order_seat(order_id,seats_id) values(?,?)",[order_id,parseInt(seat_info[i])],function (error,results) {
			if (error) throw error;
		});
	}
})

app.post('/checkseats', urlencodedParser,function (req, res) {
	var f_title = req.query.film_name;
	var c_name = req.query.c_name;
	var f_date = req.query.f_date;
	var f_time = req.query.f_time;
	console.log([f_time,f_title,c_name,f_date]);
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	connection.query("select seats_id from order_table,order_seat where order_table.order_id=order_seat.order_id and f_title='"+f_title+"' and f_date='"+f_date+"' and f_time='"+f_time+"' and c_name='"+c_name+"'",function (error,results,fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

app.post('/search_order_user', urlencodedParser,function (req, res) {
	var u_id = req.query.user_id;
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'root',
	  database : 'html5work'
	});
	connection.connect();
	connection.query("select order_id,user_id,order_table.f_date as f_date,order_table.f_time as f_time,order_table.f_title as f_title,c_name,file_poster from order_table,film_info where order_table.f_title=film_info.f_title and user_id='"+u_id+"' order by order_table.f_date desc",function (error,results,fields) {
		if (error) throw error;
		console.log(results);
		res.end(JSON.stringify(results));
	});
})

var server = app.listen(8081, function () {
	var host = server.address().address;
	var port = server.address().port;
	console.log("应用实例，访问地址为 http://%s:%s", host, port);
})