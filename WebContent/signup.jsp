<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/head.jsp"></jsp:include>
<title>Login</title>
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

	<jsp:include page="includes/header.jsp"></jsp:include>



	<div class="container">
		<div class="row pad-top-botm">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 well well-sm">

				<legend>
					<a href="#"><i class="glyphicon glyphicon-globe"></i></a> Sign up!
				</legend>
				<form method="post" class="form" role="form" action="user.do"
					method="post">
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<input class="form-control" name="nom" placeholder="First Name"
								type="text" required autofocus />
						</div>
						<div class="col-xs-6 col-md-6">
							<input class="form-control" name="prenom" placeholder="Last Name"
								type="text" required />
						</div>
					</div>
					<input class="form-control" name="email" placeholder="Your Email"
						type="email" /> <input type="text" class="form-control"
						placeholder="Enter Adress" name="adress"> <input
						type="text" class="form-control" placeholder="Enter Tel"
						name="tel"> <input type="hidden" name="action"
						value="signup"> <input type="hidden" name="role"
						value="user"> <input type="text" class="form-control"
						placeholder="Enter city" name="ville"> <input
						class="form-control" name="p" placeholder=" Password"
						type="password" /> <label for="">Pays </label>
					<div class="row">
						<div class="col-sm-12">
							<select class="form-control" id="pays" name="pays" name="pays">
								<jsp:include page="includes/pays.jsp"></jsp:include>
							</select>
						</div>
					</div>

					<br /> <br />
					<button class="btn btn-lg btn-primary btn-block" type="submit">
						Sign up</button>
				</form>

			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>