var db = require("../core/db");
var express = require("express");
var http = require('http');
var app = express();



const camaro = require('camaro')

//app.use(bodyParser.json()); 

var bodyParser = require("body-parser");
var rawBodySaver = function (req, res, buf, encoding) {
    if (buf && buf.length) {
        req.rawBody = buf.toString(encoding || 'utf8');
    }
}

app.use(bodyParser.json({ verify: rawBodySaver, limit: '50mb' }));
app.use(bodyParser.urlencoded({ verify: rawBodySaver, extended: true, limit: '50mb', parameterLimit: 50000 }));
app.use(bodyParser.raw({ verify: rawBodySaver, limit: '50mb', parameterLimit: 50000, type: function () { return true } }));

app.post("/node/Visy.Middleware.Node/modules/vbam/officeworks/orders/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: "//*[local-name()='E2EDK01005'][1]/*[local-name()='BELNR']"
    }
    
    var companyCode = {
        data: '//ns1:E2EDKA1003[ns1:PARVW="WE"]/ns1:LIFNR'
    }
    
    var companyName = {
        data: 'OFFICEWORKS'
    }
    
    var customerCode = {
        data: '//ns1:EDI_DC40/ns2:RCVPRN'
    }
    
    var invoiceDate = {
        data: '//ns1:E2EDK03[ns1:IDDAT="002"]/ns1:DATUM'
    }
    
    var invoiceTime = {
        data: ''
    }
    
    var mesType = {
        data: '//ns1:EDI_DC40/ns2:MESTYP'
    }
    var query = "Insert into VBAMTracking (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('IBM Sterling'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'OFFICEWORKS',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + "',  " +
             "'', '" + camaro(req.rawBody, mesType).data + "')";
    console.log(query);
    db.executeQuery(res, query);
   
});

app.post("/node/Visy.Middleware.Node/modules/vbam/sap/orders/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: "//*[local-name()='E2EDK01005'][1]/*[local-name()='BELNR']"
    }
    
    var companyCode = {
        data: "//*[local-name()='E2EDKA1003GRP'][*[local-name()='E2EDKA1003']/*[local-name()='PARVW']='AG']/*[local-name()='E2EDKA1003']/*[local-name()='PARTN']"
    }
    
    var companyName = {
        data: "//*[local-name()='E2EDKA1003GRP'][*[local-name()='E2EDKA1003']/*[local-name()='PARVW']='WE']/*[local-name()='E2EDKA1003']/*[local-name()='NAME1']"
    }
    
    var customerCode = {
        data: "//*[local-name()='EDI_DC40']/*[local-name()='RCVPRN']"
    }
    
    var invoiceDate = {
        data: "//*[local-name()='E2EDK03'][*[local-name()='IDDAT']='012']/*[local-name()='DATUM']"
    }
    
    var invoiceTime = {
        data: ''
    }
    
    var mesType = {
        data: "//*[local-name()='EDI_DC40']/*[local-name()='MESTYP']"
    }
    
    var query = "Insert into VBAMTracking (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'" + camaro(req.rawBody, companyName).data.replace('\'', '') + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + "',  " +
             "'', '" + camaro(req.rawBody, mesType).data + "')";
    console.log(query);
    db.executeQuery(res, query);
   
});


app.post("/node/Visy.Middleware.Node/modules/vbam/officeworks/desadv/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//ZASN_HEADER000GRP[1]/ZASN_HEADER000/PO_NO'
    }
    
    var companyCode = {
        data: '//ZASN_HEADER000GRP[1]/ZASN_HEADER000/SHIP_TO_CODE'
    }
    
    var companyName = {
        data: 'OFFICEWORKS'
    }
    
    var customerCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var invoiceDate = {
        data: '//ZASN_HEADER000GRP[1]/ZASN_HEADER000/IDOC_DATE'
    }
    
    var invoiceTime = {
        data: ''
    }
    
    
    var query = "Insert into VBAMTracking (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'OFFICEWORKS',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + "',  " +
             "'', 'ZADSHNO02')";
    console.log(query);
    db.executeQuery(res, query);
   
});

