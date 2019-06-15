  <%@ page import="java.io.*,java.util.*"%>
<%@page import="module.*,data_base.*"%>
  
<header class="header dark-bg">
	<div class="toggle-nav">
		<div class="icon-reorder tooltips"
			data-original-title="Toggle Navigation" data-placement="bottom"></div>
	</div>

	<!--logo start-->
	<a href="Home.jsp" class="logo">CINE <span class="lite">CAR</span></a>
	<!-- <a class="navbar-brand" href="Home.jsp">
                    <img src="../assets/img/logo.png" class="navbar-brand-logo " alt="" width="100" height="30" />
                </a>-->
	<!--logo end-->

	<div class="nav search-row" id="top_menu"></div>
	<div class="top-nav notification-row">
		<!-- notificatoin dropdown start-->
		<ul class="nav pull-right top-menu">


			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <!--      <span class="profile-ava">
                                <img alt="" src="img/avatar1_small.jpg">
                            </span> --> <span class="username"> <%
 	if (session.getAttribute("u") != null ) {
 		Utilisateur u = (Utilisateur)session.getAttribute("u"); 
 		if(u.getRole().equals("admin")){
 		out.print(u.getEmail()); 
 		}else{
 			response.sendRedirect("index.jsp");
 		}
 		
 	} else {
 		response.sendRedirect("index.jsp");
 	}
 %>
				</span> <b class="caret"></b>
			</a>
				<ul class="dropdown-menu extended logout">
					<div class="log-arrow-up"></div>
					<li class="eborder-top"><a href="#" data-toggle="modal"
						data-target="#myModal"><i class="icon_profile"></i>Change
							password</a></li>

					<li><a href="../user.do?action=2"><i class="icon_key_alt"></i>
							Log Out</a></li>
					<!--  <li>
                                <a href="documentation.html"><i class="icon_key_alt"></i> Documentation</a>
                            </li>
                            <li>
                                <a href="documentation.html"><i class="icon_key_alt"></i> Documentation</a>
                            </li> -->
				</ul></li>
			<!-- user login dropdown end -->
		</ul>
		<!-- notificatoin dropdown end-->
	</div>
</header>
<!--header end-->

<!-- Modal content-->
<div class="modal fade" id="myModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">

		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Changer password</h4>
			</div>
			<div class="modal-body">
				<p>Remplir les champes .</p>
				<form role="form" action="user.do" method="post">
					<div class="form-group">
						<label for="email">New password:</label> <input type="password"
							class="form-control" name="new_pwd"
							onchange="form.re_pwd.pattern = this.value;" required>
					</div>
					<div class="form-group">
						<label for="pwd">Repeat password:</label> <input type="password"
							class="form-control" name="re_pwd"
							title="SVP entrer le meme password ." required>
					</div>
					<input type="hidden" name="action" value="change_pwd" />
					<button type="submit" class="btn btn-default">Submit</button>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!--  fin modal -->



<!--sidebar start-->
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu">
			<li class="active"><a class="" href="Home.jsp"> <i
					class="icon_house_alt"></i> <span>Dashboard</span>
			</a></li>
			<li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_document_alt"></i> <span>Voiture</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
				<ul class="sub">
					<li><a class="" href="AddVoiture.jsp">Ajouter Voiture</a></li>
					<li><a class="" href="GereVoiture.jsp">Supp/Modif Voiture</a></li>
					<li><a class="" href="GereType.jsp">Gerer Types</a></li>
					<li><a class="" href="GereMarque.jsp">Gerer Marque</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_desktop"></i> <span>Utilisateur</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
				<ul class="sub">
					<li><a class="" href="AddUser.jsp">Ajouter Utilisateur</a></li>
					<li><a class="" href="GereUser.jsp">Supp/Modif Voiture</a></li>
				</ul></li>


			<li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_table"></i> <span>Offer</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
				<ul class="sub">
					<li><a class="" href="AddOffer.jsp">Ajouter Offer</a></li>
					<li><a class="" href="GereOffer.jsp">Supp/Modif Offer</a></li>
				</ul></li>

			<li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_documents_alt"></i> <span>Réservations</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
				<ul class="sub">
					
					<li><a class="" href="Reservation.jsp?t=0">Réservations
							non validé </a></li>
					<li><a class="" href="Reservation.jsp">Réservations
							validé</a></li>
				</ul></li>

		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
<!--sidebar end-->