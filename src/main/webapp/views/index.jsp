<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ TitlePage }</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.affix+.container-fluid {
	padding-top: 70px;
}

.navbar {
	border-radius: 0;
	
}
.homepage{
	font-weight: 700;
    color: black;
    font: sans-serif;
    font-size: 24px;
}
.panel-heading{
	font-size: 20px;
	font-family: monospace;
	
}



</style>
</head>
<body>
	<div class="container">
		<div class="col-sm-8">
			<img alt="" src="https://caodang.fpt.edu.vn/vinmart/images/2017-FPTPolytechic-01.jpg" width="1100px" height="200px">
		</div>
	</div>
<div class="container">
	<nav class="navbar-inverse" data-spy="affix" data-offset-top="197">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">FShop</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/">Trang Chủ</a></li>
					<li><a href="/shop/1">Áo</a></li>
					<li><a href="/shop/3">Quần</a></li>
					<li><a href="/shop/2">Giày</a></li>
					
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="">Loại
							Sản Phẩm<span class="caret"></span>
					</a>
						<ul class="nav dropdown-menu">
							<c:forEach var="cate" items="${ categories }">
								<li><a href="/shop/${ cate.id }">${ cate.name }</a></li>
							</c:forEach>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${ User == null }">
						<li><a href="/login"> <span
								class="glyphicon glyphicon-log-in"></span> Đăng Nhập
						</a></li>
					</c:if>
					<c:if test="${ User != null }">
						<li><a class="dropdown-toggle" data-toggle="dropdown"
							href="/#"><span class="glyphicon glyphicon-user"></span>Tài
								Khoản</a>
							<ul class="nav dropdown-menu">
								<c:if test="${ User.isRole() == true }">
									<li><a href="/admin">Quản Lý Bán Hàng</a></li>
								</c:if>
								<li><a href="/myAcc/historyOrder/${ User.getUsername() }">Lịch
										Sử Order</a></li>
								<li><a href="/myAcc/myProfile/${ User.getUsername() }">Quản
										Lý Tài Khoản</a></li>
								<li><a href="/login">Đăng Xuất</a></li>
							</ul></li>
					</c:if>

					<li><a href="/cart/view"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Giỏ Hàng <span
							class="badge">${ Count }</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	</div>
	<jsp:include page="${ view }"></jsp:include>

	<br>
	<br>



</body>
</html>