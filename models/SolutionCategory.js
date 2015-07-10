var keystone = require('keystone');

/**
 * SolutionCategory Model
 * ==================
 */

var SolutionCategory = new keystone.List('SolutionCategory', {
	autokey: { from: 'name', path: 'key', unique: true },
	label:'案列分类'
});

SolutionCategory.add({
	name: { type: String, required: true, label: '名称' }
});

SolutionCategory.relationship({ ref: 'Solution', path: 'categories' });

SolutionCategory.register();