app.post("/node/Visy.Middleware.Node/modules/vbam/officeworks/ordrsp/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//ZPOA_HEADER000GRP[1]/ZPOA_HEADER000/PO_NO_REF'
    }
    
    var companyCode = {
        data: '//ZPOA_HEADER000GRP[1]/ZPOA_HEADER000/SHIP_TO_CODE'
    }
    
    var companyName = {
        data: 'OFFICEWORKS'
    }
    
    var customerCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var invoiceDate = {
        data: '//ZPOA_HEADER000GRP[1]/ZPOA_HEADER000/DELIVERY_DATE'
    }
    
    var invoiceTime = {
        data: ''
    }
    
    
    var query = "Insert into VBAMTracking (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'OFFICEWORKS',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + "',  " +
             "'', 'ZPOAORD01')";
    console.log(query);
    db.executeQuery(res, query);
   
});

app.post("/node/Visy.Middleware.Node/modules/vbam/magento/invoice/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//E2EDK01005[1]/BELNR'
    }
    
    var companyCode = {
        data: '//E2EDKA1003[PARVW="AG"]/NAME1'
    }
    
    var companyName = {
        data: '//E2EDKA1003[PARVW="AG"]/NAME1'
    }
    
    var customerCode = {
        data: '//EDI_DC40/RCVPRN'
    }
    
    var invoiceDate = {
        data: '//E2EDK03[IDDAT="001"]/DATUM'
    }
    
    var invoiceTime = {
        data: ''
    }
    
    var mesType = {
        data: '//EDI_DC40/MESTYP'
    }
    var query = "Insert into VBAMTracking (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('SAP'," + 
             "'" + camaro(req.rawBody, invoiceNumber).data + "',  " + 
             "'',  " +
              "'" + camaro(req.rawBody, companyName).data + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + "',  " +
             "'', '" + camaro(req.rawBody, mesType).data + "')";
    console.log(query);
    db.executeQuery(res, query);
   
});
app.post("/node/Visy.Middleware.Node/modules/vbam/magento/orders/insert", function (req, res) {
    var data = '';
    req.on('data', function (chunk) {
        data += chunk;
    });
    req.on('end', function () {
        req.rawBody = data;
    });
    
    var invoiceNumber = {
        data: '//result/increment_id'
    }
    
    var po_number = {
        data: '//result/payment/po_number'
    }
    
    var companyCode = {
        data: '//result/sap_customer_code'
    }
    
    var customerFirstName = {
        data: '//result/customer_firstname'
    }
    
    var customerLastName = {
        data: '//result/customer_lastname'
    }
    
    var customerCode = {
        data: '//result/store_id'
    }
    
    var invoiceDate = {
        data: '//result/created_at'
    }
    
    var invoiceTime = {
        data: ''
    }
    
    var mesType = {
        data: '//ns1:EDI_DC40/ns2:MESTYP'
    }
    
    var refID = ''
    
    
    refID = camaro(req.rawBody, invoiceNumber).data
    
    
    var query = "Insert into VBAMTracking (source, reference_number, company_code, company_name, customer_code, reference_date, source_file_name, message_type) Values ('MAGENTO'," + 
             "'" + refID + "',  " + 
             "'" + camaro(req.rawBody, companyCode).data + "',  " +
             "'" + camaro(req.rawBody, customerFirstName).data + "' + ' ' + '" + camaro(req.rawBody, customerLastName).data + "',  " +
             "'" + camaro(req.rawBody, customerCode).data + "',  " +
             "'" + camaro(req.rawBody, invoiceDate).data + "',  " +
             "'', 'ORDERS')";
    console.log(query);
    db.executeQuery(res, query);
   
});




app.post("/node/Visy.Middleware.Node/modules/vbam/magento/orders/test/:fname*", function (req, res) {
    
    console.log(req.params[0].substr(req.params[0].lastIndexOf("/") + 1, req.params[0].length));
	
	
});


app.get("/node/Visy.Middleware.Node/modules/vbam/tracking", function (req , res) {
    var query = "select * from VBAMTracking order by created_date desc";
    db.executeQuery(res, query);
});


var server = http.createServer(app);
var port = process.env.PORT;
server.listen(port);
