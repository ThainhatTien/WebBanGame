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

<title>Lugx Gaming Shop</title>
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
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
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
			<div class="row">
				<div class="col-lg-6 align-self-center">
					<div class="caption header-text">
						<h6>Welcome to lugx</h6>
						<h2>BEST GAMING SITE EVER!</h2>
						<p>LUGX Gaming</p>
						<div class="search-input">
							<form id="search"  action="/index/search" method="get">
								<input type="text" placeholder="Type Something" id='searchText'
									name="searchKeyword" onkeypress="handle" />
								<button role="button">Search Now</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-4 offset-lg-2">
					<div class="right-image">
						<img
							src="${pageContext.request.contextPath}/assets/images/banner-image.jpg"
							alt=""> <span class="price">$22</span> <span class="offer">-40%</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<a href="#">
						<div class="item">
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/assets/images/featured-01.png"
									alt="" style="max-width: 44px;">
							</div>
							<h4>Free Storage</h4>
						</div>
					</a>
				</div>
				<div class="col-lg-3 col-md-6">
					<a href="#">
						<div class="item">
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/assets/images/featured-02.png"
									alt="" style="max-width: 44px;">
							</div>
							<h4>User More</h4>
						</div>
					</a>
				</div>
				<div class="col-lg-3 col-md-6">
					<a href="#">
						<div class="item">
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/assets/images/featured-03.png"
									alt="" style="max-width: 44px;">
							</div>
							<h4>Reply Ready</h4>
						</div>
					</a>
				</div>
				<div class="col-lg-3 col-md-6">
					<a href="#">
						<div class="item">
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/assets/images/featured-04.png"
									alt="" style="max-width: 44px;">
							</div>
							<h4>Easy Layout</h4>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="section trending">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-heading">
						<h6>Trending</h6>
						<h2>Trending Games</h2>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="main-button">
						<a href="/index/outshop">View All</a>
					</div>
				</div>
				<c:forEach var="game" items="${gamesRating}">
					<div class="col-lg-3 col-md-6">
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
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="section most-played">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-heading">
						<h6>TOP GAMES</h6>
						<h2>Most Played</h2>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="main-button">
						<a href="/index/outshop">View All</a>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="item">
						<div class="thumb">
							<a href="product-details.html"><img
								src="${pageContext.request.contextPath}/assets/images/top-game-01.jpg"
								alt=""></a>
						</div>
						<div class="down-content">
							<span class="category">Adventure</span>
							<h4>Assasin Creed</h4>
							<a href="product-details.html">Explore</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="item">
						<div class="thumb">
							<a href="product-details.html"><img
								src="${pageContext.request.contextPath}/assets/images/top-game-02.jpg"
								alt=""></a>
						</div>
						<div class="down-content">
							<span class="category">Adventure</span>
							<h4>Assasin Creed</h4>
							<a href="product-details.html">Explore</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="item">
						<div class="thumb">
							<a href="product-details.html"><img
								src="${pageContext.request.contextPath}/assets/images/top-game-03.jpg"
								alt=""></a>
						</div>
						<div class="down-content">
							<span class="category">Adventure</span>
							<h4>Assasin Creed</h4>
							<a href="product-details.html">Explore</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="item">
						<div class="thumb">
							<a href="product-details.html"><img
								src="${pageContext.request.contextPath}/assets/images/top-game-04.jpg"
								alt=""></a>
						</div>
						<div class="down-content">
							<span class="category">Adventure</span>
							<h4>Assasin Creed</h4>
							<a href="product-details.html">Explore</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="item">
						<div class="thumb">
							<a href="product-details.html"><img
								src="${pageContext.request.contextPath}/assets/images/top-game-05.jpg"
								alt=""></a>
						</div>
						<div class="down-content">
							<span class="category">Adventure</span>
							<h4>Assasin Creed</h4>
							<a href="product-details.html">Explore</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="item">
						<div class="thumb">
							<a href="product-details.html"><img
								src="${pageContext.request.contextPath}/assets/images/top-game-06.jpg"
								alt=""></a>
						</div>
						<div class="down-content">
							<span class="category">Adventure</span>
							<h4>Assasin Creed</h4>
							<a href="product-details.html">Explore</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="section categories">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-heading">
						<h6>Categories</h6>
						<h2>Top Categories</h2>
					</div>
				</div>
				<c:forEach items="${genres}" var="genre" varStatus="loop">
					<c:if test="${loop.index < 5}">
						<div class="col-lg col-sm-6 col-xs-12">
							<div class="item">
								<h4>${genre.name}</h4>
								<div class="thumb">
									<a href="/index/outshop?genreName=${genre.name}"><img
										src="/assets/images/${genre.poster_url}.jpg"
										alt=""></a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>

			</div>
		</div>
	</div>

	<div class="section cta">
		<div class="container">
			<div class="row">
				<div class="col-lg-5">
					<div class="shop">
						<div class="row">
							<div class="col-lg-12">
								<div class="section-heading">
									<h6>Our Shop</h6>
									<h2>
										Go Pre-Order Buy & Get Best <em>Prices</em> For You!
									</h2>
								</div>
								<p>Lorem ipsum dolor consectetur adipiscing, sed do eiusmod
									tempor incididunt.</p>
								<div class="main-button">
									<a href="/index/outshop">Shop Now</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-2 align-self-end">
					<div class="subscribe">
						<div class="row">
							<div class="col-lg-12">
								<div class="section-heading">
									<h6>NEWSLETTER</h6>
									<h2>
										Get Up To $100 Off Just Buy <em>Subscribe</em> Newsletter!
									</h2>
								</div>
								<div class="search-input">
									<form id="subscribe" action="#">
										<input type="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Your email...">
										<button type="submit">Subscribe Now</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/isotope.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/owl-carousel.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/counter.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>



</body>
</html>