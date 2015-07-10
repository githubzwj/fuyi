var keystone = require('keystone'),async = require('async');

exports = module.exports = function(req, res) {
	
	var view = new keystone.View(req, res),
		locals = res.locals;
	
	// Set locals
	locals.section = 'solutions';
	locals.filters = {
		solution: req.params.solution
	};
	locals.data = {
		solutions: [],
		categories: []
	};


	// Load all categories
	//view.on('init', function(next) {
    //
	//	keystone.list('SolutionCategory').model.find().sort('name').exec(function(err, results) {
    //
	//		if (err || !results.length) {
	//			return next(err);
	//		}
    //
	//		locals.data.categories = results;
    //
	//		// Load the counts for each category
	//		async.each(locals.data.categories, function(category, next) {
    //
	//			keystone.list('Solution').model.count().where('category').in([category.id]).exec(function(err, count) {
	//				category.solutionCount = count;
	//				next(err);
	//			});
    //
	//		}, function(err) {
	//			next(err);
	//		});
    //
	//	});
    //
	//});
	
	
	// Load the current solution
	view.on('init', function(next) {
		
		var q = keystone.list('Solution').model.findOne({
			state: 'published',
			slug: locals.filters.solution
		}).populate('author categories');
		
		q.exec(function(err, result) {
			locals.data.solution = result;
			next(err);
		});
		
	});

	// Load the current category filter
	view.on('init', function(next) {
		if (locals.data.solution && locals.data.solution.categories.length ) {
			keystone.list('SolutionCategory').model.findOne({ name: locals.data.solution.categories[0].name }).exec(function(err, result) {
				locals.data.category = result;
				next(err);
			});
		} else {
			next();
		}
	});
	
	// Load other solutions
	view.on('init', function(next) {
		if(locals.data.category ) {
			var q = keystone.list('Solution').model.find()
					.where('state', 'published')
					.where('title').nin([locals.data.solution.title])
					.where('categories').in([locals.data.category])
					.sort('-publishedDate').populate('author').limit('4');

			q.exec(function (err, results) {
				locals.data.solutions = results;
				next(err);
			});
		}else {
			next();
		}
		
	});
	
	// Render the view
	view.render('solution');
	
};
