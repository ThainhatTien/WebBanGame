<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<header class="header-area header-sticky">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav header__menu mobile-menu">
					<!-- ***** Logo Start ***** -->
					<a href="/index/home" class="logo"> <img
						src="/assets/images/logo.png" alt="" style="width: 158px;">
					</a>
					<!-- ***** Logo End ***** -->
					<!-- ***** Menu Start ***** -->
					<ul class="nav">
						<li><a href="/index/home">Home</a></li>
						<li><a href="/index/outshop">Our Shop</a></li>
						<%-- <li><a href="/index/genres">Genres<span class="arrow_carrot-down"></span></a>
							<ul class="dropdown">
								<c:forEach var="genre" items="${genres}">
									<li><a href="#">${genre.name}</a></li>
								</c:forEach>
							</ul>
						</li> --%>
						<%-- Kiểm tra xem người dùng đã đăng nhập chưa --%>
						<c:choose>
							<c:when test="${not empty currentUser}">
								<li><a href="/profile/${currentUser.getUserId()}">Welcome, ${currentUser.getUsername()}</a></li>
								<li><a href="/cart">Cart</a></li>
								<li><a href="/logout">Logout</a></li>
							</c:when>
							<%-- Nếu chưa đăng nhập, hiển thị các lựa chọn đăng ký và đăng nhập --%>
						<c:otherwise>
							<li><a href="/signup/user">Sign Up</a></li>
							<li><a href="/login/user">Sign In</a></li>
						</c:otherwise>
						</c:choose>
					</ul>
					<a class='menu-trigger'> <span>Menu</span>
					</a>
					<!-- ***** Menu End ***** -->
				</nav>
			</div>
		</div>
	</div>
</header>
