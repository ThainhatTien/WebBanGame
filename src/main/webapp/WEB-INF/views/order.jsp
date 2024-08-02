<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>Lugx Gaming Order</title>
<!-- BootTrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Additional CSS Files -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/templatemo-lugx-gaming.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/owl.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
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
	<div class="main-banner">
		<div class="container">
			<div class="">
				<div class="">
					<div class="caption header-text">
						<div class="search-input">
							<form id="search" action="/index/search" method="get">
								<input type="text" placeholder="Type Something" id='searchText'
									name="searchKeyword" onkeypress="handle" />
								<button role="button">Search Now</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-3" >
		<div class="alert alert-success text-center" role="alert">Thanh toán thành công
			<div class="m-2"><a href="https://drive.google.com/drive/u/0/home" class="text-decoration-none">${user } Vui lòng vào link này để tải game</a></div>
			<div class="m-2"><a class="btn btn-primary" href="/index/home">Back Home</a></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-1.11.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/isotope.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/owl-carousel.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/counter.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
</body>
</html>