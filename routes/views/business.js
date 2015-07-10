var keystone = require('keystone'),async = require('async');

exports = module.exports = function(req, res) {

	var view = new keystone.View(req, res),
			locals = res.locals;

	// Set locals
	locals.section = 'business';
	locals.filters = {
		business: req.params.business
	};
	locals.data = {
		businesss: []
	};

	// Load the current business
	view.on('init', function(next) {

		var q = keystone.list('Business').model.findOne({
			state: 'published',
			slug: locals.filters.business
		});

		q.exec(function(err, result) {
			locals.data.business = result;
			next(err);
		});

	});

	// Load other businesss
	view.on('init', function(next) {

		var q = keystone.list('Business').model.find()
				.where('state', 'published');
		if (locals.data.business) {
			q = q.where('title').nin([locals.data.business.title]);
		}
		q = q.sort('-publishedDate').populate('author').limit('4');
		q.exec(function(err, results) {
			locals.data.businesss = results;
			next(err);
		});

	});

	// Render the view
	view.render('business');

};
