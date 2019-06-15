  <%@ page import="java.io.*,java.util.*"%>
<%@page import="module.*,data_base.*"%>
  
  <div class="navbar navbar-default navbar-fixed-top move-me ">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" href="index.jsp">
                    <img src="assets/img/logo.png" class="navbar-brand-logo " alt="" />
                </a>
            </div>
            <div class="navbar-collapse collapse move-me">
                <ul class="nav navbar-nav navbar-left">

                <li ><a href="index.jsp">Accueille</a></li>
                    <li >
                        <a href="SpecialOffers">Offres spécials</a>
                    </li>

                    <li >
                       <a href="gallery.jsp">Voitures à louer  </a>
                    </li>

                    <li > <a href="about.jsp">Conditions de location </a> </li>
                    <li > <a href="contact.jsp">Contactez-nous</a></li>
                    
                    <%
                    if(session.getAttribute("u") == null){
                    %>
                </ul>
                    <ul class="nav navbar-nav navbar-right">
                  <li><a href="#" data-toggle="modal" data-target="#myModal2"><span class="glyphicon glyphicon-user" ></span> Sign Up</a></li>
                  <li><a href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                  </ul>
                 <%  }
                    else {%>  
                    
                    <li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> 
				<% Utilisateur u = (Utilisateur)session.getAttribute("u"); out.print(u.getEmail()); %>
			</a>
				<ul class="dropdown-menu extended logout ">
					<div class="log-arrow-up"></div>
					<li class="eborder-top"><a href="#" data-toggle="modal"
						data-target="#myModal"><i class="icon_profile"></i>Change
							password</a></li>

					<li><a href="user.do?action=2"><i class="icon_key_alt"></i>
							Log Out</a></li>
				
				</ul></li>
                    <% } %>
            </div>
            
    </div>
    </div>
    
      <!-- Modal content-->
               <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
          <h4 class="modal-title" id="myModalLabel">Authentification</h4>
        </div>
        <div class="modal-body">
          <p>Entrer vos information .</p>
              <form role="form" action="login" method="post">
                <div class="form-group">
                  <label for="email">Email address:</label>
                  <input type="email" class="form-control" id="email" name="email" value="${cookie.user_email.value}" required>
                </div>
                <div class="form-group">
                  <label for="pwd">Password:</label>
                  <input type="password" class="form-control" id="pwd" name="pwd" value="${cookie.user_pass.value}" required>
                </div>
                <div class="checkbox">
               <label><input type="checkbox" name="remember_me"> Remember me</label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
              </form>       
       </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
        </div>
    	</div>
    	
    	
    	 <!-- Modal content2-->
               <div class="modal fade" id="myModal2" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
          <h4 class="modal-title" id="myModalLabel">Inscription</h4>
        </div>
        <div class="modal-body">
          <p>SVP Remplir tous les champs .</p>
         <form class="form-horizontal" role="form" action="user.do" method="post">
  
  <input type="hidden" name="action" value="signup"> 
   <input type="hidden" name="role" value="user">
  
      <div class="form-group">
      <label class="control-label col-sm-2" for="nom">Nom:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="nom" placeholder="Enter name" name="nom" required>
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="prenom">Prenom:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="prenom" placeholder="Enter prenom" name="prenom" required>
      </div>
      </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="adress">Adress:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="adress" placeholder="Enter Adress" name="adress" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="tel">Tel:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="tel" placeholder="Enter Tel" name="tel" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pays">Pays :</label>
      <div class="col-sm-10">
        <select class="form-control" id="pays" name="pays" name="pays" required>
       <jsp:include page="pays.jsp"></jsp:include>
      </select>
      </div>
    </div>
      <div class="form-group">
      <label class="control-label col-sm-2" for="ville">Ville :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="ville" placeholder="Enter city"  name="ville" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required >
      </div>
    </div>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>      
       </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
        </div>
    	</div>