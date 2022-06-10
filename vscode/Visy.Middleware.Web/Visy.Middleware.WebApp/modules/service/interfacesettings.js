var db = require("../core/db");
var intefacesettingsdb = require("./db/interfacesettingsdb");
var pdfsettingsmodel = require("./model/pdfsettings");
var lookupmodel = require("./model/interfacelookup");
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

app.get("/node/Visy.Middleware.Node/modules/interface/interfacesettings", function (req, res) {
    intefacesettingsdb.interfacelookup(res);
});

app.post("/node/Visy.Middleware.Node/modules/interface/interfacesettings/update", function (req, res) {
    var json = req.rawBody;
    obj = JSON.parse(json);

    var lum = new lookupmodel();
    lum.setLookupId(obj.lookup_id);
    lum.setKey(obj.key);
    lum.setValue(obj.value);
    lum.setInterfaceName(obj.interface_name);
    lum.setModifiedBy(obj.modified_by);

    intefacesettingsdb.updateinterfacelookup(res, lum);
});

app.post("/node/Visy.Middleware.Node/modules/interface/interfacesettings/create", function (req, res) {
    var json = req.rawBody;
    obj = JSON.parse(json);

    var lum = new lookupmodel();
    lum.setLookupId(obj.lookup_id);
    lum.setKey(obj.key);
    lum.setValue(obj.value);
    lum.setInterfaceName(obj.interface_name);
    lum.setModifiedBy(obj.modified_by);

    intefacesettingsdb.insertinterfacelookup(res, lum);
});

app.post("/node/Visy.Middleware.Node/modules/interface/interfacesettings/delete/:id", function (req, res) {
    var lum = new lookupmodel();
    lum.setLookupId(req.params.id);
    intefacesettingsdb.interfacelookupdelete(res, lum);
});

app.get("/node/Visy.Middleware.Node/modules/interface/pdfsettings", function (req, res) {
    intefacesettingsdb.pdfsettings(res);
});

app.get("/node/Visy.Middleware.Node/modules/interface/pdfsettings/getbyid/:id", function (req, res) {
    var psm = new pdfsettingsmodel();
    psm.setPk(req.params.id);
    intefacesettingsdb.pdfsettingsgetbyid(res, psm);
});

app.post("/node/Visy.Middleware.Node/modules/interface/pdfsettings/create", function (req, res) {
    var json = req.rawBody;
    obj = JSON.parse(json);

    var psm = new pdfsettingsmodel();

    psm.setFromEmail(obj.from_email);
    psm.setCustomerCode(obj.customer_code);
    psm.setCustomerName(obj.customer_name);
    psm.setCustomerEAN(obj.customer_ean);
    psm.setUnitPriceFactor(obj.unit_price_factor);
    psm.setModifiedBy(obj.modified_by);
    psm.setCreatedBy(obj.created_by);

    intefacesettingsdb.insertpdfsetting(res, psm);
});

app.post("/node/Visy.Middleware.Node/modules/interface/pdfsettings/update", function (req, res) {
    var json = req.rawBody;
    obj = JSON.parse(json);

    var psm = new pdfsettingsmodel();

    psm.setPk(obj.pk);
    psm.setFromEmail(obj.from_email);
    psm.setCustomerCode(obj.customer_code);
    psm.setCustomerName(obj.customer_name);
    psm.setCustomerEAN(obj.customer_ean);
    psm.setUnitPriceFactor(obj.unit_price_factor);
    psm.setModifiedBy(obj.modified_by);

    intefacesettingsdb.updatepdfsetting(res, psm);
});

app.post("/node/Visy.Middleware.Node/modules/interface/pdfsettings/delete/:id", function (req, res) {
    var psm = new pdfsettingsmodel();
    psm.setPk(req.params.id);
    intefacesettingsdb.pdfsettingdelete(res, psm);
});


var server = http.createServer(app);
var port = process.env.PORT;
server.listen(port);
