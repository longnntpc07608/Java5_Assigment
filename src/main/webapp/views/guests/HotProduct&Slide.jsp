<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
<meta charset="UTF-8">
<title></title>

<div class="container" align="center">
	<h2 class="homepage" style="color: red;">Sản phẩm hot</h2>
	<br>
	<div class="row">
		<c:forEach var="hp" items="${ hotProducts }" end="3">
			<div class="col-sm-3">
				<div class="card text-center">
					<div class="card-header" style="height: 55px;">${ hp.name }</div>
					<div class="card-body">
						<a href="#"> <img
							src="/image/${hp.image }"
							class="img-responsive" style="width: 100%; height: 190px;" alt="Image">
						</a>
					</div>
					<div class="card-footer">
						<h4 class="text-dark">
							<b> ${ hp.price.toString().replace(".0", " VNĐ") }</b>
						</h4>
						<a href="/cart/add/${hp.id}">
							<button class="btn btn-outline-danger">Thêm Vào Giỏ Hàng</button>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>


	<br>
	<a href="/shop">
		<button type="button" class="btn btn-outline-primary"
			style="align-content: center;">Xem Thêm</button>
	</a>
	<br>
	<br>
</div>
<br>

<div class="container" align="center">
	<h3>Sản Phẩm Mới</h3>
	<br>
	<div class="row">
		<c:forEach var="np" items="${ newProducts }" end="3">
			<div class="col-sm-3">
				<div class="card text-center">
					<div class="card-header" style="height: 55px;">${ np.name }</div>
					<div class="card-body">
						<a href="#"> <img
							src="/image/${np.image }"
							class="img-responsive" style="width: 100%; height: 190px;" alt="Image">
						</a>
					</div>
					<div class="card-footer">
						<h4 class="text-dark">
							<b> ${ np.price.toString().replace(".0", " VNĐ") }</b>
						</h4>
						<a href="/cart/add/${np.id}">
							<button class="btn btn-outline-danger">Thêm Vào Giỏ Hàng</button>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<br>
	<a href="/shop">
		<button type="button" class="btn btn-outline-primary"
			style="align-content: center;">Xem Thêm</button>
	</a>
	<br>
	<br>
</div>
<br>
<div class="container" align="center">
	<h3>Đang Giảm Giá</h3>
	<br>
	<div class="row">
		<c:forEach var="sp" items="${ saleProducts }" end="7">
			<div class="col-sm-3">
				<div class="card text-center">
					<div class="card-header" style="height: 55px;">${ sp.name }</div>
					<div class="card-body">
						<a href="#"> <img
							src="/image/${sp.image }"
							class="img-responsive" style="width: 100%; height: 190px;" alt="">
						</a>
					</div>
					<div class="card-footer">
						<mark>
							<del>${ sp.price / 0.5 } VNĐ</del>
						</mark>
						<h4 class="text-dark">
							<b>${ sp.price.toString().replace(".0", " VNĐ") }</b>
						</h4>
						<a href="/cart/add/${sp.id}">
							<button class="btn btn-outline-danger">Thêm Vào Giỏ Hàng</button>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<br>
	<a href="/shop">
		<button type="button" class="btn btn-outline-primary"
			style="align-content: center;">Xem Thêm</button>
	</a>
	<br>
</div>



<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script> 
</body>
</html>
