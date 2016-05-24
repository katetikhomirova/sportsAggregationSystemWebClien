var cityName;
var map;
var addPlaceMap;
var myLatLng;
var marker;
$(document).ready(function() {
	updatePlaces();
	$('#searchLocationButton').click(function() {
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : $('#searchLocation').val(),
			'language' : 'en'
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				zoomMapsDisplay("addPlaceMap", '#addPlaceMapModal');

				$('#addPlaceAddress').html(results[0].formatted_address);
				$('#addresForm').val(results[0].formatted_address);
				addPlaceMap.setCenter(results[0].geometry.location);
				addPlaceMap.fitBounds(results[0].geometry.viewport);
			}
		});
	});
	$('#addNewPlaceButton').click(function() {
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : 'ukraine'
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				zoomMapsDisplay("addPlaceMap", '#addPlaceMapModal');
				addPlaceMap.setCenter(results[0].geometry.location);
				addPlaceMap.fitBounds(results[0].geometry.viewport);
			}
		});

	});

	$('#save').click(function() {
		$('#placesForm').ajaxForm({
			url : 'http://localhost:8080/places',
			dataType : 'json',
			success : function(response) {
				updatePlaces();
			},
			error : function(data) {
				alert("Something goes wong");
			}
		});
		$("#placesForm").submit();
		$('#addPlaceMapModal').modal('hide');
	});
});

function mapsDisplay(mapElementId, mapModalId, lat, lng, markerTitle,
		bubbleInfo) {
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

	map = new google.maps.Map(document.getElementById(mapElementId),
			map_options);

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

	$(mapModalId).on('shown.bs.modal', function() {
		google.maps.event.trigger(map, 'resize');
		map.setCenter(new google.maps.LatLng(lat, lng));
	})
}

function placeMarker(location) {
	var clickedLocation = new google.maps.LatLng(location);
	if (marker) {
		marker.setMap(null);
	}
	marker = new google.maps.Marker({
		position : location,
		map : addPlaceMap,
		draggable : true
	});
	updateAddress();
	$('#latInput').val(marker.getPosition().lat());
	$('#lngInput').val(marker.getPosition().lng());
	marker.addListener('dragend', function(event) {
		updateAddress();
		$('#latInput').val(marker.getPosition().lat());
		$('#lngInput').val(marker.getPosition().lng());
	});
}

function updateAddress() {
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'location' : marker.getPosition(),
		'language' : "en"
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			$('#addPlaceAddress').html(results[0].formatted_address);
			$('#addresForm').val(results[0].formatted_address);
		}
	});
}

function zoomMapsDisplay(mapElementId, mapModalId) {
	var map_options = {
		mapTypeControl : false,
		panControl : false,
		rotateControl : false,
		streetViewControl : false,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};

	addPlaceMap = new google.maps.Map(document.getElementById(mapElementId),
			map_options);

	google.maps.event.addListener(addPlaceMap, 'click', function(event) {
		placeMarker(event.latLng);
	});

	$(mapModalId).on('shown.bs.modal', function() {
		google.maps.event.trigger(addPlaceMap, 'resize');
	})
}

var table;
function updatePlaces() {
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
					var buttons = "<div class=\"btn-group-vertical\">"
							+ "<button type=\"button\" class=\"btn btn-success buttonShow\"><i class=\"fa fa-eye\"></i></button>"
							+ "<button type=\"button\" class=\"btn btn-warning buttonEdit\"><i class=\"fa fa-edit\"></i></button>"
							+ "<button type=\"button\" class=\"btn btn-danger buttonRemove\"><i class=\"fa fa-remove\"></i></button>"
							+ "</div>";
					
					table = $('#citiesTable').DataTable({
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
							"defaultContent" : buttons
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
	$('#citiesTable').on('click', '.buttonShow', function() {
		var data = table.row($(this).parents('tr')).data();
		console.log(data[4] + " : " + data[5]);
		mapsDisplay("map", '#mapmodal', data[4], data[5], data[1], data[1]);
		$('#mapLabel').html(data[1]);
		$('#mapAddress').html(data[2]);
		$('#mapDescription').html(data[3]);
		$('#mapmodal').modal('show');
	});
	$('#citiesTable').on('click', '.buttonRemove', function() {
		var data = table.row($(this).parents('tr')).data();
		console.log(data[4] + " : " + data[5]);
		if (confirm('Are you sure you want to remove?')) {
			var url = 'http://localhost:8080/places/' + data[0];
			$.ajax({
				url : url,
				type : 'DELETE',
				success : function(result) {
					alert("removed!");
					updatePlaces();
				}
			});
		}
	});
}
