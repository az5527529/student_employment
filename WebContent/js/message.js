(function($){
	var cms = window.cms = window.cms || {};
	
	//封装EasyUi Messager对话框
	cms.showMsg = function(title, msg){
		$.messager.show({
			title : title,
			msg : msg
		});
	}
	
	cms.infoMsg = function(title, msg){
		$.messager.alert(title, msg, 'info');
	}
	
	cms.questionMsg = function(title, msg){
		$.messager.alert(title, msg, 'question');
	}
	
	cms.warningMsg = function(title, msg){
		$.messager.alert(title, msg, 'warning');
	}
	
	cms.errorMsg = function(title, msg){
		$.messager.alert(title, msg, 'error');
	}
	
	cms.successMsg = function(title, msg){
		$.messager.alert(title, msg, 'success');
	}
	
	//confirm
	cms.confirmMsg = function(title, msg, fn){
		$.messager.confirm(title, msg, fn);
	}
	
})(jQuery);