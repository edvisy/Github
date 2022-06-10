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

app.post("/node/Visy.Middleware.Node/modules/outbound/lgx/invoice/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//InvoiceNumber'
    }
    
    var companyCode = {
        data: '//CompanyCode'
    }
    
    var companyName = {
        data: '//CompanyName'
    }
    
    var customerCode = {
        data: '//SAPCustomerCode'
    }
    
    var invoiceDate = {
        data: '//InvoiceDate'
    }
    
    var invoiceTime = {
        data: '//InvoiceTime'
    }
    
    
    var query = "Insert into Outbound (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('LGX'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'" + camaro(req.rawBody, companyName).data.replace('\'', '') + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + camaro(req.rawBody, invoiceTime).data + "',  " +
             "'', 'INVOICE')";
    
    db.executeQuery(res, query);
   
});

app.post("/node/Visy.Middleware.Node/modules/outbound/lgx/desadv/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//load_number'
    }
    
    var companyCode = {
        data: '//customer_code'
    }
    
    var companyName = {
        data: '//company_name'
    }
    
    var customerCode = {
        data: '//sap_customer_code'
    }
    
    var invoiceDate = {
        data: '//departure_date'
    }
    
    var invoiceTime = {
        data: '//departure_time'
    }
    
    
    var query = "Insert into Outbound (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('LGX'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'" + camaro(req.rawBody, companyName).data.replace('\'', '') + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + camaro(req.rawBody, invoiceTime).data + "',  " +
             "'', 'DESADV')";
    
    db.executeQuery(res, query);
   
});

app.post("/node/Visy.Middleware.Node/modules/outbound/sap/invoice/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//E2EDK02[QUALF="001"]/BELNR'
    }
    
    var companyCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var companyName = {
        data: '//E2EDKA1003[1]/NAME1'
    }
    
    var customerCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var invoiceDate = {
        data: '//E2EDK02[QUALF="002"]/DATUM'
    }
    
    var invoiceTime = {
        data: '//E2EDK02[QUALF="002"]/DATUM'
    }
    
    
    var query = "Insert into Outbound (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'" + camaro(req.rawBody, companyName).data.replace('\'', '') + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + camaro(req.rawBody, invoiceTime).data + "',  " +
             "'', 'INVOICE')";
    console.log(query);
    db.executeQuery(res, query);
   
});

app.post("/node/Visy.Middleware.Node/modules/outbound/sap/z1desadv/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//EDI_DC40/DOCNUM'
    }
    
    var companyCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var companyName = {
        data: '//E1EDKA1[PARVW="AG"]/NAME1'
    }
    
    var customerCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var invoiceDate = {
        data: '//E1EDK06[IDDAT="001"]/DATUM'
    }
    
    var invoiceTime = {
        data: ''
    }
    
    
    var query = "Insert into Outbound (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'" + camaro(req.rawBody, companyName).data.replace('\'', '') + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + camaro(req.rawBody, invoiceTime).data + "',  " +
             "'', 'Z1DESADV')";
    console.log(query);
    db.executeQuery(res, query);
   
});

app.post("/node/Visy.Middleware.Node/modules/outbound/sap/z2desadv/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//EDI_DC40/DOCNUM'
    }
    
    var companyCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var companyName = {
        data: '//E1EDKA1[PARVW="AG"]/NAME1'
    }
    
    var customerCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var invoiceDate = {
        data: '//E1EDK06[IDDAT="001"]/DATUM'
    }
    
    var invoiceTime = {
        data: ''
    }
    
    
    var query = "Insert into Outbound (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'" + camaro(req.rawBody, companyName).data.replace('\'', '') + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + camaro(req.rawBody, invoiceTime).data + "',  " +
             "'', 'Z2DESADV')";
    console.log(query);
    db.executeQuery(res, query);
   
});

app.post("/node/Visy.Middleware.Node/modules/outbound/sap/z3invoice/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//EDI_DC40/DOCNUM'
    }
    
    var companyCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var companyName = {
        data: '//E1EDKA1[PARVW="AG"]/NAME1'
    }
    
    var customerCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var invoiceDate = {
        data: '//E1EDK03[IDDAT="001"]/DATUM'
    }
    
    var invoiceTime = {
        data: ''
    }
    
    
    var query = "Insert into Outbound (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'" + camaro(req.rawBody, companyName).data.replace('\'', '') + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + camaro(req.rawBody, invoiceTime).data + "',  " +
             "'', 'Z3INVOICE')";
    console.log(query);
    db.executeQuery(res, query);
   
});

app.post("/node/Visy.Middleware.Node/modules/outbound/sap/invoice01/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//EDI_DC40/DOCNUM'
    }
    
    var companyCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var companyName = {
        data: '//E2EDKA1003[PARVW="AG"]/NAME1'
    }
    
    var customerCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var invoiceDate = {
        data: '//E2EDK02[QUALF="012"]/DATUM'
    }
    
    var invoiceTime = {
        data: ''
    }
    
    
    var query = "Insert into Outbound (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'" + camaro(req.rawBody, companyName).data.replace('\'', '') + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + camaro(req.rawBody, invoiceTime).data + "',  " +
             "'', 'INVOICE01')";
    console.log(query);
    db.executeQuery(res, query);
   
});

app.get("/node/Visy.Middleware.Node/modules/outbound", function (req , res) {
    var query = "select * from Outbound order by created_date desc";
    db.executeQuery(res, query);
});


var server = http.createServer(app);
var port = process.env.PORT;
server.listen(port);
