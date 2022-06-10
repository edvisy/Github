var db = require("../../core/db");
var sql = require('mssql/msnodesqlv8')
var pdfsettingsmodel = require("../model/pdfsettings");
var lookupmodel = require("../model/interfacelookup");

//get all pdf order settings.
exports.pdfsettings = function (res) {
    var conn = new sql.ConnectionPool(db.config);
	var query = "select * from PDFOrdersSettings order by modified_date desc";
    conn.connect()
        .then(function () {
            var req = new sql.Request(conn);
            req.query(query, function (err, rs) {
                if (err) {
                    console.log("Error while querying database :- " + err);
                    res.send(err);
                }
                else {					
                    res.send(rs);
                }
            });
        })
        .catch(function (err) {
            console.log(err);
            res.send(err);
        })
};

//get pdf order settings by pk.
exports.pdfsettingsgetbyid = function (res, pdfsettingsmodel) {
    var conn = new sql.ConnectionPool(db.config);
	var query = "select * from PDFOrdersSettings where pk = @pk order by created_date desc";
    conn.connect()
        .then(function () {
            var req = new sql.Request(conn);			
			req.input('pk', sql.Int, pdfsettingsmodel.getPk())			
            req.query(query, function (err, rs) {
                if (err) {
                    console.log("Error while querying database :- " + err);
                    res.send(err);
                }
                else {					
                    res.send(rs);
                }
            });
        })
        .catch(function (err) {
            console.log(err);
            res.send(err);
        })
};

//physically delete pdf order settings by pk
exports.pdfsettingdelete = function (res, pdfsettingsmodel) {
    var conn = new sql.ConnectionPool(db.config);
	var query = "Delete From PDFOrdersSettings Where pk = @pk";
    conn.connect()
        .then(function () {
            var req = new sql.Request(conn);			
			req.input('pk', sql.Int, pdfsettingsmodel.getPk())
			req.query(query, function (err, rs) {
                if (err) {
                    console.log("Error while querying database :- " + err);
                    res.send(err);
                }
                else {					
                    res.send(rs);
                }
            });
        })
        .catch(function (err) {
            console.log(err);
            res.send(err);
        })
};


//physically update pdf order settings by pk
exports.updatepdfsetting = function (res, pdfsettingsmodel) {
    var conn = new sql.ConnectionPool(db.config);	
	
	var query = "Update PDFOrdersSettings Set " +
	"from_email=@fromemail "+
	",customer_code=@customercode "+
	",customer_name=@customername "+
	",customer_ean=@customerean "+
	",unit_price_factor=@unitpricefactor  "+
	",modified_date=getdate()  "+
	",modified_by=@modifiedby "+
	"Where pk = @pk ";
	
    conn.connect()
        .then(function () {
            var req = new sql.Request(conn);			
			req.input('pk', sql.Int, pdfsettingsmodel.getPk())
			req.input('fromemail', sql.VarChar, pdfsettingsmodel.getFromEmail())
			req.input('customercode', sql.VarChar, pdfsettingsmodel.getCustomerCode())
			req.input('customername', sql.VarChar, pdfsettingsmodel.getCustomerName())
			req.input('customerean', sql.VarChar, pdfsettingsmodel.getCustomerEAN())
			req.input('unitpricefactor', sql.VarChar, pdfsettingsmodel.getUnitPriceFactor())
			req.input('modifiedby', sql.VarChar, pdfsettingsmodel.getModifiedBy())
			
			req.query(query, function (err, rs) {
                if (err) {
                    console.log("Error while querying database :- " + err);
                    res.send(err);
                }
                else {					
                    res.send(rs);
                }
            });
        })
        .catch(function (err) {
            console.log(err);
            res.send(err);
        })
};


