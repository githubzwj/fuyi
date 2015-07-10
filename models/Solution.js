var keystone = require('keystone'),
		Types = keystone.Field.Types;

/**
 * Solution Model
 * ==========
 */

var Solution = new keystone.List('Solution', {
	map: {name: 'title'},
	autokey: {path: 'slug', from: 'title', unique: true},
	label: '案列'
});

Solution.add({
	title: {type: String, required: true, label: '标题'},
	client: {type: String, initial: true, required: true, label: '客户'},
	completeDate: {type: Types.Date, initial: true, index: true, label: '完成日期'},
	state: {type: Types.Select, options: 'draft, published, archived', default: 'draft', index: true, label: '状态'},
	author: {type: Types.Relationship, ref: 'User', index: true, label: '发表人'},
	publishedDate: {type: Types.Date, index: true, dependsOn: {state: 'published'}, label: '发布日期'},
	image: {type: Types.CloudinaryImage, label: '图片'},
	content: {
		brief: {type: Types.Html, wysiwyg: true, height: 150, label: '简要'},
		extended: {type: Types.Html, wysiwyg: true, height: 400, label: '正文'} 
	},
	categories: {type: Types.Relationship, ref: 'SolutionCategory', many: true, label: '分类'}
});

Solution.schema.virtual('content.full').get(function () {
	return this.content.extended || this.content.brief;
});

Solution.defaultColumns = 'title, state|20%, author|20%, publishedDate|20%';
Solution.register();
