var Index = require('../app/controllers/index');
var MyLoan = require('../app/controllers/myloan')


module.exports = function(app){

	// 首页
	app.get('/', Index.index);

	// 我要借款
	app.get('/myloan', MyLoan.myloan)
}