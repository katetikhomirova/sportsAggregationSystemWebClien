var cityName;
$(document)
		.ready(
				function() {
					updateSports();
					$("#searchLocationButton")
							.click(
									function() {
										var searchUrl = "https://maps.googleapis.com/maps/api/geocode/json?address="
												+ $('#searchLocation').val()
												+ "&language=en";
										$
												.get(
														searchUrl,
														function(data, status) {
															$(
																	'#addPlaceAddress')
																	.html(
																			data.results[0].formatted_address);
														});
									});
				});

var map;
var myLatLng;
function mapsDisplay(lat, lng, markerTitle, bubbleInfo) {
	myLatlng = new google.maps.LatLng(lat, lng);
	var map_options = {
		zoom : 16,
		mapTypeControl : false,
		center : myLatlng,
		panControl : false,
		rotateControl : false,
		streetViewControl : false,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById("map"), map_options);

	var infowindow = new google.maps.InfoWindow({
		content : bubbleInfo
	});

	var marker = new google.maps.Marker({
		position : myLatlng,
		map : map,
		title : markerTitle,
		maxWidth : 200,
		maxHeight : 200
	});

	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});

	$('#mapmodal').on('shown.bs.modal', function() {
		google.maps.event.trigger(map, 'resize');
		console.log(lat + " onshown " + lng);
		map.setCenter(new google.maps.LatLng(lat, lng));
	})
}
var table;
function updateSports() {
	$
			.ajax({
				url : 'http://localhost:8080/places',
				data : '',
				success : function(data) {
					var dataSet = [];
					for ( var i in data) {
						var placesArr = [];
						placesArr.push(data[i].id);
						placesArr.push(data[i].name);
						placesArr.push(data[i].address);
						placesArr.push(data[i].description);
						placesArr.push(data[i].lat);
						placesArr.push(data[i].lng);
						dataSet.push(placesArr);
					}
					if (table) {
						table.destroy();
					}
					table = $('#citiesTable')
							.DataTable(
									{
										data : dataSet,
										columns : [ {
											title : "Id"
										}, {
											title : "Name"
										}, {
											title : "Address"
										}, {
											title : "Description"
										}, {
											title : "Lat"
										}, {
											title : "Lng"
										}, {
											title : "Show on map"
										} ],
										"paging" : true,
										"lengthChange" : true,
										"searching" : true,
										"ordering" : true,
										"info" : true,
										"destroy" : true,
										"autoWidth" : false,
										"columnDefs" : [
												{
													"targets" : -1,
													"data" : null,
													"defaultContent" : "<button type=\"button\" class=\"btn btn-success\" >Show on map</button>"
												}, {
													"targets" : [ 4 ],
													"visible" : false,
													"searchable" : false
												}, {
													"targets" : [ 5 ],
													"visible" : false,
													"searchable" : false
												} ]
									});
				},
				dataType : "json"
			});
	$('#citiesTable').on('click', 'button', function() {
		var data = table.row($(this).parents('tr')).data();
		console.log(data[4] + " : " + data[5]);
		mapsDisplay(data[4], data[5], data[1], data[1]);
		$('#mapLabel').html(data[1]);
		$('#mapAddress').html(data[2]);
		$('#mapDescription').html(data[3]);
		$('#mapmodal').modal('show');
	});
}
