var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'xtkicwtiu',
  database : 'html5work'
});

connection.connect();

connection.query('SELECT * FROM Recommand', function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});

connection.end();