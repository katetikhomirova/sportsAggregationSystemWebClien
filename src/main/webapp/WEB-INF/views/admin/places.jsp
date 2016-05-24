<!DOCTYPE html>
<html>
<%@ include file="../fragment/head.jsp"%>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false&language=en">
	
</script>
</head>
<body class="hold-transition skin-green sidebar-mini">
	<div class="wrapper">

		<%@ include file="../fragment/menu.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Places<small>all places where competitions can be</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="profile"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="places">Places</a></li>
					<li class="active">Places</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">

					<!-- Show Modal -->
					<div class="modal fade" id="mapmodal" tabindex="-1" role="dialog"
						aria-labelledby="mapLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="mapLabel"></h4>
								</div>
								<div class="modal-body">
									<h4 id="mapAddress"></h4>
									<h5 id="mapDescription"></h5>
									<div id="map" style="width: 550px; height: 300px"></div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>

					<!--Add place Modal -->
					<div class="modal fade" id="addPlaceMapModal" tabindex="-1"
						role="dialog" aria-labelledby="modal-title">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title">Add new place</h4>
								</div>
								<div class="modal-body">
									<h5 id="mapDescription"></h5>
									<!-- PLACE FORM -->
									<form id="placesForm" method="post"
										action="http://localhost:8080/places">
										<div class="form-group has-feedback">
											<input type="text" class="form-control"
												placeholder="Place title" id="nameInput" name="name">
										</div>
										<div class="form-group has-feedback">
											<textarea class="form-control" rows="2"
												placeholder="Place description" id="descriptionInput"
												name="description"></textarea>
										</div>

										<input type="hidden" name="lat" id="latInput" /> <input
											type="hidden" name="lng" id="lngInput" /><input
											type="hidden" name="address" id="addresForm" />
									</form>
									<!-- /PLACE FORM -->
									<!-- SEARCH LOCATION ADDRESS -->
									<div class="form-group">
										<label>Search location</label>
										<div class="input-group">
											<input type="text" class="form-control" name="name"
												placeholder="Location" id="searchLocation">
											<div class="input-group-btn">
												<button type="button" class="btn btn-primary"
													id="searchLocationButton">Search</button>
											</div>
										</div>
									</div>
									<!-- /SEARCH LOCATION ADDRESS -->
									<h4 id="addPlaceAddress">Adress is empty</h4>
									<div id="addPlaceMap" style="width: 550px; height: 300px"></div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="save">Add
										place</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<!-- /.box-header -->
							<div class="box-body">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-success"
									data-toggle="modal" data-target="#addPlaceMapModal"
									id="addNewPlaceButton">Add new place</button>
								<hr />
								<table id="citiesTable"
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
	<script src="resources/commonScripts/places.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#places').addClass('active');
			$('#placesTree').addClass('active');
		});
	</script>
	<!-- page script -->
</body>
</html>
