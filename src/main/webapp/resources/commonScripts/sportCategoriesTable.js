$(document).ready(function() {
	updateSportCategories();
});
var table;
function updateSportCategories() {
	$
			.ajax({
				url : 'http://localhost:8080/sportCategories',
				data : '',
				success : function(data) {
					var dataSet = [];
					for ( var sportCategory in data) {
						var sportCategoryArr = [];
						sportCategoryArr.push(data[sportCategory].id);
						sportCategoryArr.push(data[sportCategory].name);
						dataSet.push(sportCategoryArr);
					}
					if (table) {
						table.destroy();
					}
					var buttons = "<div class=\"btn-group\">"
							+ "<button type=\"button\" class=\"btn btn-warning buttonEdit\"><i class=\"fa fa-edit\"></i></button>"
							+ "<button type=\"button\" class=\"btn btn-danger buttonRemove\"><i class=\"fa fa-remove\"></i></button>"
							+ "</div>";
					table = $('#sportCategories').DataTable({
						data : dataSet,
						columns : [ {
							title : "Id"
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
							"width": "9%"
						} ]
					});
				},
				dataType : "json"
			});
}