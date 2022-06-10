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

app.post("/node/Visy.Middleware.Node/modules/inbound/sap/generic/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: "//*[local-name()='BSTNK'][1]"
    }
    
    var companyCode = {
        data: "//*[local-name()='SNDPRN']"
    }
    
    var companyName = {
        data: "//*[local-name()='E2EDK07001GRP']//*[*[local-name()='PARVW']='LF']/*[local-name()='NAME1']"
    }
    
    var customerCode = {
        data: "//*[local-name()='SNDPRN']"
    }
    
    var invoiceDate = {
        data: "//*[local-name()='E2EDK07001GRP']//*[local-name()='DATUM'][1]"
    }
    
    var invoiceTime = {
        data: "//*[local-name()='E2EDK07001GRP']//*[local-name()='UZEIT'][1]"
    }
    
    var cName = camaro(req.rawBody, companyName).data;
    
    var mesType = {
        data: "//*[local-name()='MESTYP']"
    }
    
    if (camaro(req.rawBody, customerCode).data == '11214') {
        cName = 'GSGlobal'
    } else if (camaro(req.rawBody, customerCode).data == '30238') {
        cName = 'Rasselstein'
    } else if (camaro(req.rawBody, customerCode).data == '114312') {
        cName = 'Nippon Steel'
    } else {
        cName = cName;
    }
    
    if (camaro(req.rawBody, mesType).data == 'ORDERS') { //Z3Orders
        
        var poNumber = {
            data: "//*[local-name()='E2EDK01005GRP']/*[local-name()='E1EDK01']/*[local-name()='BELNR'][1]"
        }
        
        var partN = {
            data: "//*[local-name()='E2EDKA1003GRP'][*[local-name()='E1EDKA1']/*[local-name()='PARVW']='WE']/*[local-name()='E1EDKA1']/*[local-name()='PARTN']"
        }
        
        var name = {
            data: "//*[local-name()='E2EDKA1003GRP'][*[local-name()='E1EDKA1']/*[local-name()='PARVW']='WE']/*[local-name()='E1EDKA1']/*[local-name()='NAME1']"
        }
        
        var poDate = {
            data: "//*[local-name()='E1EDK03']/*[local-name()='DATUM'][1]"
        }
        
        var query = "Insert into Inbound (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, poNumber).data + "',  " + 
             "'" + camaro(req.rawBody, partN).data + "',  " +
             "'" + camaro(req.rawBody, name).data.replace('\'', '') + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, poDate).data + "',  " +
             "'', '" + camaro(req.rawBody, mesType).data + "')";
        console.log(query);
        db.executeQuery(res, query);
    
    }
    else {
        var query = "Insert into Inbound (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
			"'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
			"'" + camaro(req.rawBody, companyCode).data + "',  " +
			"'" + cName.replace('\'', '') + "',  " +
			"'" + camaro(req.rawBody, customerCode).data + "',  " +
			"'" + camaro(req.rawBody, invoiceDate).data + camaro(req.rawBody, invoiceTime).data + "',  " +
			"'', '" + camaro(req.rawBody, mesType).data + "')";
        console.log(query);
        db.executeQuery(res, query);
		
    }
	   
});


app.get("/node/Visy.Middleware.Node/modules/inbound", function (req , res) {
    var query = "select * from Inbound order by created_date desc";
    db.executeQuery(res, query);
});


var server = http.createServer(app);
var port = process.env.PORT;
server.listen(port);
