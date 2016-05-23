$(document).ready(function() {
	updateSportCategories();
});
var table;
function updateSportCategories() {
	$.ajax({
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
			table = $('#sportCategories').DataTable({
				data : dataSet,
				columns : [ {
					title : "Id"
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