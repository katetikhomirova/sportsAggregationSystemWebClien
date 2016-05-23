<!DOCTYPE html>
<html>
<%@ include file="../fragment/head.jsp"%>
</head>
<body class="hold-transition skin-green sidebar-mini">
	<div class="wrapper">

		<%@ include file="../fragment/menu.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Countries<small> all over the world</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="profile"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="places"> Places</a></li>
					<li class="countries">Countries</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row"></div>
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="countriesTable"
									class="table table-bordered table-striped">
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="../fragment/controlSidebar.jsp"%>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.0 -->
	<script src="resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script src="resources/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="resources/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="resources/dist/js/demo.js"></script>
	<script src="resources/plugins/jqueryForm/jquery.form.js"></script>
	<script src="resources/commonScripts/countriesTable.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#placesTree').addClass('active');
			$('#countries').addClass('active');
		});
	</script>
	<script>
		function displayLocation(latitude, longitude) {
			var request = new XMLHttpRequest();

			var method = 'GET';
			var url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng='
					+ latitude + ',' + longitude + '&sensor=true&language=en';
			var async = true;

			request.open(method, url, async);
			request.onreadystatechange = function() {
				if (request.readyState == 4 && request.status == 200) {
					var data = JSON.parse(request.responseText);
					var address = data.results[0];
					for ( var i in address.address_components) {
						if (address.address_components[i].types[0] == "locality") {
							console.log("town:"
									+ address.address_components[i].long_name);
							//itemLocality = address_component.long_name;
						}

						if (address.address_components[i].types[0] == "country") {
							console.log("country:"
									+ address.address_components[i].long_name);
							//itemCountry = address_component.long_name;
						}
					}
					//document.write(address.formatted_address);
				}
			};
			request.send();
		};

		displayLocation('50.448721', '30.523856');
	</script>
	<!-- page script -->
</body>
</html>
