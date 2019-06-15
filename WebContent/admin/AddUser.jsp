<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="inc/head.jsp" />
     <title>Gérer Voiture</title>
     <style type="text/css">
     .form-control { margin-bottom: 10px; }
     </style>
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
					<h3 class="page-header"><i class="fa fa-file-text-o"></i>Ajouter utilisateur</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="Home.jsp">Home</a></li>
						<li><i class="icon_document_alt"></i>Utilisateur</li>
						<li><i class="fa fa-file-text-o"></i>Ajouter utilisateur</li>
					</ol>
				</div>
			</div>
              <div class="row">
               <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                           Ajouter utilisateur
                          </header>
                          <div class="panel-body">
                             <form  method="post" class="form" role="form" action="Inscription" method="post">
            <div class="row">
                <div class="col-xs-6 col-md-6">
                    <input class="form-control" name="nom" placeholder="First Name" type="text"
                        required autofocus />
                </div>
                <div class="col-xs-6 col-md-6">
                    <input class="form-control" name="prenom" placeholder="Last Name" type="text" required />
                </div>
            </div>
            <input class="form-control" name="email" placeholder="Your Email" type="email" />
              <input type="text" class="form-control"  placeholder="Enter Adress" name="adress">
            <input type="text" class="form-control"  placeholder="Enter Tel" name="tel">
               
        <input type="hidden" name="action" value="signup">
             
        <input type="text" class="form-control" placeholder="Enter city"  name="ville">  
            <input class="form-control" name="p" placeholder=" Password" type="password" />
            <label for="">Pays </label>
   		   <div class="row">
   		   <div class="col-sm-12">
        <select class="form-control" id="pays" name="pays" name="pays">
         <jsp:include page="../includes/pays.jsp"></jsp:include>
    	  </select>
    		  </div>
     			   </div>   
     			   
     			         <label for="">Role </label>
   		   <div class="row">
   		   <div class="col-sm-12">
        <select class="form-control"  name="role" >
         <option value="user">User</option>
         <option value="Admin">Admin</option>
    	  </select>
    		  </div>
     			   </div>  
           
            <br />
            <br />
            <button class="btn btn-lg btn-primary btn-block" type="submit">
               Ajouter </button>
            </form>
                          </div>
                      </section>
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
