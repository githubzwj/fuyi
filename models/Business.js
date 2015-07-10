var keystone = require('keystone'),
		Types = keystone.Field.Types;

/**
 * Business Model
 * ==========
 */

var Business = new keystone.List('Business', {
	map: {name: 'title'},
	autokey: {path: 'slug', from: 'title', unique: true},
	label: '核心业务'
});

Business.add({
	title: {type: String, required: true, label: '标题'},
	state: {type: Types.Select, options: 'draft, published, archived', default: 'draft', index: true, label: '状态'},
	author: {type: Types.Relationship, ref: 'User', index: true, label: '发表人'},
	publishedDate: {type: Types.Date, index: true, dependsOn: {state: 'published'}, label: '发布日期'},
	image: {type: Types.CloudinaryImage, label: '图片'},
	content: {
		brief: {type: Types.Html, wysiwyg: true, height: 150, label: '简要'},
		extended: {type: Types.Html, wysiwyg: true, height: 400, label: '正文'}
	}
});

Business.schema.virtual('content.full').get(function () {
	return this.content.extended || this.content.brief;
});

Business.defaultColumns = 'title,client, state|20%, author|20%, publishedDate|20%';
Business.register();
