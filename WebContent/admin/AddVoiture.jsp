<%@ page import="java.io.*,java.util.*"%>
<%@page import="module.*,data_base.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="inc/head.jsp" />
<title>Gérer Voiture</title>
</head>

<body>


	<!-- container section start -->
	<section id="container" class="">

		<jsp:include page="inc/header_sideBar.jsp" />

		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-file-text-o"></i> Form elements
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
							<li><i class="icon_document_alt"></i>Forms</li>
							<li><i class="fa fa-file-text-o"></i>Form elements</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<%
							if (request.getParameter("status") != null
									&& request.getParameter("status").equals("1")) {
						%>
						<div class="alert alert-success">
							<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Success!
							</strong> Vous avez ajout un voiture avec sucess!
						</div>
						<%
							}
						%>
						<section class="panel">
							<header class="panel-heading"> Ajouter Voiture </header>
							<div class="panel-body">
								<form role="form " action="../Voiture" method="post">

									<div class="form-group">
										<label for="immatricule">Immatricule</label> <input
											type="text" class="form-control" id="immatricule"
											name="immatricule" placeholder="Entrer immatricule">
									</div>
									<div class="form-group">
										<label for="type">Type</label> <select class="form-control"
											id="type" name="idtype">
											<%
												Services s = new Services();
												if (s.getAll("Type") != null) {
													Iterator<Type> i = s.getAll("Type").iterator();
													while (i.hasNext()) {
														Type t = i.next();
														request.setAttribute("t", t);
											%>
											<option value="${t.id}">${t.type}</option>
											<%
												}
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label for="type">Marque</label> <select class="form-control"
											id="type" name="idmarque">
											<%
												if (s.getAll("Marque") != null) {
													Iterator<Marque> i = s.getAll("Marque").iterator();
													while (i.hasNext()) {
														Marque m = i.next();
														request.setAttribute("m", m);
											%>
											<option value="${m.id}">${m.marque}</option>
											<%
												}
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label for="model">Model</label> <input type="text"
											class="form-control" id="model" name="model"
											placeholder="Entrer model">
									</div>
									<div class="form-group">
										<label for="model">Prix par jour (DH)</label> <input
											type="number" class="form-control" id="model"
											name="prix_jour" placeholder="Entrer prix">
									</div>
									<div class="form-group">
										<label for="nb_place">Nombre de place</label> <input
											type="number" class="form-control" id="nb_place"
											name="nb_place" placeholder="Entrer nb place">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">Image</label> <input type="url"
											class="form-control" id="exampleInputFile" name="img"
											placeholder="Image URL">
										<p class="help-block">Image au moin 250px (jpg,png).</p>
									</div>
									<input type="hidden" value="add" name="action">

									<button type="submit" class="btn btn-primary">Submit</button>
								</form>

							</div>
						</section>
					</div>
				</div>




			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- container section start -->



	<!-- javascripts -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui-1.10.4.min.js"></script>
	<script src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<!-- bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- nice scroll -->
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<!-- charts scripts -->
	<script src="assets/jquery-knob/js/jquery.knob.js"></script>
	<script src="js/jquery.sparkline.js" type="text/javascript"></script>
	<script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
	<script src="js/owl.carousel.js"></script>
	<!-- jQuery full calendar -->
	<
	<script src="js/fullcalendar.min.js"></script>
	<!-- Full Google Calendar - Calendar -->
	<script src="assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
	<!--script for this page only-->
	<script src="js/calendar-custom.js"></script>
	<script src="js/jquery.rateit.min.js"></script>
	<!-- custom select -->
	<script src="js/jquery.customSelect.min.js"></script>
	<script src="assets/chart-master/Chart.js"></script>

	<!--custome script for all page-->
	<script src="js/scripts.js"></script>
	<!-- custom script for this page-->
	<script src="js/sparkline-chart.js"></script>
	<script src="js/easy-pie-chart.js"></script>
	<script src="js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="js/xcharts.min.js"></script>
	<script src="js/jquery.autosize.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/gdp-data.js"></script>
	<script src="js/morris.min.js"></script>
	<script src="js/sparklines.js"></script>
	<script src="js/charts.js"></script>
	<script src="js/jquery.slimscroll.min.js"></script>
	
</body>
</html>
