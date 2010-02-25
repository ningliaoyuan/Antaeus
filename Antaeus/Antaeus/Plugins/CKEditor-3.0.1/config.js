/*
Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/


CKEDITOR.editorConfig = function( config )
{
	//Define changes to default configuration here. For example:
	config.language = 'zh-cn'; //配置语言
	config.uiColor = '#FFF'; //背景颜色
	config.width = 660; //宽度
	config.height = 300; //高度
	config.resize_enabled = false;
	config.skin='kama';
	config.toolbar =
	[
		['Source','Bold','Italic','Underline','NumberedList','BulletedList','Blockquote'],
		['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
		['Link','Unlink','Anchor','-','Image','Table'],
		'/',
		['Styles','Format','Font','FontSize'],
		['TextColor','BGColor']	
	];
};