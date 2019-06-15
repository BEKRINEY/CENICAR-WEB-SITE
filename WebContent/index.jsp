<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@page import="module.*,java.util.*,data_base.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="includes/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="includes/header.jsp"></jsp:include>

	<!--./ NAV BAR END -->
	<div id="home">
		<div class="overlay">
			<div class="container">
				<div class="row ">
					<div class="col-lg-9 col-md-9 head-text">
						<h1 id="divDisp">POURQUOI VOUS CHOISER NOTRE LOCATION ?</h1>
						<span> <i class="fa fa-lightbulb-o "></i> Le prix est
							moin chére
						</span> <span> <i class="fa fa-lightbulb-o"></i> Service rapide
						</span> <span> <i class="fa fa-lightbulb-o"></i> Assistance
							24H/24H 7j/7j
						</span>



					</div>
					<div class="col-lg-3 col-md-3">
						<div class="div-trans text-center">
							<h3>LOUER VOITURE</h3>
							<h4>
								<i class="fa fa-code"></i><span>A OUARZAZATE</span> <i
									class="fa fa-code"></i>
							</h4>
							<div class="col-lg-12 col-md-12 col-sm-12">

								<form action="Voiture" method="post">

									<div class="form-group">
										<label for="dd">Date de départ : </label> <input type="date"
											class="form-control" name="dd" required="required"
											pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"
											placeholder="YYYY-MM-DD">

									</div>

									<input type="hidden" name="cherche" value="1">

									<div class="form-group">
										<label for="type">Type Véhicule :</label> <select
											class="form-control" id="type" name="type">
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

									<input type="hidden" name="action" value="cherche">

									<div class="form-group">
										<button type="submit"
											class="btn btn-success btn-block btn-lg btn-reserve">Reserver
											Maintenant !</button>
									</div>

								</form>
							</div>

						</div>
					</div>
				</div>

			</div>

		</div>


		<!--./ HOME SECTION END -->


		<!--./ ABOUT SECTION END -->

		<!--./ DONARS TESTIMONIALS END -->


		<!--./ HELP SECTION END -->

		<!--./ CONTACT SECTION END -->

		<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>
