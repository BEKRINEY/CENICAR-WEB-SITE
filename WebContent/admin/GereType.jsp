<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="module.*,data_base.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="inc/head.jsp" />
<title>Gérer Voiture</title>
</head>

<body>

	<%
		Services s = new Services();
	%>

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
									&& request.getParameter("status").equals("f1PkJn84L")) {
						%>
						<div class="alert alert-success">
							<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Success!
							</strong> Vous avez ajout une Type avec sucess!
						</div>
						<%
							}
							if (request.getParameter("id_supp") != null) {
								if (s.delete(Long.valueOf(request.getParameter("id_supp")),Type.class)) {
						%>
						<div class="alert alert-success">
							<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Success!
							</strong> Vous avez Supprimer une Type avec sucess!
						</div>
						<%
							} else {
						%>

						<div class="alert alert-danger alert-error">
							<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Error!</strong>
							La type selectioné n'est pas supprimer.
						</div>

						<%
							}}
								if (request.getParameter("id_mod") != null
										&& request.getParameter("type") != null) {
									Type l1 = new Type(String.valueOf(request
											.getParameter("type")));
									l1.setId(Long.valueOf(request.getParameter("id_mod")));
									if (s.update(l1)) {
						%>

						<div class="alert alert-success">
							<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Success!
							</strong> Vous avez Modifier une type avec sucess!
						</div>

						<%
							} else {
						%>

						<div class="alert alert-danger alert-error">
							<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Error!</strong>
							La type selectioné n'est pas modifier.
						</div>

						<%
							}
								}
							
						%>

						<section class="panel">
							<header class="panel-heading"> Ajouter Type </header>
							<div class="panel-body">
								<form role="form " action="../Voiture" method="post">
									<div class="form-group">
										<label for="exampleInputEmail1">Type</label> <input
											type="text" class="form-control" name="type"
											placeholder="Enter type">
									</div>

									<input type="hidden" value="add_Type" name="action">

									<button type="submit" class="btn btn-primary">Submit</button>
								</form>

							</div>
						</section>
					</div>
				</div>




				<div class="row">
					<div class="col-lg-8">
						<section class="panel">
							<!--    <header class="panel-heading">
                              Advanced Table
                          </header>-->

							<table class="table table-striped table-advance table-hover">
								<tbody>
									<tr>
										<th><i class=""></i>#</th>
										<th><i class=""></i>Type</th>
										<th><i class=""></i> Action</th>
									</tr>
									<%
										if (s.getAll("Type") != null) {
											Iterator<Type> i = s.getAll("Type").iterator();
											while (i.hasNext()) {
												Type t = i.next();
												request.setAttribute("t", t);
									%>

									<!-- Modal 1-->
									<div class="modal fade" id="myModal${t.id}" role="dialog"
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
													<form role="form" action="GereType.jsp" method="post">
														<input type="submit" class="btn btn-default" value="OUI">
														<input type="hidden" value="${t.id}" name="id_supp">
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
									<div class="modal fade" id="myModal2_${t.id}" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">

											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">&times;</button>
													<h4 class="modal-title" id="myModalLabel">Modification</h4>
												</div>
												<div class="modal-body">
													<p>Entrer le nouveau nom de type.</p>
													<form role="form" action="GereType.jsp" method="post">

														<label class="control-label col-sm-2" for="nom">Type
															:</label> <input type="text" class="form-control" id="nom"
															placeholder="Enter name" name="type" value="${t.type}"
															required> <input type="hidden" name="id_mod"
															value="${t.id}">
														<button type="submit" class="btn btn-default">Valider</button>
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

									<tr>
										<td>${t.id}</td>
										<td>${t.type}</td>
										<td>
											<div class="btn-group">
												<a class="btn btn-primary" href="#" data-toggle="modal"
													data-target="#myModal2_${t.id}"><i
													class="icon_pencil-edit"></i></a>
												<!--    <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a> -->
												<a class="btn btn-danger" href="#" data-toggle="modal"
													data-target="#myModal${t.id}" href="#"><i
													class="icon_close_alt2"></i></a>
											</div>
										</td>
									</tr>


									<%
										}
										}
									%>
								</tbody>
							</table>
						</section>
					</div>
				</div>



			</section>
		</section>
		<!--main content end-->
	</section>
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
	<script type="text/javascript">
		//knob
		$(function() {
			$(".knob").knob({
				'draw' : function() {
					$(this.i).val(this.cv + '%')
				}
			})
		});

		//carousel
		$(document).ready(function() {
			$("#owl-slider").owlCarousel({
				navigation : true,
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true

			});
		});

		//custom select box

		$(function() {
			$('select.styled').customSelect();
		});

		/* ---------- Map ---------- */
		$(function() {
			$('#map').vectorMap({
				map : 'world_mill_en',
				series : {
					regions : [ {
						values : gdpData,
						scale : [ '#000', '#000' ],
						normalizeFunction : 'polynomial'
					} ]
				},
				backgroundColor : '#eef3f7',
				onLabelShow : function(e, el, code) {
					el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
				}
			});
		});
	</script>

</body>
</html>
