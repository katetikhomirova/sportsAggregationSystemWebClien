$('#loginForm').ajaxForm({
	url : 'http://localhost:8080/users/signin',
	dataType : 'json',
	success : function(response) {
		$.ajax({
			type : "GET",
			url : 'http://localhost:8080/users/' + $('#login').val(),
			data : '',
			dataType : "json",
			success : function(data) {
				var jsonObj = JSON.stringify(data);
				document.cookie = "user=" + jsonObj;
				document.cookie = "role=" + data.userrole.id;
				document.cookie = "firstName=" + data.firstName;
				document.cookie = "lastName=" + data.lastName;
				document.cookie = "gender=" + data.gender;
				document.cookie = "login=" + data.login;
				document.cookie = "birthday=" + data.birthday;
				// alert(jsonObj);
				// var obj = $.parseJSON(jsonObj);

				// alert(obj.firstName);
				// function forEach(data, callback) {
				// for ( var key in data) {
				// if (data.hasOwnProperty(key)) {
				// callback(key, data[key]);
				// }
				// }
				// }
				// forEach(data, function(key, value) {
				// alert(key + ': ' + value)
				// })
				if (document.cookie.role = 1) {
					window.location.href = "sports";
				}
				if (document.cookie.role = 3) {
					window.location.href = "newCompetition";
				}
			}
		});
	}
});
