var keystone = require('keystone'), async = require('async');

exports = module.exports = function (req, res) {

	var view = new keystone.View(req, res),
			locals = res.locals;

	// Set locals
	locals.section = 'about';
	locals.filters = {
		about: req.params.about
	};
	locals.data = {
		abouts: []
	};

	// Load the current about
	view.on('init', function (next) {

		var q = keystone.list('About').model.findOne({
			state: 'published',
			slug: locals.filters.about
		});

		q.exec(function (err, result) {
			locals.data.about = result;
			next(err);
		});

	});

	// Load other abouts
	view.on('init', function (next) {

		var q = keystone.list('About').model.find()
				.where('state', 'published');

		if (locals.data.about) {
			q = q.where('title').nin([locals.data.about.title]);
		}
		q = q.sort('-publishedDate').populate('author').limit('4');
		q.exec(function (err, results) {
			locals.data.abouts = results;
			next(err);
		});

	});

	// Render the view
	view.render('about');

};
