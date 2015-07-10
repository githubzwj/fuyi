var keystone = require('keystone'),
	Types = keystone.Field.Types;

/**
 * Enquiry Model
 * =============
 */

var Enquiry = new keystone.List('Enquiry', {
	nocreate: true,
	noedit: true,
	label:'询问'
});

Enquiry.add({
	name: { type: Types.Name, required: true , label: '姓名'},
	email: { type: Types.Email, required: true , label: '邮箱'},
	phone: { type: String , label: '电话'},
	enquiryType: { type: Types.Select, options: [
		{ value: 'message', label: 'Just leaving a message' },
		{ value: 'question', label: '我有个问题' },
		{ value: 'other', label: '其他...' }
	] },
	message: { type: Types.Markdown, required: true , label: '内容'},
	createdAt: { type: Date, default: Date.now , label: '提交日期'}
});

Enquiry.defaultSort = '-createdAt';
Enquiry.defaultColumns = 'name, email, enquiryType, createdAt';
Enquiry.register();
