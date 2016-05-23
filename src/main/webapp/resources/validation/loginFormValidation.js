$(document).ready(
		function() {

			$('#loginForm').validate(
					{
						rules : {
							login : {
								minlength : 2,
								required : true
							},
							password : {
								minlength : 2,
								required : true
							},
						},
						highlight : function(element) {
							$(element).closest('.form-group').removeClass(
									'has-success').addClass('has-error');
						},
						success : function(element) {
							element.addClass('valid').closest(
									'.form-group').removeClass('has-error')
									.addClass('has-success');
						}
					});

		});