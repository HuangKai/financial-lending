var Index = require('../app/controllers/index');
var MyLoan = require('../app/controllers/myloan')


module.exports = function(app){

	// 首页
	app.get('/', Index.index);

	// 所有状态页
	app.get('/status/:status', Index.status);
	// 我要借款
	app.get('/myloan', MyLoan.myloan);
}