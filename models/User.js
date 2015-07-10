var keystone = require('keystone'),
	Types = keystone.Field.Types;

/**
 * User Model
 * ==========
 */

var User = new keystone.List('User',{label:'用户'});

User.add({
	name: { type: Types.Name, required: true, index: true , label: '姓名'},
	email: { type: Types.Email, initial: true, required: true, index: true , label: '邮箱'},
	password: { type: Types.Password, initial: true, required: true , label: '密码'}
}, 'Permissions', {
	isAdmin: { type: Boolean, index: true , label: '是否管理员'}
});

// Provide access to Keystone
User.schema.virtual('canAccessKeystone').get(function() {
	return this.isAdmin;
});


/**
 * Relationships
 */

User.relationship({ ref: 'Post', path: 'posts', refPath: 'author' });


/**
 * Registration
 */

User.defaultColumns = 'name, email, isAdmin';
User.register();
