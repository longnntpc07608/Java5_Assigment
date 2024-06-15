<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />

<div class="container">
	<h1 style="padding-top: 1cm;">
		<small>Lịch Sử Order</small>
	</h1>
		<br>
	<hr>
	<br>
	<br>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>Tên Người Đặt</th>
					<th>Địa chỉ</th>
					<th>Ngày Đặt</th>
					<th>Trạng Thái</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="o" items="${page.getContent()}">
					<tr>
						<td>${ o.account.fullname }</td>
						<td>${ o.address }</td>
						<td>${ o.createDate }</td>
						<td><c:if test="${ o.status == 0}">
								<b style="color: orange;">Đang Xử Lý</b>
							</c:if> <c:if test="${ o.status == 1}">
								<b style="color: aqua;">Đang Lấy Hàng</b>
							</c:if> <c:if test="${ o.status == 2}">
								<b style="color: blue;">Đang Giao Hàng</b>
							</c:if> <c:if test="${ o.status == 3}">
								<b style="color: green;">Đã Giao Hàng</b>
							</c:if></td>
						<td><a href="/myAcc/historyOrderDetails/${ o.id }"><button class="btn btn-info">Order Details</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<br>
		<c:if test="${ page.getContent().isEmpty() }">
			<h1 style="padding: 100px;">
				<small>Không có Order</small>
			</h1>
		</c:if>
		<ul class="pager">
			<li><a href="/myAcc/historyOrder?p=0"><span
					class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a
				href="/myAcc/historyOrder?p=${page.number == 0 ?  0 : page.number-1}"><span
					class="glyphicon glyphicon-backward"></span></a></li>
			<li><span class="badge"><b class="text-info">${page.number+1}</b>
			</span></li>
			<li><a
				href="/myAcc/historyOrder?p=${page.number == page.totalPages-1 ? page.totalPages-1 : page.number+1}"><span
					class="glyphicon glyphicon-forward"></span></a></li>
			<li><a href="/myAcc/historyOrder?p=${page.totalPages-1}"><span
					class="glyphicon glyphicon-fast-forward"></span></a></li>
		</ul>
		<br>
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