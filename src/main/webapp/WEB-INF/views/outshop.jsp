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

<title>Lugx Gaming - Shop Page</title>

<!-- Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


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
					<h3>Our Shop</h3>
					<span class="breadcrumb"><a href="/index/home">Home</a> >
						Our Shop  
				</div>
			</div>
		</div>
	</div>

	<div class="section trending">
		<div class="container">
			<form action="/index/outshop" method="get" class="form-inline row">
				<label for="genre">Thể loại:</label>
				<div class="form-group col-8">

					<select name="genreName" id="genre" class="form-control">
						<option value="">Tất cả</option>
						<c:forEach items="${genres}" var="genre">
							<option value="${genre.name}">${genre.name}</option>
						</c:forEach>
					</select>
				</div>
				<button type="submit" class="btn btn-primary col-4">Lọc</button>
			</form>

			<div class="row trending-box mt-3">
				<c:forEach var="game" items="${games}">
					<c:if test="${not empty genreName}">
						<c:set var="showGame" value="false" />
						<c:forEach var="genre" items="${game.genres}">
							<c:if test="${genre.name eq genreName}">
								<c:set var="showGame" value="true" />
							</c:if>
						</c:forEach>
						<c:if test="${showGame eq 'true'}">
							<div
								class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv">
								<div class="item">
									<div class="thumb">
										<a href="product-details.html"><img
											src="/image/${game.posterUrl}" alt=""></a> <span
											class="price">${game.price}</span>
									</div>
									<div class="down-content">
										<span class="category">
											<ul>
												<c:forEach var="genre" items="${game.genres}">
													<li>${genre.name}</li>
												</c:forEach>
											</ul>
										</span>
										<h4>${game.title}</h4>
										<a href="/detail/${game.gameId}"><i
											class="fa fa-shopping-bag"></i></a>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>
					<c:if test="${empty genreName}">
						<div
							class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv">
							<div class="item">
								<div class="thumb">
									<a href="product-details.html"><img
										src="/image/${game.posterUrl}" alt=""></a> <span
										class="price">${game.price}</span>
								</div>
								<div class="down-content">
									<span class="category">
										<ul>
											<c:forEach var="genre" items="${game.genres}">
												<li>${genre.name}</li>
											</c:forEach>
										</ul>
									</span>
									<h4>${game.title}</h4>
									<a href="/detail/${game.gameId}"><i
										class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>



		</div>
		<div class="row">
			<div class="col-lg-12">
				<ul class="pagination">
					<c:if test="${currentPage > 0}">
						<li><a
							href="?page=${currentPage - 1}&size=${size}${not empty genreName ? '&genreName=' + genreName : ''}">&lt;</a></li>
					</c:if>

					<c:if test="${totalPages > 0}">
						<c:forEach var="pageNumber" begin="0" end="${totalPages - 1}">
							<c:choose>
								<c:when test="${pageNumber == currentPage}">
									<li><a
										href="?page=${pageNumber}&size=${size}${not empty genreName ? '&genreName=' + genreName : ''}">${pageNumber + 1}</a></li>
								</c:when>
								<c:otherwise>
									<li><span>${pageNumber + 1}</span></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>

					<c:if test="${currentPage < totalPages - 1}">
						<li><a
							href="?page=${currentPage + 1}&size=${size}${not empty genreName ? '&genreName=' + genreName : ''}">&gt;</a></li>
					</c:if>
				</ul>
			</div>
		</div>

	</div>

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/js/isotope.min.js"></script>
	<script src="/assets/js/owl-carousel.js"></script>
	<script src="/assets/js/counter.js"></script>
	<script src="/assets/js/custom.js"></script>

</body>
</html>