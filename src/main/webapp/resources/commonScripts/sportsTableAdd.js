$(document).ready(function() {
	updateSports();
});
var table;
var counter = 1;
var dataSet;
var currentDataSet;
function addSportToList(id, sportCategory, isCommand, sportName) {
	$('#addSportFromTable').modal('hide');
	var command = isCommand == "true" ? "command" : "not command";
	var listRow = "<li id=\"sportRow" + id + "\">" + sportName + " ("
			+ sportCategory + ", " + command
			+ ") <a onclick=\"removeSportFromList(" + id
			+ ")\">remove</a></li>";
	var hidden = "<input id=\"hidden" + id
			+ "\" type=\"hidden\" name=\"sport\" value=\"" + id + "\">";
	$('#sportsList').append(listRow);
	$('#hiddenSportsId').append(hidden);
	for (var i = 0; i < currentDataSet.length; i++) {
		if (currentDataSet[i][0] == id) {
			currentDataSet.splice(i, 1);
		}
	}
	updateTable(currentDataSet);
};

function removeSportFromList(id) {
	for (var i = 0; i < dataSet.length; i++) {
		if (dataSet[i][0] == id) {
			currentDataSet.push(dataSet[i]);
		}
	}
	updateTable(currentDataSet);
	$('#hidden' + id).remove();
	$('#sportRow' + id).remove();

};

function updateTable(dataSet) {
	if (table) {
		table.destroy();
	}
	var buttons = "<div class=\"btn-group\">"
			+ "<button type=\"button\" class=\"btn btn-success addSportFromTableButton\"><i class=\"fa fa-plus\"></i></button>"
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
			"targets" : [ 0 ],
			"visible" : false,
			"searchable" : false
		}, {
			"targets" : 4,
			"data" : null,
			"defaultContent" : buttons,
			"width" : "9%"
		} ]
	});
}

function updateSports() {
	$.ajax({
		url : 'http://localhost:8080/sportCategories',
		data : '',
		success : function(data) {
			dataSet = [];
			for ( var sportCategory in data) {
				if (data[sportCategory].sports.length > 0) {
					var categoryName = data[sportCategory].name;
					for ( var sport in data[sportCategory].sports) {
						var sportArr = [];
						sportArr.push(data[sportCategory].sports[sport].id);
						sportArr.push(categoryName);
						if (data[sportCategory].sports[sport].isCommand == 1) {
							sportArr.push("true");
						} else {
							sportArr.push("false");
						}
						sportArr.push(data[sportCategory].sports[sport].name);
						dataSet.push(sportArr);
					}

				}
			}
			updateTable(dataSet);
			currentDataSet = dataSet.slice();
		},
		dataType : "json"
	});
	$('#sportsTable').on('click', '.addSportFromTableButton', function() {
		var data = table.row($(this).parents('tr')).data();
		addSportToList(data[0], data[1], data[2], data[3]);
	});
}