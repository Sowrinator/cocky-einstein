var pg = require('pg');

var tcp_addr = process.env.POSTGRES_PORT_5432_TCP_ADDR;
var tcp_port = process.env.POSTGRES_PORT_5432_TCP_PORT;

console.log("tcp_addr: " + tcp_addr);
console.log("tcp_port: " + tcp_port);

var client = new pg.Client({
    user: 'postgres',
    password: '',
    database: 'postgres',
    host: tcp_addr,
    port: tcp_port
});

pg.connect(client, function(err, client) {
    var select_query = client.query({
        text: "SELECT * FROM einstein",
        name: "select"
    });

    select_query.on('row', function(row) {
        console.log(row);
    });
});
