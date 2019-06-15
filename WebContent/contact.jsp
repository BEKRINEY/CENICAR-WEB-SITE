<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="includes/head.jsp"></jsp:include>
<title>Contacter nous</title>
</head>
<body>


	<jsp:include page="includes/header.jsp"></jsp:include>


	<div id="contact">
		<div class="container">
			<div class="row text-center">
				<div
					class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<h2 data-wow-delay="0.3s" class="wow rollIn animated">
						<strong>CONTACT US </strong>
					</h2>
					<p class="sub-head">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit onec molestie non sem vel condimentum. Lorem ipsum
						dolor sit amet, consectetur adipiscing elit.</p>

					<p class="sub-head  wow rotateIn animated" data-wow-delay="0.4s">
						<strong>ADDRESS :</strong> 2234/908, Newyork City , USA - 002309
					</p>

					<iframe
						src="https://www.google.com/maps/embed?pb=!1m19!1m12!1m3!1d1711.2542233903403!2d-6.8983043789036795!3d30.928361166929754!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m4!1i0!3e6!4m0!4m0!5e0!3m2!1sfr!2s!4v1428362095640"
						width="400" height="300" frameborder="0" style="border: 0"></iframe>

				</div>
			</div>
			<div class="row  text-center wow rotateIn animated"
				data-wow-delay="0.4s">
				<div
					class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<a href="#"> <img src="assets/img/Social/facebook.png" alt="" />
					</a> <a href="#"> <img src="assets/img/Social/google-plus.png"
						alt="" /></a> <a href="#"> <img
						src="assets/img/Social/twitter.png" alt="" /></a>
				</div>
			</div>
			<div class="row pad-top-botm">
				<div
					class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<%
						if (request.getParameter("stat") != null
								&& request.getParameter("stat").equals("1")) {
					%>
					<div class="alert alert-success">
						<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Success!
						</strong> Vous avez envoyer le message avec sucess!
					</div>
					<%
						} else if (request.getParameter("stat") != null
								&& request.getParameter("stat").equals("0")) {
					%>

					<div class="alert alert-danger alert-error">
						<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Error!</strong>
						La message n'est pas envoyer!
					</div>

					<%
						}
					%>

					<form action="user.do" method="post">
						<input type="hidden" name="action" value="mail">
						<div class="form-group">
							<input type="text" class="form-control wow rotateIn animated"
								data-wow-delay="0.5s" name="subject" required="required"
								placeholder="Subject">
						</div>
						<div class="form-group">
							<input type="email" class="form-control wow rotateIn animated"
								required="required" data-wow-delay="0.6s" name="from"
								placeholder="Your Email">
						</div>
						<div class="form-group">
							<textarea name="msg" required="required" data-wow-delay="0.7s"
								class="wow rotateIn animated form-control"
								style="min-height: 150px;" placeholder="Message"></textarea>
						</div>
						<div class="form-group">
							<button type="submit"
								class="btn btn-success btn-block btn-lg wow rotateIn animated "
								data-wow-delay="0.8s">SUBMIT REQUEST</button>
						</div>

					</form>
				</div>
			</div>
		</div>


	</div>

	<!--./ CONTACT SECTION END -->

	<jsp:include page="includes/footer.jsp"></jsp:include>

</body>
</html>