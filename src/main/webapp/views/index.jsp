<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<title>${ TitlePage }</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
	

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->


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

.homepage {
	font-weight: 700;
	color: black;
	font: sans-serif;
	font-size: 24px;
}

.panel-heading {
	font-size: 20px;
	font-family: monospace;
}
</style>
</head>
<body>
	<div class="container">
		<div id="carouselExample" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/image/tainghe02.jpg" style="width: 100%; height: 550px;"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/image/tainghe02.jpg" style="width: 100%; height: 550px;"
						d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/image/tainghe02.jpg" style="width: 100%; height: 550px;"
						d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<div class="container">


		<nav class="navbar navbar-expand-lg bg-body-tertiary"
			data-bs-spy="affix" data-bs-offset-top="197">
			<div class="container-fluid">
				<a class="navbar-brand" href="/">HEADPHONE</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/">Trang Chủ</a></li>
						<!-- <li class="nav-item"><a class="nav-link" href="/shop/1">Có dây</a></li>
        <li class="nav-item"><a class="nav-link" href="/shop/3">Chụp tai</a></li>
        <li class="nav-item"><a class="nav-link" href="/shop/2">Không dây</a></li> -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Loại Sản
								Phẩm </a>
							<ul class="dropdown-menu">
								<c:forEach var="cate" items="${ categories }">
									<li><a class="dropdown-item" href="/shop/${ cate.id }">${ cate.name }</a></li>
								</c:forEach>
							</ul></li>
					</ul>
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<c:if test="${ User == null }">
							<li class="nav-item"><a class="nav-link" href="/login"><span
									class="glyphicon glyphicon-log-in"></span> Đăng Nhập</a></li>
						</c:if>
						<c:if test="${ User != null }">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> <span
									class="glyphicon glyphicon-user"></span> Tài Khoản
							</a>
								<ul class="dropdown-menu">
									<c:if test="${ User.isRole() == true }">
										<li><a class="dropdown-item" href="/admin">Quản Lý
												Bán Hàng</a></li>
									</c:if>
									<li><a class="dropdown-item"
										href="/myAcc/historyOrder/${ User.getUsername() }">Lịch Sử
											Order</a></li>
									<li><a class="dropdown-item"
										href="/myAcc/myProfile/${ User.getUsername() }">Quản Lý
											Tài Khoản</a></li>
									<li><a class="dropdown-item" href="/login">Đăng Xuất</a></li>
								</ul></li>
						</c:if>
						<li class="nav-item"><a class="nav-link" href="/cart/view"><i
								class="fa-solid fa-bag-shopping"></i> Giỏ Hàng <span
								class="badge bg-secondary">${ Count }</span></a></li>
					</ul>
					<form class="d-flex" role="search">
						<!-- Search form can be added here if needed -->
					</form>
				</div>
			</div>
		</nav>


	</div>
	<jsp:include page="${ view }"></jsp:include>

	<br>
	<br>