var db = require("../core/db");
var express = require("express");
var http = require('http');
var app = express();

var bodyParser = require("body-parser");

const camaro = require('camaro')

//app.use(bodyParser.json()); 

var rawBodySaver = function (req, res, buf, encoding) {
    if (buf && buf.length) {
        req.rawBody = buf.toString(encoding || 'utf8');
    }
}

app.use(bodyParser.json({ verify: rawBodySaver, limit: '50mb' }));
app.use(bodyParser.urlencoded({ verify: rawBodySaver, extended: true, limit: '50mb', parameterLimit: 50000 }));
app.use(bodyParser.raw({ verify: rawBodySaver, limit: '50mb', parameterLimit: 50000, type: function () { return true } }));


app.get("/node/Visy.Middleware.Node/modules/ordertracking", function (req , res) {
    var query = "select po_number, customer_code, customer_name, biztalk_id, created_date, order_sp,reject_message, archive_file_name from OrderTracking where created_date > getdate()- 180";
    db.executeQuery(res, query);
});

app.post("/node/Visy.Middleware.Node/modules/ordertracking/vbam/insert", function (req, res) {
    
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var poNumber = {
        data: '//ns0:Header/@purchase_order_number'
    }
    
    var biztalkid = {
        data: '//ns0:Header/@biztalk_id'
    }
    
    var customercode = {
        data: '//ns0:Header/@customer_code'
    }
    
    var query = "Insert into OrderTracking ([po_number],[biztalk_id],[customer_code],[customer_name],[archive_file_name],[order_sp],[reject_message]) Values (" +
			 "'" + camaro(req.rawBody, poNumber).data + "',  " + 
             "'" + camaro(req.rawBody, biztalkid).data + "',  " +
			 "'" + camaro(req.rawBody, customercode).data + "',  " +
             "'VBAM',  " +
             "'" + 'VBAM.' + camaro(req.rawBody, biztalkid).data + '.xml' + "', 1, null)";
    
    console.log(query);
    db.executeQuery(res, query);
});

var server = http.createServer(app);
var port = process.env.PORT;
server.listen(port);
