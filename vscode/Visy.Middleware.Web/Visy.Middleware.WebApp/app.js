var ordertracking = require('/modules/ordertracking');
var app = ordertracking();
var server = app.listen(5000, function () {
    console.log('Server is running..');
});