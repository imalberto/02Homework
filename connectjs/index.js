
/*jslint nomen:true*/

'use strict';

var fs = require('fs'),
    http = require('http'),
    express = require('express'),
    app = express(),
    data,
    json;

data = fs.readFileSync(__dirname + '/assets/data.json', 'utf-8');
json = JSON.parse(data);

app.get("/data", function (req, res) {
    res.setHeader('content-type', 'application/json');
    res.end(data);
});
app.use(app.router);

app.use("/assets", express.static(__dirname + '/assets'));

http.createServer(app).listen(3000);

