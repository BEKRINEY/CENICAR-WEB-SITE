<%@page import="module.*"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Payement</title>
<jsp:include page="includes/head.jsp"></jsp:include>
<style type="text/css">
.form-control {
	margin-bottom: 10px;
}

body {
	margin-top: 20px;
}

.panel-title {
	display: inline;
	font-weight: bold;
}

.checkbox.pull-right {
	margin: 0;
}

.pl-ziro {
	padding-left: 0px;
}

.center_cl {
	margin: auto;
	margin-bottom: 5%;
	margin-top: 6%;
}

.img {
	margin: 8px 48px;
	width: 200px;
	height: 100px;
}
</style>
<script type="text/javascript">
	function MadToDollar(prix_mad) {
		return prix_mad * 0.08;
	}
</script>
</head>
<body>

	<%
		HttpSession s = request.getSession();
		Voiture v = (Voiture) s.getAttribute("v_res");
	%>
	<jsp:include page="includes/header.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row center_cl">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Payment Details</h3>

					</div>
					<div class="panel-body">


						<div class="row ">
							<div class="col-sm-12"></div>
						</div>


						<label for="">Mode de payment : </label><br>
						<div class="col-md-4"></div>
						<div class="col-md-4 ">
							<img class="img" alt="" src="assets/img/payement/payment.png">
						</div>
						<div class="col-md-4"></div>
						<form action="reserve" method="post">
							<input type="hidden" name="action" value="pay_cache">
							<button class="btn btn-lg btn-success btn-block" type="submit">Cache</button>
						</form>
						<p class="help-block">Si vous avez choisez le cache tu doit
							payez a l'agence et l'administrateur qui vas valider votre
							commande.</p>
						<div class="col-md-4"></div>
						<div class="col-md-4 img_s">
							<img class="img" alt="" src="assets/img/payement/CreditCard.png">
						</div>
						<div class="col-md-4"></div>
						<form action="https://www.paypal.com/cgi-bin/webscr" method="POST">
							<input type="hidden" name="cmd" value="_cart"> <input
								type="hidden" name="invoice" value="idCmd"> <input
								type="hidden" name="upload" value="1"> <input
								type="hidden" name="business" value="youssef.bekrine@gmail.com">

							<input type="hidden" name="item_name_1"
								value="<%=v.getMarque().getMarque() + " " + v.getModel()%>">
							<input type="hidden" name="quantity_1" value="1"> <input
								type="hidden" name="amount_1" value="" id="amount_1">
							<script type="text/javascript">
								var elem = document.getElementById("amount_1");
								elem.value = MadToDollar(
							<%=s.getAttribute("prix_total")%>
								);
							</script>
							<input type="hidden" name="notify_url" value="facture.jsp">
							<input type="hidden" value="payment.jsp" name="return"> <input
								type="hidden" value="payment.jsp" name="cancel_return">
							<input type="hidden" value="USD" name="currency_code">
							<button class="btn btn-lg btn-success btn-block" type="submit">Paypal</button>
						</form>
						<br /> <br />
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="#"><span
									class="badge pull-right"><span>MAD</span> <%=s.getAttribute("prix_total")%></span>
									Final Payment</a></li>
						</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<br>
	<br>
	<br>
	<br>
	<br>

	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>