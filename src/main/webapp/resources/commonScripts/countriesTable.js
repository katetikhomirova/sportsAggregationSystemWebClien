$(document).ready(function() {
	updateCountries();
});
var table;
function updateCountries() {
	$.ajax({
		url : 'http://localhost:8080/countries',
		data : '',
		success : function(data) {
			var dataSet = [];
			for ( var country in data) {
				var countryArr = [];
				countryArr.push(data[country].id);
				countryArr.push(data[country].name);
				dataSet.push(countryArr);
			}
			if (table) {
				table.destroy();
			}
			table = $('#countriesTable').DataTable({
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