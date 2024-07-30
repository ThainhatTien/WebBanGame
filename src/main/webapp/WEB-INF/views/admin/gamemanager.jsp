<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Visual Admin Dashboard - Manage Users</title>
<meta name="description" content="">
<meta name="author" content="templatemo">
<!-- BootTrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- 
    Visual Admin Template
    https://templatemo.com/tm-455-visual-admin
    -->
<link href="/admin/css/template.css" rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="/admin/css/font-awesome.min.css" rel="stylesheet">
<link href="/admin/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>
	<c:if test="${not empty currentUser}">
		<div class="templatemo-flex-row">
			<div class="templatemo-sidebar">
				<header class="templatemo-site-header ">
					<h2 class="text-dark">${currentUser.username}</h2>
				</header>
				<div class="mobile-menu-icon">
					<i class="fa fa-bars"></i>
				</div>
				<nav class="templatemo-left-nav">
					<ul>
						<li><a href="/index/user/admin" class="active"><i
								class="fa fa-users fa-fw"></i>Manage Users</a></li>
						<li><a href="/index/game/admin"><i
								class="fa fa-sliders fa-fw"></i>Manage Games</a></li>
						<li><a href="/index/genre/admin"><i
								class="fa fa-sliders fa-fw"></i>Manage Genres</a></li>
						<li><a href="/index/revenue/admin"><i
								class="fa fa-bar-chart fa-fw"></i>Revenue Report</a></li>
						<li><a href="/form/admin/logout"><i
								class="fa fa-eject fa-fw"></i>Sign Out</a></li>
					</ul>
				</nav>
			</div>
			<!-- Main content -->
			<div class="templatemo-content col-1 light-gray-bg">
				<div class="templatemo-top-nav-container">
					<div class="row">
						<nav class="templatemo-top-nav col-lg-12 col-md-12">
							<ul class="text-uppercase">
								<li><a href="" class="active">Admin panel</a></li>
								<li><a href="">Dashboard</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="templatemo-content-container">
					<div class="templatemo-content-widget no-padding">
						<div class="panel panel-default table-responsive">
							<table
								class="table table-striped table-bordered templatemo-user-table"
								style="width: 100%">
								<thead>
									<tr>
										<td class=""><a href=""
											class="text-dark templatemo-sort-by"># <span
												class="caret"></span>
										</a></td>
										<td class=""><a href=""
											class="text-dark templatemo-sort-by">Title<span
												class="caret"></span>
										</a></td>
										<td><a href="" class="text-dark templatemo-sort-by">Description
												<span class="caret"></span>
										</a></td>
										<td><a href="" class="text-dark templatemo-sort-by">ReleaseDate
												<span class="caret"></span>
										</a></td>
										<td><a href="" class="text-dark templatemo-sort-by">Duration
												<span class="caret"></span>
										</a></td>
										<td><a href="" class="text-dark templatemo-sort-by">Director
												<span class="caret"></span>
										</a></td>
										<td><a href="" class="text-dark templatemo-sort-by">Rating
												<span class="caret"></span>
										</a></td>
										<td><a href="" class="text-dark templatemo-sort-by">PosterUrl
												<span class="caret"></span>
										</a></td>
										<td><a href="" class="text-dark templatemo-sort-by">TrailerUrl
												<span class="caret"></span>
										</a></td>
										<td><a href="" class="text-dark templatemo-sort-by">Price
												<span class="caret"></span>
										</a></td>
										<td><a href="" class="text-dark templatemo-sort-by">Genres
												<span class="caret"></span>
										</a></td>
										<td>Edit</td>
										<td>Delete</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${games}" var="game">
										<tr>
											<td>${game.gameId}</td>
											<td>${game.title}</td>
											<td>${game.description}</td>
											<td>${game.releaseDate}</td>
											<td>${game.duration}</td>
											<td>${game.developer}</td>
											<td>${game.rating}</td>
											<td>${game.posterUrl}</td>
											<td>${game.trailerUrl}</td>
											<td>${game.price}</td>
											<td><c:forEach var="genre" items="${game.genres}">
        											${genre.name}
    										</c:forEach></td>
											<td><a href="/admin/game/${game.gameId}"
												class="templatemo-edit-btn">Edit</a></td>
											<td><a href="/admin/game/delete/${game.gameId}"
												class="templatemo-link">Delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="templatemo-flex-row flex-content-row">
						<div class="col-1">
							<div class="panel panel-default margin-10">
								<div class="panel-heading">
									<h2 class="text-uppercase">Game Form</h2>
								</div>
								<div class="panel-body">
									<form:form action="/admin/game/update" method="post"
										class="templatemo-login-form" modelAttribute="game">
										<form:input type="hidden" path="gameId" name="gameid"
											value="${game.gameId}" />
										<!-- Thêm trường ẩn để lưu ID của người dùng -->
										<div class="form-group">
											<label for="inputTitle">Title</label>
											<form:input type="text" name="title" value="${game.title}"
												class="form-control" path="title" id="inputTitle"
												placeholder="Enter Title" />
										</div>
										<div class="form-group">
											<label for="inputDescription">Description</label>
											<form:input type="text" name="description"
												value="${game.description}" class="form-control"
												path="description" id="inputDescription"
												placeholder="Enter description" />
										</div>
										<div class="form-group">
											<label for="inputReleaseDate">ReleaseDate</label>
											<form:input type="date" name="releaseDate"
												value="${game.releaseDate}" class="form-control"
												path="releaseDate" id="inputReleaseDate"
												placeholder="Enter releaseDate" />
										</div>
										<div class="form-group">
											<label for="inputDuration">Duration</label>
											<form:input type="number" path="duration" name="duration"
												value="${game.duration}" class="form-control"
												id="inputDuration" placeholder="Enter duration" />
										</div>
										<div class="form-group">
											<label for="inputDirector">Developer</label>
											<form:input type="text" path="developer" name="developer"
												value="${game.developer}" class="form-control"
												id="inputDeveloper" placeholder="Enter developer" />
										</div>
										<div class="form-group">
											<label for="inputRating">Rating</label>
											<form:input type="number" path="rating" name="rating"
												value="${game.rating}" class="form-control" id="inputRating"
												placeholder="Enter rating" />
										</div>
										<div class="form-group">
											<label for="inputPosterUrl">PosterUrl</label>
											<form:input type="file" path="posterUrl" name="posterUrl"
												value="${game.posterUrl}" class="form-control"
												id="inputPosterUrl" placeholder="Enter posterUrl" />
										</div>
										<div class="form-group">
											<label for="inputTrailerUrl">TrailerUrl</label>
											<form:input type="text" path="trailerUrl" name="trailerUrl"
												value="${game.trailerUrl}" class="form-control"
												id="inputTrailerUrl" placeholder="Enter trailerUrl" />
										</div>
										<div class="form-group">
											<label for="inputPrice">Price</label>
											<form:input type="number" path="price" name="price"
												value="${game.price}" class="form-control" id="inputPrice"
												placeholder="Enter price" />
										</div>
										<div class="form-group">
											<label for="inputGenres">Genres</label>
											<div class="border border-1 rounded-3 ">
												<form:checkboxes class="ms-4 mb-3 mt-3" items="${genres}"
													path="genres" itemValue="genreId" itemLabel="name" />
											</div>
										</div>
										<div class="form-group">
											<button type="submit" class="templatemo-blue-button">Update</button>
										</div>
										<div class="form-group">
											<button formaction="/admin/game/reset" type="submit"
												class="templatemo-blue-button">Rest</button>
										</div>
									</form:form>

								</div>
							</div>
						</div>
					</div>
					<!-- Second row ends -->
					<footer class="text-right">
						<p>Copyright &copy; 2024 Company Name | Nhóm 1</p>
					</footer>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${empty currentUser}">
		<!-- Hiển thị thông báo khi chưa đăng nhập -->
		<div class="alert alert-warning" role="alert">Bạn chưa đăng
			nhập! Vui lòng đăng nhập để truy cập trang quản trị.</div>
	</c:if>
	<!-- JS -->
	<script type="text/javascript" src="/admin/js/jquery-1.11.2.min.js"></script>
	<!-- jQuery -->
	<script type="text/javascript" src="/admin/js/templatemo-script.js"></script>
	<script type="text/javascript"
		src="/admin/js/bootstrap-filestyle.min.js"></script>
	<!-- Templatemo Script -->
	<script>
		$(document).ready(
				function() {
					// Content widget with background image
					var imageUrl = $('img.content-bg-img').attr('src');
					$('.templatemo-content-img-bg').css('background-image',
							'url(' + imageUrl + ')');
					$('img.content-bg-img').hide();
				});
	</script>
</body>

</html>