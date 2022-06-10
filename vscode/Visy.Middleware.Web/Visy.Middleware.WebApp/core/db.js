
var mssql = require('mssql/msnodesqlv8')
//var mssql = require("mssql");
var dbConfig = {
    //user: 'sa',
    //password: 'P@$$w0rd',
    server: 'WAWSYUBIZD03',
    driver: 'msnodesqlv8',
    database: 'BizTalkData', 
    port: '1433',
    options: {
        trustedConnection: true,
        //instanceName: 'SQLEXPRESS',        
        debug: {
            packet: false,
            payload: false,
            token: false,
            data: false
        },
        //encrypt: true
    }
};

exports.config = dbConfig;


exports.executeQuery = function (res, query) {
    var conn = new mssql.ConnectionPool(dbConfig);
    conn.connect()
        .then(function () {
        var req = new mssql.Request(conn);
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


