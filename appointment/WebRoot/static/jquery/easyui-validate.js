$.extend($.fn.validatebox.defaults.rules, {
		noBlank:{
			validator:function(value){
				console.log(value);
				console.log(value + 'validator');
				return value != '';
			},
			message:"该输入项为必填项"
		},
		numAndWord:{
			validator : function(value) {
				return /^\w+$/.test(value);
			},
			message : "请输入数字、字母或下划线组成的字符串"
		},
		chn:{
			validator : function(value) {
				return /^[\u4E00-\u9FA5]*$/.test(value);
			},
			message : "请输入中文"
		},
		phone:{
			validator : function(value) {
				return (/^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\d{8}$/.test(value)) || (/0\d{2,3}-\d{7,8}/.test(value));
			},
			message : "请输入正确的固话或手机"
		},
	    idCode:{
	          validator:function(value,param){
	            return /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(value);
	          },
	          message: '请输入正确的身份证号'
	    },
		zipCode:{
			validator:function(value,param){
				return /^[0-9]{6}$/.test(value);
			},
			message: '请输入正确的邮编'
		},
		range:{
	          validator:function(value,param){
	            if(/^[1-9]\d*$/.test(value)){
	              return value >= param[0] && value <= param[1]
	            }else{
	              return false;
	            }
	          },
	          message:'输入的数字在{0}到{1}之间'
	    }
});	