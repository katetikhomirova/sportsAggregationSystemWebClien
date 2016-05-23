<!DOCTYPE html>
<html>
<%@ include file="../fragment/head.jsp"%>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false">
	
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
					Cities<small>all cities with countries</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="profile"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="places">Places</a></li>
					<li class="countries">Cities</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">

					<!-- Modal -->
					<div class="modal fade" id="mapmodal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="mapLabel">Add new sport
										category</h4>
								</div>
								<div class="modal-body">
									<div id="map" style="width: 550px; height: 300px"></div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
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
	<script src="resources/commonScripts/citiesTable.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#cities').addClass('active');
			$('#placesTree').addClass('active');
		});
	</script>
	<!-- page script -->
</body>
</html>
