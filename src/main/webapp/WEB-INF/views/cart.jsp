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
	<div>
		<main role="main">
			<div class="container mt-4">
				<h1 class="text-center mb-4" style="color: #212529;">Shopping
					Cart</h1>
				<div class="row">
					<div class="col col-md-12">
						<c:if test="${not empty message}">
							<div class="alert alert-success">${message}</div>
						</c:if>
						<c:if test="${not empty cart.detail}">
							<table border="1" style="width: 100%;" class="table table-hover">
								<thead>
									<tr>
										<th>STT</th>
										<th>Tên</th>
										<th>Giá</th>
										<th>Số lượng</th>
										<th>Thành tiền</th>
										<th>Xóa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${cart.detail}" varStatus="status">
										<tr id="row-${item.value.gameId}">
											<td>${status.index + 1}</td>
											<td>${item.value.title}</td>
											<td>${item.value.price}</td>
											<td><input type="number" name="quantity"
												value="${item.value.quantity}" min="1"
												onchange="updateItemQuantity(${item.value.gameId}, this.value)">
											</td>
											<td id="total-${item.value.gameId}">${item.value.price * item.value.quantity}</td>
											<td><button
													onclick="removeItemFromCart(${item.value.gameId})">Remove</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<p class="" style="color: #212529;">
								Tổng tiền:
								<c:out value="${cart.totalAmount}" />
							</p>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								Thanh toán</button>
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="exampleModalLabel">Hóa
												đơn</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<table border="1" class="table table-hover">
												<thead>
													<tr>
														<th>STT</th>
														<th>Tên</th>
														<th>Giá</th>
														<th>Số lượng</th>
														<th>Thành tiền</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${cart.detail}"
														varStatus="status">
														<tr id="row-${item.value.gameId}">
															<td>${status.index + 1}</td>
															<td>${item.value.title}</td>
															<td>${item.value.price}</td>
															<td>${item.value.quantity}</td>
															<td id="total-${item.value.gameId}">${item.value.price * item.value.quantity}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<p class="" style="color: #212529;">
												Tổng tiền:
												<c:out value="${cart.totalAmount}" />
											</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Hủy</button>
											<form action="/checkout/${currentUser.getUserId()}"
												method="get">
												<input type="hidden" value="${currentUser.getUserId()}">
												<button type="submit" class="btn btn-primary">Thanh
													toán bằng VNPay</button>

											</form>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<a href="/index/home" class="btn btn-warning btn-md mb-3 mt-3">
							<i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Quay lại
							trang chủ
						</a>
					</div>
				</div>
			</div>
		</main>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
        function updateItemQuantity(gameId, quantity) {
            $.ajax({
                url: '/cart/updateQuantity',
                type: 'POST',
                data: { gameId: gameId, quantity: quantity },
                success: function(response) {
                    // Cập nhật tổng và tổng số tiền
                    $('#total-' + gameId).text(response.detail[gameId].price * response.detail[gameId].quantity);
                    $('#totalAmount').text(response.totalAmount);
                    
                },
                error: function() {
                	window.location.reload();
                }
            });
        }

        function removeItemFromCart(gameId) {
            $.ajax({
                url: '/cart/removeItem',
                type: 'POST',
                data: { gameId: gameId },
                success: function(response) {
                    // Xóa hàng khỏi bảng
                    $('#row-' + gameId).remove();
                    // Cập nhật tổng số tiền
                    $('#totalAmount').text(response.totalAmount);
                },
                error: function() {
                	window.location.reload();
                }
            });
        }
    </script>
</body>
</html>