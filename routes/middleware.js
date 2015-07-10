var _ = require('underscore');


/**
 Initialises the standard view locals
 */

exports.initLocals = function (req, res, next) {

	var locals = res.locals;

	locals.navLinks = [
		{label: '首页', key: 'home', href: '/'},
		{
			label: '走进尊润', key: 'about', href: '#',
			childLinks: [
				{label: '公司简介', key: 'gong-si-jian-jie', href: '/about/gong-si-jian-jie'},
				{label: '精英团队', key: 'jing-ying-tuan-dui', href: '/about/jing-ying-tuan-dui'},
				{label: '战略资源', key: 'zhan-lve-zi-yuan', href: '/about/zhan-lve-zi-yuan'},
				{label: '企业目标', key: 'qi-ye-mu-biao', href: '/about/qi-ye-mu-biao'},
				{label: '企业文化', key: 'qi-ye-wen-hua', href: '/about/qi-ye-wen-hua'}
			]
		},
		{
			label: '核心业务', key: 'business', href: '#',
			childLinks: [
				{label: '直接投资', key: 'zhi-jie-tou-zi', href: '/business/zhi-jie-tou-zi'},
				{label: '融资&私募', key: 'and', href: '/business/and'},
				{label: '顾问咨询', key: 'gu-wen-zi-xun', href: '/business/gu-wen-zi-xun'},
				{label: '兼并收购', key: 'jian-bing-shou-gou', href: '/business/jian-bing-shou-gou'},
				{label: '资产处置', key: 'zi-chan-chu-zhi', href: '/business/zi-chan-chu-zhi'}
			]
		},
		{label: '主要案例', key: 'solutions', href: '/solutions'},
		{label: '新闻资讯', key: 'blog', href: '/blog'},
		//{ label: '画廊',		key: 'gallery',		href: '/gallery' },
		{label: '联系我们', key: 'contact', href: '/contact'}
	];

	locals.user = req.user;

	next();

};


/**
 Fetches and clears the flashMessages before a view is rendered
 */

exports.flashMessages = function (req, res, next) {

	var flashMessages = {
		info: req.flash('info'),
		success: req.flash('success'),
		warning: req.flash('warning'),
		error: req.flash('error')
	};

	res.locals.messages = _.any(flashMessages, function (msgs) {
		return msgs.length;
	}) ? flashMessages : false;

	next();

};


/**
 Prevents people from accessing protected pages when they're not signed in
 */

exports.requireUser = function (req, res, next) {

	if (!req.user) {
		req.flash('error', 'Please sign in to access this page.');
		res.redirect('/keystone/signin');
	} else {
		next();
	}

};