//physically insert pdf order settings by pk
exports.insertpdfsetting = function (res, pdfsettingsmodel) {
    var conn = new sql.ConnectionPool(db.config);	
	var query = "Insert into PDFOrdersSettings (from_email, customer_code, customer_name, customer_ean, unit_price_factor, modified_by, created_by) values "+
	" (@fromemail, @customercode, @customername, @customerean, @unitpricefactor, @modifiedby, @createdby)";  
	
    conn.connect()
        .then(function () {
            var req = new sql.Request(conn);			
			req.input('createdby', sql.VarChar, pdfsettingsmodel.getCreatedBy())
			req.input('fromemail', sql.VarChar, pdfsettingsmodel.getFromEmail())
			req.input('customercode', sql.VarChar, pdfsettingsmodel.getCustomerCode())
			req.input('customername', sql.VarChar, pdfsettingsmodel.getCustomerName())
			req.input('customerean', sql.VarChar, pdfsettingsmodel.getCustomerEAN())
			req.input('unitpricefactor', sql.VarChar, pdfsettingsmodel.getUnitPriceFactor())
			req.input('modifiedby', sql.VarChar, pdfsettingsmodel.getModifiedBy())
			
			req.query(query, function (err, rs) {
                if (err) {
                    console.log("Error while querying database :- " + err);
                    res.send(err);
                }
                else {					
                    res.send(rs);
                }
            });
        })
        .catch(function (err) {
            console.log(err);
            res.send(err);
        })
};

//get all interface lookup.
exports.interfacelookup = function (res) {
    var conn = new sql.ConnectionPool(db.config);
	var query = "select * from InterfaceLookUp order by interface_name asc, modified_date desc";
    conn.connect()
        .then(function () {
            var req = new sql.Request(conn);
            req.query(query, function (err, rs) {
                if (err) {
                    console.log("Error while querying database :- " + err);
                    res.send(err);
                }
                else {					
                    res.send(rs);
                }
            });
        })
        .catch(function (err) {
            console.log(err);
            res.send(err);
        })
};

//physically delete interface lookup by id
exports.interfacelookupdelete = function (res, lookupmodel) {
    var conn = new sql.ConnectionPool(db.config);
    var query = "Delete From InterfaceLookUp Where lookup_id = @lookupid";    
    conn.connect()
        .then(function () {
        var req = new sql.Request(conn);
        req.input('lookupid', sql.Int, lookupmodel.getLookupId())
        req.query(query, function (err, rs) {
            if (err) {
                console.log("Error while querying database :- " + err);
                res.send(err);
            }
            else {
                res.send(rs);
            }
        });
    })
        .catch(function (err) {
        console.log(err);
        res.send(err);
    })
};

//physically update interface lookup
exports.updateinterfacelookup = function (res, lookupmodel) {
    var conn = new sql.ConnectionPool(db.config);
    
    var query = "Update InterfaceLookUp Set " +
	"[key]=@key " +
	",[value]=@value " +
	",interface_name=@interfacename " +
	",modified_date=getdate()  " +
	",modified_by=@modifiedby " +
	"Where lookup_id =@lookupid";
    
    conn.connect()
        .then(function () {
        var req = new sql.Request(conn);
        req.input('lookupid', sql.Int, lookupmodel.getLookupId())
        req.input('key', sql.VarChar, lookupmodel.getKey())
        req.input('value', sql.VarChar, lookupmodel.getValue())
        req.input('interfacename', sql.VarChar, lookupmodel.getInterfaceName())      
        req.input('modifiedby', sql.VarChar, lookupmodel.getModifiedBy())
        
        req.query(query, function (err, rs) {
            if (err) {
                console.log("Error while querying database :- " + err);
                res.send(err);
            }
            else {
                res.send(rs);
            }
        });
    })
        .catch(function (err) {
        console.log(err);
        res.send(err);
    })
};

exports.insertinterfacelookup = function (res, lookupmodel) {
    var conn = new sql.ConnectionPool(db.config);
    var query = "Insert into InterfaceLookUp ([key], [value], interface_name, modified_by, created_by) values "+
    " (@key, @value, @interfacename, @modifiedby, @createdby)";
       
    conn.connect()
        .then(function () {
        var req = new sql.Request(conn);       
        req.input('key', sql.VarChar, lookupmodel.getKey())
        req.input('value', sql.VarChar, lookupmodel.getValue())
        req.input('interfacename', sql.VarChar, lookupmodel.getInterfaceName())
        req.input('createdby', sql.VarChar, lookupmodel.getModifiedBy())
        req.input('modifiedby', sql.VarChar, lookupmodel.getModifiedBy())
        
        req.query(query, function (err, rs) {
            if (err) {
                console.log("Error while querying database :- " + err);
                res.send(err);
            }
            else {
                res.send(rs);
            }
        });
    })
        .catch(function (err) {
        console.log(err);
        res.send(err);
    })
};