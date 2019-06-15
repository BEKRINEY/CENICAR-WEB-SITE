<%@ page import="java.io.*,java.util.*" %>
<%@page import="module.*,data_base.*" %>
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
  <section id="container" class="">
     
       <jsp:include page="inc/header_sideBar.jsp" />
     
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">            
              <!--overview start-->
			<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-file-text-o"></i>Gere utilisateur</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="icon_document_alt"></i>Utilisateur</li>
						<li><i class="fa fa-file-text-o"></i>Gere utilisateur</li>
					</ol>
				</div>
     
				
  <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                       <!--    <header class="panel-heading">
                              Advanced Table
                          </header>--> 
                         
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="**icon_profile"></i> Nom</th>
                                   <th><i class="**icon_profile"></i> Prenom</th>
                                 <th><i class="**icon_calendar"></i> Email</th>
                                 <th><i class="**icon_mail_alt"></i> Pays</th>
                                 <th><i class="**icon_pin_alt"></i> Tel</th>
                                 <th><i class="**icon_mobile"></i> Ville</th>
                                 <th><i class="**icon_mobile"></i> Action</th>
                              </tr>
                              		<%
										if (s.getAllWhere("Utilisateur","role='user'") != null) {
											Iterator<Utilisateur> i =s.getAllWhere("Utilisateur","role='user'").iterator();
											while (i.hasNext()) {
												Utilisateur u = i.next();
												request.setAttribute("u", u);
									%>
                              <tr>
                                 <td>${u.nom}</td>
                                 <td>${u.prenom}</td>
                                 <td>2${u.email}</td>
                                 <td>${u.pays}</td>
                                 <td>${u.tel}</td>
                                 <td>${u.ville}</td>
                                 <td>
                                  <div class="btn-group">
                                      <a data-toggle="modal" data-target="#myModal2_${u.id}" class="btn btn-primary" href="#"><i class="icon_pencil-edit"></i></a>
                                  <!--    <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a> -->
                                      <a data-toggle="modal" data-target="#myModal${u.id}"class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                  </div>
                                  </td>
                              </tr>
                              <!-- Modal 1-->
									<div class="modal fade" id="myModal${u.id}" role="dialog"
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
														<input type="hidden" value="${u.id}" name="id_supp">
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
									<div class="modal fade" id="myModal2_${u.id}" role="dialog"
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

														<label class="control-label col-sm-2" for="nom">Nom
															:</label> <input type="text" class="form-control" id="nom"
															placeholder="Enter name" name="type" value="${u.nom}"
															required> 
															
															<label class="control-label col-sm-2" for="prenom">Prenom
															:</label> <input type="text" class="form-control" id="prenom"
															placeholder="Enter prenom" name="prenom" value="${u.prenom}"
															required> 
															
															<label class="control-label col-sm-2" for="email">Email
															:</label> <input type="text" class="form-control" id="email"
															placeholder="Enter email" name="email" value="${u.email}"
															required>
															 <input type="hidden" name="id_mod"
															value="${u.id}">
															
															<label class="control-label col-sm-2" for="pays">Pays
															:</label> <input type="text" class="form-control" id="email"
															placeholder="Enter pays" name="pays" value="${u.pays}"
															required>
															
																<label class="control-label col-sm-2" for="tel">Tel
															:</label> <input type="text" class="form-control" id="tel"
															placeholder="Enter tel" name="tal" value="${u.tel}"
															required>
															
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
                              
                              <%}} %>
                                                       
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
    <script src="js/owl.carousel.js" ></script>
    <!-- jQuery full calendar -->
    <<script src="js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
	<script src="assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
    <!--script for this page only-->
    <script src="js/calendar-custom.js"></script>
	<script src="js/jquery.rateit.min.js"></script>
    <!-- custom select -->
    <script src="js/jquery.customSelect.min.js" ></script>
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
          'draw' : function () { 
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

      $(function(){
          $('select.styled').customSelect();
      });
	  
	  /* ---------- Map ---------- */
	$(function(){
	  $('#map').vectorMap({
	    map: 'world_mill_en',
	    series: {
	      regions: [{
	        values: gdpData,
	        scale: ['#000', '#000'],
	        normalizeFunction: 'polynomial'
	      }]
	    },
		backgroundColor: '#eef3f7',
	    onLabelShow: function(e, el, code){
	      el.html(el.html()+' (GDP - '+gdpData[code]+')');
	    }
	  });
	});



  </script>

  </body>
</html>
