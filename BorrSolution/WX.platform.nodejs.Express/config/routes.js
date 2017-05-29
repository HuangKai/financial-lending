var Index = require('../app/controllers/index');


module.exports = function(app){

	// 首页
	app.get('/', Index.index);
}