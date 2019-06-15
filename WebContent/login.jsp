<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@  page import="javax.servlet.http.Cookie"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/head.jsp"></jsp:include>
<title>Login</title>
</head>
<body>

	<%
		if (session.getAttribute("email") != null) {
			response.sendRedirect("admin/Home.jsp");
		}
	%>
	<jsp:include page="includes/header.jsp"></jsp:include>




	<div class="container">
		<div class="row pad-top-botm">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
				<div id="loginbox" style="margin-top: 100px;"
					class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Sign In</div>
						</div>

						<div style="padding-top: 30px" class="panel-body">

							<!--  virifier l'existance de message succes inscription -->
							<c:if test="${not empty stat}">
								<div class="alert alert-success">
									<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Success!
									</strong> ${stat}
								</div>
							</c:if>

							<%
								if (request.getParameter("stat2") != null
										&& request.getParameter("stat2").equals("1")) {
							%>
							<div class="alert alert-warning"">
								<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Info
									! </strong> Il faut s'authentifier pour louer une voiture
							</div>
							<%
								}
							%>
							<form id="loginform" class="form-horizontal" role="form"
								action="login" method="post">

								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input
										id="login-username" type="text" class="form-control"
										name="email" placeholder=" email"
										value="${cookie.user_email.value}" required>
								</div>

								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input
										id="login-password" type="password" class="form-control"
										name="pwd" placeholder="password"
										value="${cookie.user_pass.value}" required>
								</div>



								<div class="input-group">
									<div class="checkbox">
										<label> <input id="login-remember" type="checkbox"
											name="remember_me" value="1"> Remember me
										</label>
									</div>
								</div>


								<div style="margin-top: 10px" class="form-group">
									<!-- Button -->

									<div class="col-sm-12 controls">
										<input id="btn-login" type="submit" class="btn btn-success"
											value="Login">
									</div>
								</div>


								<div class="form-group">
									<div class="col-md-12 control">
										<div
											style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
											Don't have an account! <a href="signup.jsp"> Sign Up Here
											</a>
										</div>
									</div>
								</div>


								<!--  virifier l'existance de message error login -->
								<c:if test="${not empty err}">
									<div class="alert alert-danger" role="alert">
										<span class="glyphicon glyphicon-exclamation-sign"
											aria-hidden="true"></span> <span class="sr-only">Error:</span>
										${err}
									</div>
								</c:if>
							</form>



						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<br>
	<br>
	<br>






	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>