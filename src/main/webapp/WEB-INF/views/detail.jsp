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

<title>Lugx Gaming - Product Detail</title>

<!-- BootTrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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
					<h3> ${game.title}</h3>
					<span class="breadcrumb"><a href="/index/home">Home</a> > <a
						href="/index/outshop">Shop</a> > ${game.title}</span>
				</div>
			</div>
		</div>
	</div>
	<div class="single-product section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-image">
						<img src="/image/${game.posterUrl}" alt="">
					</div>
				</div>
				<div class="col-lg-6 align-self-center">
					<h4>${game.title}</h4>
					<span class="price">${game.price}</span>
					<p>${game.description}</p>
					<ul class="mb-4">
						<li><span>Game ID:</span> ${game.gameId }</li>
						<li><span>Genre:</span> <c:forEach var="genre"
								items="${game.genres}">
								<li>${genre.name}</li>
							</c:forEach></li>
					</ul>
					<form id="addToCartForm"
						action="/cart/add/${currentUser.getUserId()}/${game.gameId}/${1}"
						method="post" class="">
						<input type="hidden" class="form-control" name="quantity"
							id="quantity" min="1" value="1" placeholder="1">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-shopping-bag"></i> ADD TO CART
						</button>
					</form>
				</div>
				<div class="col-lg-12">
					<div class="sep"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="more-info">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-content">
						<div class="row">
							<div class="nav-wrapper ">
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="description-tab"
											data-bs-toggle="tab" data-bs-target="#description"
											type="button" role="tab" aria-controls="description"
											aria-selected="true">Description</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
											data-bs-target="#reviews" type="button" role="tab"
											aria-controls="reviews" aria-selected="false">Reviews</button>
									</li>
								</ul>
							</div>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="description"
									role="tabpanel" aria-labelledby="description-tab">
									<div class="mb-3 mt-3 fs-5 fw-bolder">Cấu hình chơi game</div>
									<ul>
										<li>Bộ xử lý: Intel Core i5-8250U thế hệ thứ 8 1.6 GHz</li>
										<li>Bộ nhớ trong: RAM 8GB</li>
										<li>Ổ cứng: SSD 256GB</li>
										<li>Card màn hình: NVIDIA GeForce MX150 với 2GB DDR5 VRAM</li>
										<li>Màn hình: 15.6 inch LED-backlit Full HD, độ phân giải 1920x1080</li>
										<li>Hệ điều hành: Windows 10 Home 64 bit</li>
									</ul>
									<div class="mb-3 mt-3 fs-5 fw-bolder">Trailer Game</div>
									 <iframe style="width:1000px;  height: 400px; " src="https://www.youtube.com/embed/${game.trailerUrl}" title="YouTube video" allowfullscreen></iframe>
								</div>
								<div class="tab-pane fade" id="reviews" role="tabpanel"
									aria-labelledby="reviews-tab">
									<div class="anime__review__item__text">
										<c:forEach var="review" items="${reviews}">
											<h6>
												${review[1]} <span>${review[3]}</span>
											</h6>
											<p>${review[0]}</p>
										</c:forEach>
									</div>
									<div class="anime__details__form">
										<div class="section-title mb-2">
											<h5>Your Comment</h5>
										</div>
										<form:form action="/review" method="post"
											modelAttribute="review">
											<form:input type="hidden" path="game" value="${game.gameId}" />
											<form:input type="hidden" path="user"
												value="${currentUser.userId}" />
											<form:textarea class="form-control"
												placeholder="Your Comment" path="comment" name="comment"
												cols="120" rows="10" />
											<button type="submit" class="btn btn-primary mt-2">
												<i class="fa fa-location-arrow"></i> Review
											</button>
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="section categories related-games">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-heading">
						<h6>Action</h6>
						<h2>Related Games</h2>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="main-button">
						<a href="/index/outshop">View All</a>
					</div>
				</div>
				<c:forEach items="${genres}" var="genre" varStatus="loop">
					<c:if test="${loop.index < 5}">
						<div class="col-lg col-sm-6 col-xs-12">
							<div class="item">
								<h4>${genre.name}</h4>
								<div class="thumb">
									<a href="/index/outshop?genreName=${genre.name}"><img
										src="/assets/images/${genre.poster_url}.jpg" alt=""></a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
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