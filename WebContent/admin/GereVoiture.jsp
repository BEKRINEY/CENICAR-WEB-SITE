<%@ page import="java.io.*,java.util.*"%>
<%@page import="module.*,data_base.*"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<jsp:include page="inc/head.jsp" />
<title>Administration</title>
</head>

<body>


	<%
		Services s = new Services();
	%>


	<!-- container section start -->
	<section id="container" class=""> <jsp:include
		page="inc/header_sideBar.jsp" /> <!--main content start--> <section
		id="main-content"> <section class="wrapper"> <!--overview start-->
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i>Gere voiture
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
			<li><i class="icon_document_alt"></i>Voiture</li>
			<li><i class="fa fa-file-text-o"></i>Gere voiture</li>
		</ol>
	</div>





	<div class="row">
		<div class="col-lg-12">


			<%
				if (request.getParameter("status") != null
						&& request.getParameter("status").equals("1")) {
			%>
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Success!
				</strong> Vous avez Modifier un voiture avec sucess!
			</div>
			<%
				}
				if (request.getParameter("status") != null
						&& request.getParameter("status").equals("0")) {
			%>
			<div class="alert alert-danger alert-error">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Error!</strong>
				La marque selectioné n'est pas modifier.
			</div>

			<%
				}
				;
			%>


			<section class="panel"> <!--    <header class="panel-heading">
                              Advanced Table
                          </header>-->

			<table class="table table-striped table-advance table-hover">
				<tbody>
					<tr>
						<th><i class="**icon_profile"></i> immatricule</th>
						<th><i class="**icon_calendar"></i> model</th>
						<th><i class="**icon_mail_alt"></i> marque</th>
						<th><i class="**icon_pin_alt"></i> type</th>
						<th><i class="**icon_mobile"></i> nb_place</th>
						<th><i class="**icon_cogs"></i> prix_jour</th>
						<th><i class="**icon_"></i>Action</th>
					</tr>

					<%
						if (s.getAll("Voiture") != null) {
							Iterator<Voiture> i = s.getAll("Voiture").iterator();
							while (i.hasNext()) {
								Voiture v = i.next();
								request.setAttribute("v", v);
					%>

					<tr>
						<td>${v.immatricule}</td>
						<td>${v.model}</td>
						<td>${v.marque.marque}</td>
						<td>${v.type.type}</td>
						<td>${v.nb_place}</td>
						<td>${v.prix_jour}</td>
						<td>
							<div class="btn-group">
								<a class="btn btn-primary" href="#" data-toggle="modal"
									data-target="#myModal2_${v.id}"><i class="icon_pencil-edit"></i></a>
								<!--    <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a> -->
								<a class="btn btn-danger" href="#" data-toggle="modal"
									data-target="#myModal${v.id}" href="#"><i
									class="icon_close_alt2"></i></a>
							</div>
						</td>
					</tr>

					<!-- Modal 1-->
					<div class="modal fade" id="myModal${v.id}" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">

							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Supprission</h4>
								</div>
								<div class="modal-body">
									<p>Vous voulez vraiment supprimer le.</p>
									<form role="form" action="GereVoiture.jsp" method="post">
										<input type="submit" class="btn btn-default" value="OUI">
										<input type="hidden" value="${v.id}" name="id_supp">
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Fermer</button>
								</div>
							</div>
						</div>
					</div>
					<!-- fin modal 1 -->
					<!-- Modal 2-->
					<div class="modal fade" id="myModal2_${v.id}" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">

							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Modification</h4>
								</div>
								<div class="modal-body">
									<p>Entrer les nouveaus information.</p>
									<form role="form " action="../Voiture" method="post">

										<div class="form-group">
											<label for="immatricule">Immatricule</label> <input
												type="text" class="form-control" id="immatricule"
												value="${v.immatricule}" name="immatricule"
												placeholder="Entrer immatricule">
										</div>
										<div class="form-group">
											<label for="type">Type</label> <select class="form-control"
												id="type" name="idtype">
												<%
													if (s.getAll("Type") != null) {
																Iterator<Type> i2 = s.getAll("Type").iterator();
																while (i2.hasNext()) {
																	Type t = i2.next();
																	request.setAttribute("t", t);
												%>
												<option value="${t.id}"
													${t.id == v.type.id ? 'selected' : ''}>${t.type}</option>


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
																Iterator<Marque> i3 = s.getAll("Marque").iterator();
																while (i3.hasNext()) {
																	Marque m = i3.next();
																	request.setAttribute("m", m);
												%>
												<option value="${m.id}"
													${m.id == v.marque.id ? 'selected' : ''}>${m.marque}</option>
												<%
													}
															}
												%>
											</select>
										</div>
										<div class="form-group">
											<label for="model">Model</label> <input type="text"
												value="${v.model}" class="form-control" name="model"
												placeholder="Entrer model">
										</div>
										<div class="form-group">
											<label for="model">Prix par jour (DH)</label> <input
												type="number" class="form-control" value="${v.prix_jour}"
												name="prix_jour" placeholder="Entrer prix">
										</div>
										<div class="form-group">
											<label for="nb_place">Nombre de place</label> <input
												type="number" class="form-control" value="${v.nb_place}"
												name="nb_place" placeholder="Entrer nb place">
										</div>
										<div class="form-group">
											<label for="exampleInputFile">Image</label> <input type="url"
												class="form-control" name="img" value="${v.img}"
												placeholder="Image URL">
											<p class="help-block">Image au moin 250px (jpg,png).</p>
										</div>



										<input type="hidden" value="mod_voiture" name="action">
										<input type="hidden" value="${v.id}" name="id_voiture">
										<button type="submit" class="btn btn-primary">Submit</button>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Fermer</button>
								</div>
							</div>
						</div>
					</div>
					<!-- fin modal 2-->

					<%
						}
						}
					%>
				</tbody>
			</table>
			</section>
		</div>
	</div>
	</section> </section> <!--main content end--> </section>
	<!-- container section start -->

	<!-- javascripts -->
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
	<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<!-- bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- nice scroll -->
	<script src="js/jquery.scrollTo.min.js" type="text/javascript"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<!-- charts scripts -->
	<script src="assets/jquery-knob/js/jquery.knob.js"
		type="text/javascript"></script>
	<script src="js/jquery.sparkline.js" type="text/javascript"></script>
	<script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"
		type="text/javascript"></script>
	<script src="js/owl.carousel.js" type="text/javascript"></script>
	<!-- jQuery full calendar -->
	<
	<script src="js/fullcalendar.min.js" type="text/javascript"></script>
	<!-- Full Google Calendar - Calendar -->
	<script src="assets/fullcalendar/fullcalendar/fullcalendar.js"
		type="text/javascript"></script>
	<!--script for this page only-->
	<script src="js/calendar-custom.js" type="text/javascript"></script>
	<script src="js/jquery.rateit.min.js" type="text/javascript"></script>
	<!-- custom select -->
	<script src="js/jquery.customSelect.min.js" type="text/javascript"></script>
	<script src="assets/chart-master/Chart.js" type="text/javascript"></script>

	<!--custome script for all page-->
	<script src="js/scripts.js" type="text/javascript"></script>
	<!-- custom script for this page-->
	<script src="js/sparkline-chart.js" type="text/javascript"></script>
	<script src="js/easy-pie-chart.js" type="text/javascript"></script>
	<script src="js/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
	<script src="js/jquery-jvectormap-world-mill-en.js"
		type="text/javascript"></script>
	<script src="js/xcharts.min.js" type="text/javascript"></script>
	<script src="js/jquery.autosize.min.js" type="text/javascript"></script>
	<script src="js/jquery.placeholder.min.js" type="text/javascript"></script>
	<script src="js/gdp-data.js" type="text/javascript"></script>
	<script src="js/morris.min.js" type="text/javascript"></script>
	<script src="js/sparklines.js" type="text/javascript"></script>
	<script src="js/charts.js" type="text/javascript"></script>
	<script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>

</body>
</html>
