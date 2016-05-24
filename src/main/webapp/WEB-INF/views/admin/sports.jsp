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
					Sports<small>all sport with categories</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="profile"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="sports">Sports</a></li>
					<li class="active">Sports</li>
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
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<!-- /.box-header -->
							<div class="box-body">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-success"
									data-toggle="modal" data-target="#addSport" id="addSportButton">Add
									sport</button>
								<hr />
								<table id="sportsTable"
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
	<script src="resources/commonScripts/addNewSport.js"></script>
	<script src="resources/commonScripts/sportsTable.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#sports').addClass('active');
			$('#sportsTree').addClass('active');
		});
	</script>
	<!-- page script -->
</body>
</html>
