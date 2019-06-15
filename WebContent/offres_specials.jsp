<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@page import="module.Offre,java.util.List"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/head.jsp"></jsp:include>
<title>Offres Spécials</title>
<style type="text/css">
a.list-group-item {
	height: auto;
	min-height: 220px;
}

a.list-group-item.active small {
	color: #fff;
}

.stars {
	margin: 20px auto 1px;
}

/*  style 2 */
@import
	url("http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css")
	;

.panel-image {
	position: relative;
}

.panel-image img.panel-image-preview {
	width: 100%;
	border-radius: 4px 4px 0px 0px;
}

.panel-image label {
	display: block;
	position: absolute;
	top: 0px;
	left: 0px;
	height: 100%;
	width: 100%;
}

.panel-heading ~ .panel-image img.panel-image-preview {
	border-radius: 0px;
}

.panel-body {
	overflow: hidden;
}

.panel-image ~ input[type=checkbox] {
	position: absolute;
	top: - 30px;
	z-index: -1;
}

.panel-image ~ input[type=checkbox] ~ .panel-body {
	height: 0px;
	padding: 0px;
}

.panel-image ~ input[type=checkbox]:checked ~ .panel-body {
	height: auto;
	padding: 15px;
}

.panel-image ~ .panel-footer a {
	padding: 0px 10px;
	font-size: 1.3em;
	color: rgb(100, 100, 100);
}
</style>
</head>
<body>

	<jsp:include page="includes/header.jsp"></jsp:include>



	<div id="port-folio" class="pad-top-botm">
		<div class="container">



			<!-- begin offers
   			
   		
    <div class="row">
		<div class="well">
                <div class="row text-center ">
                <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                    <h2 data-wow-delay="0.3s" class="wow rollIn animated"><strong>Notre Offres Spécial</strong></h2>
                    <p class="sub-head"> Pour vous etre toujoures avec nous, si otre plisaer . </p>
                    
                </div>
            </div>
        <div class="list-group">
        
         <c:forEach items="${lo}" var="lo">
         
          <a href="#" class="list-group-item ">
                <div class="media col-md-3">
                    <figure class="pull-left">
                        <img class="media-object img-rounded img-responsive"  src="assets/img/voitures/<c:out value="${lo.img}"/>" alt="placehold.it/350x250" >
                    </figure>
                </div>
                <div class="col-md-6">
                    <h4 class="list-group-item-heading"> <c:out value="${lo.titre}"/> </h4>
                    <p class="list-group-item-text"> <c:out value="${lo.desc}"/> </p>
                </div>
                <div class="col-md-3 text-center">
                   <form action="reserve" method="post">
                   <input type="hidden" name="id" value="">
                   <input type="hidden" name="action" value="reserve">
                    <button type="submit" class="btn btn-primary btn-lg btn-block"> Apply Now! </button>
    
                 </form>
                </div>
          </a>
          
           </c:forEach>
           
        </div>
        </div>
	</div>
</div>


</div> -->

			<div class="row form-group">
				<div class="row text-center ">
					<div
						class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
						<h2 data-wow-delay="0.3s" class="wow rollIn animated">
							<strong>Notre Offres Spécial</strong>
						</h2>
						<p class="sub-head">Pour vous etre toujoures avec nous, si
							otre plisaer .</p>

					</div>
				</div>
				<div class="col-xs-12 col-md-6">
					<div class="panel panel-default">
						<div class="panel-image">
							<img
								src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52cd36aac6bed_1.JPG"
								class="panel-image-preview" /> <label for="toggle-4"></label>
						</div>
						<input type="checkbox" id="toggle-4" checked
							class="panel-image-toggle">
						<div class="panel-body">
							<h4>Show the Description by default!</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Sed in lobortis nisl, vitae iaculis sapien. Phasellus ultrices
								gravida massa luctus ornare. Suspendisse blandit quam elit, eu
								imperdiet neque semper et.</p>
						</div>
						<div class="panel-footer text-center">
							<button class="btn btn-lg btn-primary btn-block" type="submit">
								Appliquer l'offre</button>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-md-6">
					<div class="panel panel-default">
						<div class="panel-image">
							<img
								src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52cd36aac6bed_1.JPG"
								class="panel-image-preview" /> <label for="toggle-4"></label>
						</div>
						<input type="checkbox" id="toggle-4" checked
							class="panel-image-toggle">
						<div class="panel-body">
							<h4>Show the Description by default!</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Sed in lobortis nisl, vitae iaculis sapien. Phasellus ultrices
								gravida massa luctus ornare. Suspendisse blandit quam elit, eu
								imperdiet neque semper et.</p>
						</div>
						<div class="panel-footer text-center">
							<button class="btn btn-lg btn-primary btn-block" type="submit">
								Appliquer l'offre</button>
						</div>
					</div>
				</div>



				<div class="col-xs-12 col-md-6">
					<div class="panel panel-default">
						<div class="panel-image">
							<img
								src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52cd36aac6bed_1.JPG"
								class="panel-image-preview" /> <label for="toggle-4"></label>
						</div>
						<input type="checkbox" id="toggle-4" checked
							class="panel-image-toggle">
						<div class="panel-body">
							<h4>Show the Description by default!</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Sed in lobortis nisl, vitae iaculis sapien. Phasellus ultrices
								gravida massa luctus ornare. Suspendisse blandit quam elit, eu
								imperdiet neque semper et.</p>
						</div>
						<div class="panel-footer text-center">
							<button class="btn btn-lg btn-primary btn-block" type="submit">
								Appliquer l'offre</button>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-md-6">
					<div class="panel panel-default">
						<div class="panel-image">
							<img
								src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52cd36aac6bed_1.JPG"
								class="panel-image-preview" /> <label for="toggle-4"></label>
						</div>
						<input type="checkbox" id="toggle-4" checked
							class="panel-image-toggle">
						<div class="panel-body">
							<h4>Show the Description by default!</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Sed in lobortis nisl, vitae iaculis sapien. Phasellus ultrices
								gravida massa luctus ornare. Suspendisse blandit quam elit, eu
								imperdiet neque semper et.</p>
						</div>
						<div class="panel-footer text-center">
							<button class="btn btn-lg btn-primary btn-block" type="submit">
								Appliquer l'offre</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>



	<jsp:include page="includes/footer.jsp"></jsp:include>

</body>
</html>