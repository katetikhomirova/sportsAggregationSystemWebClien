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
					Profile<small>edit your profile</small>
				</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<!-- /.box-header -->
							<div class="box-body">

								<form id="loginForm" method="post"
									action="http://localhost:8080/users/signin">
									<div class="form-group has-feedback">
										<label for="firstName">First name</label> <input type="text"
											class="form-control" placeholder="First Name" id="firstName"
											name="firstName" value="Kate">
									</div>
									<div class="form-group has-feedback">
										<label for="lastName">Last name</label> <input type="text"
											class="form-control" placeholder="Last Name" id="lastName"
											name="lastName" value="Tikhomirova">
									</div>

									<div class="form-group">
										<label>Date:</label>

										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right"
												id="datepicker">
										</div>
										<!-- /.input group -->
									</div>
									<div class="form-group has-feedback">
										<label for="password">Password</label> <input type="password"
											class="form-control" placeholder="Password" id="password"
											name="password">
									</div>
									<div class="form-group has-feedback">
										<label for="repeatPassword">Repeat password</label> <input
											type="password" class="form-control" placeholder="Password"
											id="password" name="repeatPassword">
									</div>
									<div class="form-group">
										<label>Gender:</label>
										<div class="radio">
											<label> <input type="radio" name="optionsRadios"
												id="optionsRadios1" value="option1" checked>Male
											</label>
										</div>
										<div class="radio">
											<label> <input type="radio" name="optionsRadios"
												id="optionsRadios2" value="option2"> Female
											</label>
										</div>
									</div>
									<label>Sports:</label>
									<div class="row">
										<div class="col-xs-3">
											<select class="form-control">
												<option>basketball</option>
												<option>2</option>
											</select>
										</div>
										<div class="col-xs-3">
											<a class="btn btn-success">Add</a>
										</div>
									</div>
									<div class="form-group">
										<ul>
											<li>beach volleyball <a>Remove</a></li>
											<li>volleyball <a>Remove</a></li>
										</ul>
									</div>
									<div class="row">
										<!-- /.col -->
										<div class="col-xs-12">
											<button type="submit"
												class="btn btn-primary btn-block btn-flat">Save</button>
										</div>
										<!-- /.col -->
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
	<script src="resources/plugins/datepicker/bootstrap-datepicker.js"></script>
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
