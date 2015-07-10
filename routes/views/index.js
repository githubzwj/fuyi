var keystone = require('keystone'), async = require('async');

exports = module.exports = function (req, res) {

	var view = new keystone.View(req, res),
			locals = res.locals;

	// locals.section is used to set the currently selected
	// item in the header navigation.
	locals.section = 'home';


	locals.data = {
		businesss: [],
		busines1:{},
		busines2:{},
		busines3:{}
	};

	// Load the current business
	view.on('init', function (next) {

		var q = keystone.list('Business').model.findOne()
				.where('state', 'published')
				.where('slug','zhi-jie-tou-zi');

		q.exec(function (err, result) {
			locals.data.busines1 = result;
			next(err);
		});

	});

	// Load the current business
	view.on('init', function (next) {

		var q = keystone.list('Business').model.findOne()
				.where('state', 'published')
				.where('slug','zi-chan-chu-zhi');

		q.exec(function (err, result) {
			locals.data.busines2 = result;
			next(err);
		});

	});

	// Load the current business
	view.on('init', function (next) {

		var q = keystone.list('Business').model.findOne()
				.where('state', 'published')
				.where('slug','and');

		q.exec(function (err, result) {
			locals.data.busines3 = result;
			next(err);
		});

	});
	
	// Render the view
	view.render('index');
};
