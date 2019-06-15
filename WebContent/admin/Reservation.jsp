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
			<i class="fa fa-file-text-o"></i>Gere utilisateur
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
			<li><i class="icon_document_alt"></i>Réservations</li>
			<li><i class="fa fa-file-text-o"></i>Réservation validé</li>
		</ol>
	</div>


	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <!--    <header class="panel-heading">
                              Advanced Table
                          </header>-->

			<table class="table table-striped table-advance table-hover">
				<tbody>
					<tr>
						<th><i class="**icon_profile"></i>Date debut</th>
						<th><i class="**icon_profile"></i>Date retour</th>
						<th><i class="**icon_calendar"></i> Prix</th>
						<th><i class="**icon_mail_alt"></i>Payement methode</th>
						<th><i class="**icon_mobile"></i> Client</th>
						<th><i class="**icon_mobile"></i> Voiture</th>
					</tr>
					<%
						Iterator<Location> i;
						if (request.getParameter("t") != null
								&& request.getParameter("t").equals("0")) {
							i = s.getAllWhere("Location", "payement.status=false")
									.iterator();
						} else {
							i = s.getAllWhere("Location", "payement.status=true")
									.iterator();
						}

						while (i.hasNext()) {
							Location l = i.next();
							request.setAttribute("l", l);
					%>
					<tr>
						<td>${l.date_debut}</td>
						<td>${l.date_retour}</td>
						<td>${l.prix}MAD</td>
						<td>${l.payement.mod_pay}</td>
						<td>${l.utilisateur.nom}${l.utilisateur.prenom}</td>
						<td>${l.voiture.marque.marque}${l.voiture.model}</td>
						<%
							if (request.getParameter("t") != null
										&& request.getParameter("t").equals("0")) {
						%>

						<%
							}
						%>

					</tr>


					<%
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
	<script>
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
