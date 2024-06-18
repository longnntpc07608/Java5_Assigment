<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<title>${ TitlePage }</title>

<link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
        
<div class="container" style="margin-top: 25px;">
	<h2 class="breadcrumb text-center">
		<small> 
			<mark><b>Shopping Cart</b></mark><a href="/cart/checkout">Checkout Details</a>
		</small>
	</h2>
	<div class="row">
		<div class="col-sm-8">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead class="row">
						<tr>
							<th class="col-sm-5 text-center">Sản Phẩm</th>
							<th class="col-sm-2 text-center">Giá</th>
							<th class="col-sm-2 text-center">Số Lượng</th>
							<th class="col-sm-2 text-center">Tạm Tính</th>
							<th class="col-sm-1 text-center">Acction</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${ cart.getItems() }">
							<input type="hidden" name="id" value="${item.productId}">
							<tr>							
								<td><b>${ item.productName }</b> <br>
								<br> <img alt=""  width="50%"></td>
								<td>${ item.price } VNĐ</td>
								<td>
									<form action="/cart/update/${item.productId}" method="post">
										<input type="number" class="input-sm text-center"
											onchange="this.form.submit()" name="quantity" min="1"
											max="99"
											value="${ item.quantity <= 0 || item.quantity >= 100 ?  item.setQuantity(1) : item.quantity }"
											style="width: 100%;">
									</form>
								</td>
								<td>${ item.price * item.quantity } VNĐ</td>
								<td><a href="/cart/remove/${item.productId}"><button
											class="btn btn-danger">Xóa</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${ cart.getItems().isEmpty() }">
					<h1 style="padding: 100px;">
						<small> Giỏ Hàng Trống</small>
					</h1>
				</c:if>
				<a href="/">
					<button class="btn btn-success">
						<b>Thêm Sản Phẩm Khác</b>
					</button>
				</a> 
				<a href="/cart/clear"><button class="btn btn-danger" >
						<b>Làm mới giỏ hàng</b>
					</button></a>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Tạm Tính</td>
							<td align="right"><b>${ cart.amount } VNĐ</b></td>
						</tr>
						<tr>
							<td>Tổng Sản Phẩm</td>
							<td align="right"><b>${ cart.count }</b></td>
						</tr>

					</tbody>
					<tfoot>
						<tr>
							<td><h4>Tổng Tiền</h4></td>
							<td align="right">
								<h4>${ cart.amount } VNĐ</h4>
							</td>
						</tr>
					</tfoot>
				</table>
				
				<a href="/cart/checkout" >
					<button class="btn btn-primary" style="width: 100%;">
						<b>Tiến Hành Đặt Hàng</b>
					</button>
				</a>
			</div>
		</div>

	</div>
</div>

<script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
