<%@page import="module.*,java.util.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Facture</title>
<jsp:include page="includes/head.jsp"></jsp:include>
<style type="text/css">
.info {
	font-style: normal;
	font-family: cursive;
}

@media print {
	.no-print,.no-print * {
		display: none !important;
	}
}
</style>

<script type="text/javascript">
function printIt() {
 window.print();
}
</script>
</head>
<body>
	<div class="no-print">
		<jsp:include page="includes/header.jsp"></jsp:include>
	</div>

	<%
		Location l = (Location) request.getAttribute("l");
	%>

	<
	<div class="container">

		<div class="row text-center no-print">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
				<br>
				<br>
				<h2 data-wow-delay="0.3s" class="wow rollIn animated">
					<strong>Félicitation :</strong>
				</h2>
				<p class="sub-head">Votre commande est bien effectué .</p>
			</div>
		</div>

		<div class="row pad-top-botm">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 well well-sm">

				<div class="col-sm-6 col-md-4 info ">
					<p>
						CINECAR S.A.R.L<br> Hay lwahda N 1403<br> Phone: (555)
						555-5555
					</p>
				</div>
				<div class="col-sm-6 col-md-4"></div>
				<div class="col-sm-6 col-md-4 info">
					<p>${l.utilisateur.nom}
						${l.utilisateur.prenom}<br> ${l.utilisateur.email}<br>
						${l.utilisateur.adress}<br>
				</div>
				<div class="col-sm-6 col-md-4 info"></div>
				<div class="col-sm-6 col-md-4 info">
					<%
						DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
						Date date = new Date();
					%>
					<p>
						Le : <b><%=dateFormat.format(date)%></b><br>
				</div>


				<div class="col-md-12">


					<br>
					<br>
					<br>
					<br> <br>
					<br>
					<br>
					<br>

				</div>

				<div class="col-md-12">
					<table class="table table-striped table-bordered">
						<tr>
							<th>Voiture</th>
							<th>Nombre jours</th>
							<th>Prix /Jr</th>
							<th>Payement methode</th>
						</tr>
						<tr>
							<td>${l.voiture.marque.marque}${l.voiture.type.type}</td>
							<td>${nb_jrs}</td>
							<td>${l.voiture.prix_jour}</td>
							<td>${l.payement.mod_pay}</td>
						</tr>
						<tr>
					</table>

					<div class="row ">
						<div class="col-md-4"></div>
						<div class="col-md-4"></div>
						<div class="col-md-4">

							<span class="info">Prix Total</span> : <b>${l.prix}</b> MAD
						</div>

					</div>

					<br>
					<br>
					<br>
					<br>
					<br>

					<div class="row  no-print">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button type="button" class="btn btn-primary btn-lg"
								onclick=printIt()>Imprimer</button>
						</div>
						<div class="col-md-4"></div>

					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="no-print">
		<jsp:include page="includes/footer.jsp"></jsp:include>
	</div>

</body>
</html>