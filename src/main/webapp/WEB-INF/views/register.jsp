<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>Lugx Gaming Register</title>

<!-- Bootstrap core CSS -->
<link href="/assets/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="/assets/css/fontawesome.css">
<link rel="stylesheet" href="/assets/css/templatemo-lugx-gaming.css">
<link rel="stylesheet" href="/assets/css/owl.css">
<link rel="stylesheet" href="/assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!--

TemplateMo 589 lugx gaming

https://templatemo.com/tm-589-lugx-gaming

-->
</head>

<body>

	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- ***** Header Area Start ***** -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	<!-- ***** Header Area End ***** -->

	<div class="page-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h3>Sign Up</h3>
					<span class="breadcrumb"><a href="#">Home</a> > Sign Up</span>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty message}">
		<div class="alert alert-danger mt-1">${message}</div>
	</c:if>
	<div class="contact-page section">
		<div class="container">
			<div class="col-lg-6">
				<div class="right-content">
					<div class="row">
						<div class="col-lg-12">
							<form:form id="contact-form" action="/form/user/signup"
								method="post" modelAttribute="user">
								<div class="row">
									<div class="col-lg-12">
										<fieldset>
											<form:input type="text" path="fullname" name="fullname" id="fullname"
												placeholder="Your Name..."/>
										</fieldset>
									</div>
									<div class="col-lg-12">
										<fieldset>
											<form:input type="text" path="username" name="username"
												id="username" placeholder="Username..."/>
										</fieldset>
									</div>
									<div class="col-lg-12">
										<fieldset>
											<form:input type="email" path="email" name="email" id="email"
												placeholder="Your E-mail..." />
										</fieldset>
									</div>
									<div class="col-lg-12">
										<fieldset>
											<form:input type="password" path="password" name="password"
												id="password" placeholder="password"/>
										</fieldset>
									</div>
									<div class="col-lg-6">
										<fieldset>
											<button type="submit" id="form-submit" class="orange-button">Sign up</button>
										</fieldset>
									</div>
									<div class="col-lg-6">
										<fieldset>
											<a type="submit" id="form-submit" href="/login/user"
												class="btn btn-primary">Sign in</a>
										</fieldset>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="/assets/js/jquery-1.11.3.min.js"></script>
	<script src="/assets/js/bootstrap.min.js"></script>
	<script src="/assets/js/isotope.min.js"></script>
	<script src="/assets/js/owl-carousel.js"></script>
	<script src="/assets/js/counter.js"></script>
	<script src="/assets/js/custom.js"></script>

</body>
</html>