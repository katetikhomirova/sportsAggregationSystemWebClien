$(function() {
	$('#addSportButton').click(function() {
		updateSportCategoriesList();
	});
	$('#addCategory').click(function() {
		$('#addNewSportCategory').ajaxForm({
			url : 'http://localhost:8080/sportCategories',
			dataType : 'json',
			success : function(response) {
				alert(response.name);
				updateSportCategoriesList();
				$('#categoryName').val(response.id);
			}
		});
		$("#addNewSportCategory").submit();
	});

	$('#save').click(function() {
		$('#addNewSport').ajaxForm({
			url : 'http://localhost:8080/sports',
			dataType : 'json',
			success : function(response) {
				updateSports();
				$('#addSport').modal('hide');
			},
			error : function(data) {
				alert("Something goes wong");
			}
		});
		$("#addNewSport").submit();
	});
});
function updateSportCategoriesList() {
	$.ajax({
		url : 'http://localhost:8080/sportCategories',
		data : '',
		success : function(data) {
			var dataSet = [];
			var html;
			for ( var sportCategory in data) {
				$("#categoryName").append(
						$('<option value=\"' + data[sportCategory].id + '\">'
								+ data[sportCategory].name + '</option>'));
			}
		},
		dataType : "json",
		async : false
	});

}