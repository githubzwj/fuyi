var keystone = require('keystone'),
	Types = keystone.Field.Types;

/**
 * Gallery Model
 * =============
 */

var Gallery = new keystone.List('Gallery', {
	autokey: { from: 'name', path: 'key', unique: true },
	label:'画廊'
});

Gallery.add({
	name: { type: String, required: true , label: '姓名'},
	publishedDate: { type: Date, default: Date.now , label: '发布日期'},
	heroImage: { type: Types.CloudinaryImage , label: '标题图片'},
	images: { type: Types.CloudinaryImages , label: '图片集'}
});

Gallery.register();
