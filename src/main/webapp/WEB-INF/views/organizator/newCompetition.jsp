<!DOCTYPE html>
<html>
<%@ include file="../fragment/head.jsp"%>
<link rel="stylesheet"
	href="resources/plugins/daterangepicker/daterangepicker-bs3.css">
<script
	src="https://maps.googleapis.com/maps/api/js?sensor=false&language=en">
	
</script>
</head>
<body class="hold-transition skin-green sidebar-mini">
	<div class="wrapper">

		<%@ include file="../fragment/organizator_menu.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Competition<small>create new competition</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="profile"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="sports">Competitions</a></li>
					<li class="active">New competition</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">

					<!-- Modal -->
					<div class="modal fade" id="addSport" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Add new sport</h4>
								</div>
								<div class="modal-body">
									<form id="addNewSport" method="post"
										action="http://localhost:8080/sports">
										<div class="form-group has-feedback">
											<input type="text" class="form-control"
												placeholder="Sport name" id="name" name="name">
										</div>
										<div class="checkbox">
											<label> <input type="checkbox" name="command"
												id="command"> Command
											</label>
										</div>
										<div class="form-group">
											<label>Select sport category</label> <select
												class="form-control" name="categoryName" id="categoryName">
											</select>
										</div>
									</form>
									<form id="addNewSportCategory" method="post"
										action="http://localhost:8080/sports">
										<div class="form-group">
											<label>or create new one</label>
											<div class="input-group">
												<input type="text" class="form-control" name="name"
													placeholder="Sport category name" id="sportCategoryName">
												<div class="input-group-btn">
													<button type="button" class="btn btn-primary"
														id="addCategory">Add category</button>
												</div>
												<!-- /btn-group -->
											</div>
										</div>
									</form>
									<div class="row">
										<!-- /.col -->
									</div>

								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-success" id="save">Add
										sport</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="addSportFromTable" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Add sport from
										table</h4>
								</div>
								<div class="modal-body">
									<table id="sportsTable"
										class="table table-bordered table-striped">
									</table>
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
								<form>
									<div class="form-group has-feedback">
										<label for="competitionTitle">Title</label> <input type="text"
											class="form-control" placeholder="Competition title"
											id="competitionTitle" name="competitionTitle">
									</div>

									<div class="form-group">
										<label>Description</label>
										<textarea class="form-control" rows="3"
											placeholder="Enter ..."></textarea>
									</div>
									<div class="form-group">
										<label>Date and time range:</label>

										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-clock-o"></i>
											</div>
											<input type="text" class="form-control pull-right"
												id="reservationtime">
										</div>
										<!-- /.input group -->
									</div>
									<div class="checkbox">
										<label> <input type="checkbox" name="competitionOpen">
											Open for registration
										</label>
									</div>
									<div class="form-group">
										<label>Status</label> <select class="form-control"
											name="competitionStatus">
											<option value="1">The highest level (world and
												continental scale competitions)</option>
											<option value="2">Level 1 (competitions carried by
												country sports federation)</option>
											<option value="3">Level 2 (competitions carried by
												state sports federations)</option>
											<option value="4">Level 3 (competitions carried by
												city or area sports federations)</option>
										</select>
									</div>

									<div class="form-group">
										<label>Place</label>
										<h4 id="placeAddress"></h4>
										<input type="hidden" id="placeId" />
									</div>
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#addSportFromTable"
										id="addSportButton">Select place</button>
									<!-- /Modal -->
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-success"
										data-toggle="modal" data-target="#addPlaceMapModal"
										id="addPlaceButton">Create new place</button>
									<hr />
									<div class="form-group">
										<label>Sport list</label>
										<div class="form-group">
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#addSportFromTable"
												id="addSportButton">Add sport</button>
											<!-- /Modal -->
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-success"
												data-toggle="modal" data-target="#addSport"
												id="addSportButton">Create new sport</button>
										</div>

										<h4>
											<ol id="sportsList">
											</ol>
										</h4>
									</div>
									<div id="hiddenSportsId"></div>
									<div class="box-footer">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form>

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
	<script src="resources/commonScripts/addNewSport.js"></script>
	<script src="resources/commonScripts/sportsTableAdd.js"></script>
	<script src="resources/commonScripts/placesSelect.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="resources/plugins/daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#competitionTree').addClass('active');
			$('#newCompetition').addClass('active');
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
				timePicker : true,
				timePickerIncrement : 30,
				format : 'MM/DD/YYYY h:mm A'
			});
		});
	</script>
	<!-- page script -->
</body>
</html>
