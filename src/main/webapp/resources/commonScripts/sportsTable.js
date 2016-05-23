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
								sportArr
										.push(data[sportCategory].sports[sport].isCommand);
								sportArr
										.push(data[sportCategory].sports[sport].name);
								dataSet.push(sportArr);
							}

						}
					}
					if (table) {
						table.destroy();
					}
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
						} ],
						"paging" : true,
						"lengthChange" : true,
						"searching" : true,
						"ordering" : true,
						"info" : true,
						"destroy" : true,
						"autoWidth" : false
					});
				},
				dataType : "json"
			});
}