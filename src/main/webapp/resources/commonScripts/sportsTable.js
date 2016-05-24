$(document).ready(function() {
	updateSports();
});
var table;
function updateSports() {
	$
			.ajax({
				url : 'http://localhost:8080/sportCategories',
				data : '',
				success : function(data) {
					var dataSet = [];
					for ( var sportCategory in data) {
						if (data[sportCategory].sports.length > 0) {
							var categoryName = data[sportCategory].name;
							for ( var sport in data[sportCategory].sports) {
								var sportArr = [];
								sportArr
										.push(data[sportCategory].sports[sport].id);
								sportArr.push(categoryName);
								if (data[sportCategory].sports[sport].isCommand == 1) {
									sportArr.push("true");
								} else {
									sportArr.push("false");
								}
								sportArr
										.push(data[sportCategory].sports[sport].name);
								dataSet.push(sportArr);
							}

						}
					}
					if (table) {
						table.destroy();
					}
					var buttons = "<div class=\"btn-group\">"
							+ "<button type=\"button\" class=\"btn btn-warning buttonEdit\"><i class=\"fa fa-edit\"></i></button>"
							+ "<button type=\"button\" class=\"btn btn-danger buttonRemove\"><i class=\"fa fa-remove\"></i></button>"
							+ "</div>";
					table = $('#sportsTable').DataTable({
						data : dataSet,
						columns : [ {
							title : "Id"
						}, {
							title : "Category"
						}, {
							title : "Is command"
						}, {
							title : "Name"
						}, {
							title : ""
						} ],
						"paging" : true,
						"lengthChange" : true,
						"searching" : true,
						"ordering" : true,
						"info" : true,
						"destroy" : true,
						"autoWidth" : false,
						"columnDefs" : [ {
							"targets" : -1,
							"data" : null,
							"defaultContent" : buttons,
							"width" : "9%"
						} ]
					});
				},
				dataType : "json"
			});
}