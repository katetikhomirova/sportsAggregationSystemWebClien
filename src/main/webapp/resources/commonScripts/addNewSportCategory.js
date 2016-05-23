$(function() {
	$('#save').click(function() {
		$('#sportCategoryForm').ajaxForm({
			url : 'http://localhost:8080/sportCategories',
			dataType : 'json',
			success : function(response) {
				updateSportCategories();
			},
			error : function(data) {
				alert("Something goes wong");
			}
		});
		$("#sportCategoryForm").submit();
		$('#addSportCategory').modal('hide');
	});
});