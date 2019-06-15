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
		if (session.getAttribute("u") == null) {
			response.sendRedirect("../index.jsp");
		}
	%>

	<!-- container section start -->
	<section id="container" class=""> <jsp:include
		page="inc/header_sideBar.jsp" /> <!--main content start--> <section
		id="main-content"> <section class="wrapper"> <!--overview start-->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-laptop"></i> Dashboard
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="Home.jsp">Home</a></li>
				<li><i class="fa fa-laptop"></i>Dashboard</li>
			</ol>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
			<div class="info-box blue-bg">
				<i class="fa fa-truck"></i>
				<div class="count">6.674</div>
				<div class="title">Voiture</div>
			</div>
			<!--/.info-box-->
		</div>
		<!--/.col-->

		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
			<div class="info-box brown-bg">
				<i class="fa fa-shopping-cart"></i>
				<div class="count">7.538</div>
				<div class="title">Commande</div>
			</div>
			<!--/.info-box-->
		</div>
		<!--/.col-->

		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
			<div class="info-box dark-bg">
				<i class="fa fa-user"></i>
				<div class="count">4.362</div>
				<div class="title">Utilisateur</div>
			</div>
			<!--/.info-box-->
		</div>
		<!--/.col-->

		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
			<div class="info-box green-bg">
				<i class="fa  fa-star-o"></i>
				<div class="count">1.426</div>
				<div class="title">Offres</div>
			</div>
			<!--/.info-box-->
		</div>
		<!--/.col-->

	</div>
	<!--/.row--> </section> </section> <!--main content end--> </section>
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
