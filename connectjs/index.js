
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

app.use(function (req, res, next) {
    console.log('[%s] %s => %s', Date.now(), req.method, req.url);
    next();
});
app.get("/data", function (req, res) {
    res.setHeader('content-type', 'application/json');
    res.end(data);
});
app.use(app.router);

// cache image for 1 day
app.use("/assets", express.static(__dirname + '/assets', { maxAge: 86400000 }));

http.createServer(app).listen(3000);

