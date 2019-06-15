<%@page import="java.util.*"%>
<%@page import="module.*,data_base.*"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/head.jsp"></jsp:include>
<title>Voitures à loué</title>
<style type="text/css">
.dropdown.dropdown-lg .dropdown-menu {
	margin-top: -1px;
	padding: 6px 20px;
}

.input-group-btn .btn-group {
	display: flex !important;
}

.btn-group .btn {
	border-radius: 0;
	margin-left: -1px;
	height: 34px;
}

.btn-group .btn:last-child {
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
}

.btn-group .form-horizontal .btn[type="submit"] {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.form-horizontal .form-group {
	margin-left: 0;
	margin-right: 0;
}

.form-group .form-control:last-child {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

@media screen and (min-width: 768px) {
	#adv-search {
		width: 500px;
		margin: 0 auto;
	}
	.dropdown.dropdown-lg {
		position: static !important;
	}
	.dropdown.dropdown-lg .dropdown-menu {
		min-width: 500px;
	}
}

/* style pour themplaib*/
.productbox {
	background-color: #ffffff;
	padding: 10px;
	margin-bottom: 10px;
	-webkit-box-shadow: 0 8px 6px -6px #999;
	-moz-box-shadow: 0 8px 6px -6px #999;
	box-shadow: 0 8px 6px -6px #999;
	margin-left: 7%;
	margin-top: 4%;
	width: 300px;
}

.producttitle {
	font-weight: bold;
	padding: 5px 0 5px 0;
}

.productprice {
	border-top: 1px solid #dadada;
	padding-top: 5px;
}

.pricetext {
	font-weight: bold;
	font-size: 1.4em;
}

.prefix {
	color: rgb(165, 22, 22);
	font-family: serif;
	font-size: medium;
}

.notfound {
	height: 354px;
}
</style>
</head>
<body>



	<%
		// Services s = new Services();
	%>

	<jsp:include page="includes/header.jsp"></jsp:include>

	<div id="port-folio" class="pad-top-botm">
		<div class="container">

			<div class="row text-center ">
				<div
					class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<%
						if (request.getAttribute("res") != null) {
					%>
					<h2 data-wow-delay="0.3s" class="wow rollIn animated">
						<strong>Voiture Disponible :</strong>
					</h2>
					<p class="sub-head">
						Nos voiture de Type <i><b>${type}</b></i> qui son disponible pour
						le <i><b>${dd}</b></i>
					</p>
					<%
						} else if (request.getAttribute("stat") != null) {
					%>
					<h2 data-wow-delay="0.3s" class="wow rollIn animated">
						<strong>${stat}</strong>
					</h2>
					<%
						} else {
					%>
					<h2 data-wow-delay="0.3s" class="wow rollIn animated">
						<strong>Notre collection des voitures :</strong>
					</h2>
					<p class="sub-head">Choiser ce que vous voulez ! plus de 10
						voiture.</p>
					<%
						}
					%>

				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="input-group" id="adv-search">
						<input type="text" class="form-control"
							placeholder="Cherche sur voiture" />
						<div class="input-group-btn">
							<div class="btn-group" role="group">
								<div class="dropdown dropdown-lg">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false">
										<span class="caret"></span>
									</button>
									<div class="dropdown-menu dropdown-menu-right" role="menu">
										<form class="form-horizontal" action="#">
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
												<label for="type">Marque</label> <select
													class="form-control" id="type" name="idmarque">
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
												<label for="contain">Model</label> <input
													class="form-control" type="text" />
											</div>

											<button type="submit" class="btn btn-primary">
												<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
											</button>
										</form>
									</div>
								</div>
								<button type="button" class="btn btn-primary">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<%
					if (request.getAttribute("stat") == null) {
						Iterator<Voiture> i = null;
						if (request.getAttribute("res") != null) {
							List<Voiture> lv = (List<Voiture>) request
									.getAttribute("res");
							i = lv.iterator();
						} else {
							if (s.getAll("Voiture") != null) {
								i = s.getAll("Voiture").iterator();
							}
						}
						while (i.hasNext()) {
							Voiture v = i.next();
							request.setAttribute("v", v);
				%>

				<div class="col-md-2 column productbox">
					<img src="${v.img}" width="280" height="150">
					<div class="producttitle">
						<i class="prefix">Type</i> : ${v.type.type}
					</div>
					<div class="producttitle">
						<i class="prefix">Marque</i> : ${v.marque.marque}
					</div>
					<div class="producttitle">
						<i class="prefix">Model</i> : ${v.model}
					</div>
					<div class="producttitle">
						<i class="prefix">Nombre place </i> : ${v.nb_place}
					</div>
					<form action="reserve" method="post">
						<input type="hidden" name="action" value="Reserve"> <input
							type="hidden" name="id_voi" value="${v.id}">
						<div class="productprice">
							<div class="pull-right">
								<input class="btn btn-danger btn-sm" type="submit" role="button"
									value="Louer" />
							</div>
							<div class="pricetext">${v.prix_jour}MAD</div>
						</div>
					</form>
				</div>

				<%
					}
					} else {
				%>

				<div class="notfound"></div>

				<%
					}
				%>
			</div>
		</div>
	</div>





	<ul class="pager">
		<li class="previous"><a href="#">Previous</a></li>
		<li><a href="#">1</a></li>
		<li class="next"><a href="#">Next</a></li>
	</ul>

	<jsp:include page="includes/footer.jsp"></jsp:include>

</body>
</html>