exports.index = function(req, res){
	//首页
	res.render('index', {
		title: 'financial-lending'
	})
}

exports.status = function(req, res){
	// 状态页 （传值显示）
	console.log(res.params);
	res.render('status', {
		status: 'success',  // 这里的值可以设定几个现有的
		url: '/'
	})
}  
