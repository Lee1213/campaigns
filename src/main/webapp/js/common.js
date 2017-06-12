/* 登录和注册 */
function login() {
	return location.href = "http://www.dolphinlee.cn:8081/page/login";
	//return location.href = "http://localhost:8081/page/login";
}
function regist() {
	return location.href = "http://www.dolphinlee.cn:8081/page/register";
	//return location.href = "http://localhost:8081/page/register";
}

/** 退出登录的回调函数，使用jsonp跨域请求数据。 */
//function logoutCallback(json) {
//	console.log(json);
//	if (json.status == 200) {
//		var html = "<a href=\"javascript:login()\">[登录]</a>&nbsp;<a href=\"javascript:regist()\">[免费注册]</a>";
//		$("#loginbar").html(html);
//	}
//}
function logout() {
	var _ticket = $.cookie("TT_TOKEN");
	if (!_ticket) {
		return;
	}
	$.ajax({
		url : "http://www.dolphinlee.cn:8081/user/logout/" + _ticket,
		//url : "http://localhost:8081/user/logout/" + _ticket,
		dataType : "jsonp",
		type : "GET",
		success : function(json) {
			if (json.status == 200) {
				var html = "<a href=\"javascript:login()\">[登录]</a>&nbsp;<a href=\"javascript:regist()\">[免费注册]</a>";
				$("#loginbar").html(html);
			}
		}
	});
}
