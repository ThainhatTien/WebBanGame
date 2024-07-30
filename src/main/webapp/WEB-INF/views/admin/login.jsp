<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Visual Admin - Login</title>
<meta name="description" content="">
<meta name="author" content="templatemo">
<!-- 
        Visual Admin Template
        https://templatemo.com/tm-455-visual-admin
        -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="/admin/css/font-awesome.min.css" rel="stylesheet">
<link href="/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="/admin/css/template.css" rel="stylesheet">
</head>
<body class="light-gray-bg">
	<div class="templatemo-content-widget templatemo-login-widget white-bg">
		<header class="text-center">
			<div class="square"></div>
			<h1>Visual Admin</h1>
		</header>
		<form:form action="/form/admin/login" method="post" modelAttribute="user"
			class="templatemo-login-form">
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user fa-fw"></i>
					</div>
					<form:input  path="username" type="text" name="username" class="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-key fa-fw"></i>
					</div>
					<form:input type="password" path="password" name="password" class="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<div class="checkbox squaredTwo">
					<input type="checkbox" id="c1" name="cc" /> <label for="c1"><span></span>Remember
						me</label>
				</div>
			</div>
			<div class="form-group text-danger">${message}</div>
			<div class="form-group">
				<button type="submit" class="templatemo-blue-button width-100">Login</button>
			</div>
		</form:form>
	</div>
	<div
		class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
		<p>
			Not a registered user yet? <strong><a href="/signup/admin"
				class="blue-text">Sign up now!</a></strong>
		</p>
	</div>
</body>

</html>