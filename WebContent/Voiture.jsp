<%@page import="module.*"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Insert title here</title>
<jsp:include page="includes/head.jsp"></jsp:include>
</head>
<body>

	<jsp:useBean id="v1" class="module.Voiture" scope="request" />

	<%--
    Voiture v1 = (Voiture)request.getAttribute("v1");
--%>
	<jsp:include page="includes/header.jsp"></jsp:include>

	<div id="port-folio" class="pad-top-botm">
		<div class="container">
			<div class="row ">

				<div class="col-lg-9 col-md-9">
					<br> <br> <br> <br> <br> <br> <br>
					<br> <img alt='...'
						src='assets/img/voitures/<jsp:getProperty name="v1" property="img" />'>


					<dt>Marque :</dt>
					<dd><jsp:getProperty name="v1" property="marque" /></dd>
					<dt>Description :</dt>
					<dd><jsp:getProperty name="v1" property="desc" /></dd>

					<form action="Voiture" method="post">
						<button type="submit" class="btn btn-primary">Réserver</button>
						<input type="hidden" name="id" value="<%=v1.getId()%>">
						<input type="hidden" name="action" value="reserve">
					</form>


				</div>
			</div>
		</div>
	</div>

	<jsp:include page="includes/footer.jsp"></jsp:include>




</body>
</html>