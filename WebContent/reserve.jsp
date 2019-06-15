<%@page import="module.*,java.util.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Resérvation</title>
<jsp:include page="includes/head.jsp"></jsp:include>
<style type="text/css">
body {
	padding-top: 30px;
}

.form-control {
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<%
		HttpSession s = request.getSession();

		if (session.getAttribute("u") == null) {
			response.sendRedirect("login.jsp?stat2=1");
		}

		Voiture v = (Voiture) s.getAttribute("v_res");
		request.setAttribute("v", v);
	%>
	<jsp:include page="includes/header.jsp"></jsp:include>
	<br>
	<br>
	<div class="container">
		<div class="row pad-top-botm">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 well well-sm">



				<legend>
					<a href="#"><i class="glyphicon glyphicon-globe"></i></a>Réservation
				</legend>
				<%
					if (request.getParameter("stat") != null
							&& request.getParameter("stat").equals("date")) {
				%>

				<div class="alert alert-danger"">
					<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Erreur
						! </strong> Il faut choiser les dates correctement !
				</div>

				<%
					}
				%>
				<form method="post" class="form" role="form" action="reserve"
					method="post">
					<label for="">Type </label> <input type="text" class="form-control"
						value="${v.type.type}" name="adress" disabled="disabled">
					<label for="">Marque </label> <input class="form-control"
						name="email" value="${v.marque.marque}" type="text"
						disabled="disabled" /> <label for="">Model </label> <input
						type="text" class="form-control" value="${v.model}" name="tel"
						disabled="disabled"> <label for="">Prix_jour </label> <input
						type="text" class="form-control" value="${v.prix_jour} DH"
						name="tel" disabled="disabled"> <label for="">Date
						de reservation </label>
					<%
						DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
						Date date = new Date();
					%>
					<input type="text" class="form-control"
						value="<%=dateFormat.format(date)%>" name="tel"
						disabled="disabled"> <input type="hidden" name="action"
						value="pass_pay">

					<div class="form-group">
						<label for="dd">Date de départ : </label> <input type="date"
							name="dd" class="form-control" name="dd" required="required"
							min="<%=dateFormat.format(date)%>"
							pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"
							placeholder="YYYY-MM-DD">

					</div>
					<div class="form-group">
						<label for="da">Date d'arrivée : </label> <input type="date"
							name="da" class="form-control" required="required"
							min="<%=dateFormat.format(date)%>"
							pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"
							placeholder="YYYY-MM-DD">

					</div>

					<br /> <br />
					<button class="btn btn-lg btn-primary btn-block" type="submit">
						Passer au payment</button>
				</form>

			</div>
		</div>
	</div>

	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>