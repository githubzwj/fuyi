// Simulate config options from your production environment by
// customising the .env file in your project's root folder.
require('dotenv').load();

// Require keystone
var keystone = require('keystone'),
	swig = require('swig');

// Disable swig's bulit-in template caching, express handles it
swig.setDefaults({ cache: false });

keystone.init({

	'name': '尊润资产',
	'brand': '尊润资产',
	
	'less': 'public',
	'static': 'public',
	'favicon': 'public/favicon.ico',
	'views': 'templates/views',
	'view engine': 'swig',
	
	'custom engine': swig.renderFile,
	
	'auto update': true,
	'session': true,
	'auth': true,
	'user model': 'User',
	'cookie secret': '4]fzFTeH.=.$GgZ+pU"Wl-T{?#K<=af~T$38rQ(t,93t3M1nrypg"gy9<5si0[qn'

});

keystone.import('models');

keystone.set('locals', {
	_: require('underscore'),
	env: keystone.get('env'),
	utils: keystone.utils,
	editable: keystone.content.editable
});

keystone.set('routes', require('./routes'));

keystone.set('nav', {
	'abouts': 'abouts',
	'businesses': 'businesses',
	'solutions': ['solutions', 'solution-categories'],
	'posts': ['posts', 'post-categories'],
	'galleries': 'galleries',
	'enquiries': 'enquiries',
	'users': 'users'
});

keystone.start();
