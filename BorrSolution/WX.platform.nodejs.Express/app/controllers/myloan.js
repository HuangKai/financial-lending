console.log('access')
exports.myloan = function(req, res){
	console.log('in')
	// 我要借款首页
	res.render('myloan', {
		title: 'myloan'
	})
}

    
