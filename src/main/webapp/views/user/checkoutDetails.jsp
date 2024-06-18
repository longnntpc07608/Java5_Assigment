<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />


<div class="container" style="margin-top: 25px;">
	<h2 class="breadcrumb text-center" >
		<small><a href="/cart/view">Shopping Cart</a> <mark>
				<b>Checkout Details</b>
			</mark>
		</small>
	</h2>
	<div class="row">
		<div class="col-xs-8">
			<div class="card card-success">
				<div class="card-heading">
					<h3 style="margin-top: 15px; margin-left: 20px;">Thông Tin Thanh Toán</h3>
				</div>
				<div class="card-body">
					<form:form role="form" action="/cart/checkout" method="POST" modelAttribute="order">
						<input name="account" value="${ User.username }" hidden>
						<div class="form-group m-2">
							<label for="name">Họ và Tên *</label>
							<form:input type="text" class="form-control form-control-large"
								id="name" name="fullname" readonly="true" path="account"
								value="${ User.fullname }" />
						</div>
						<div class="row">
							<div class="col-xs-6">
									<div class="form-group m-2">
										<label for="email">Địa chỉ Email *</label>
										<form:input path="account"
											class="form-control form-control-large" id="email"
											readonly="true" value="${ User.email }" />
									</div>
								</div>
							<div class="col-xs-6">
								<div class="form-group m-2">
									<label for="phone">Số Điện Thoại *</label>
									<form:input type="text" class="form-control form-control-small"
										id="phone" path="phone" placeholder="Số điện thoại của bạn" />
								</div>
							</div>
						</div>
						<div class="form-group m-2">
							<label for="state" class="control-label">Địa chỉ giao hàng *</label>
							<form:input type="text" class="form-control" id="state"
								path="address"
								placeholder="Ví dụ: số 69, ngõ 8 Lê Quang Đạo, Nam Từ Liêm, Hà Nội" />
						</div>
						<br>
						<h3 style="margin-left: 20px;">Thông tin bổ sung</h3>
						<div class="form-group m-3">
							<label for="note" class="control-label">Ghi chú đơn hàng(Không bắt buộc)</label>
							<form:textarea class="form-control" rows="5" id="note" path="note" placeholder=""></form:textarea>
						</div>
						<div class="well">
							<button style="margin-left: 1050px;" type="submit" class="btn btn-success"
								${ cartItems.isEmpty() ? "disabled" : "" }>Đặt Hàng</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-xs-4" style="margin-top: 10px;" >
			<div class="card card-info">
				<div class="card-heading">
					<h3 style="margin-left: 30px; margin-top: 10px;">Đơn Hàng Của Bạn</h3>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead class="row">
								<tr>
									<th class="col-sm-8">Sản Phẩm</th>
									<th class="col-sm-4 text-right">Thành Tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${ cartItems }">
									<tr>
										<td>${ item.productName }<b> x ${ item.quantity }</b></td>
										<td align="right"><b>${ item.price * item.quantity }
												VNĐ</b></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr class="">
									<td>Tổng Sản Phẩm:</td>
									<td align="right"><b>${ Count }</b></td>
								</tr>
								<tr>
									<td><h4>Tổng Tiền</h4></td>
									<td align="right"><h4>${ Amount }VNĐ</h4></td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
