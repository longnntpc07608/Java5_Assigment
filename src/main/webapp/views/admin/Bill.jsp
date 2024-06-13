<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<h1>
	<small>Invoice</small>
</h1>
<hr>
<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>ID</th>
				<th>Customer Name</th>
				<th>Address</th>
				<th>Creation Date</th>
				<th>Status</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="o" items="${page.getContent()}">
				<tr>
					<td>${o.id}</td>
					<td>${o.account.fullname}</td>
					<td>${o.address}</td>
					<td>${o.createDate}</td>
					<td>
						<form action="/admin/bill/${o.id}" method="post">
							<select class="form-control" onchange="this.form.submit()"
								name="stt"
								${o.status == 3 ? 'style="color: green;" disabled' : ''}>
								<option value="0" ${o.status == 0 ? 'selected' : ''}>Processing</option>
								<option value="1" ${o.status == 1 ? 'selected' : ''}>Picking
									Up</option>
								<option value="2" ${o.status == 2 ? 'selected' : ''}>Delivering</option>
								<option value="3" ${o.status == 3 ? 'selected' : ''}
									${o.status < 2 ? 'disabled' : ''}>Delivered</option>
							</select>
						</form>
					</td>
					<td><a href="/admin/bill/OrderDetails/${o.id}"><button
								class="btn btn-info">Order Details</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link"
				href="/admin/bill?p=0" aria-label="First"> <i
					class="bi bi-skip-backward-fill"></i>
			</a></li>
			<li class="page-item"><a class="page-link"
				href="/admin/bill?p=${page.number == 0 ? 0 : page.number-1}"
				aria-label="Previous"> <i class="bi bi-caret-left-fill"></i>
			</a></li>
			<li class="page-item"><span class="page-link bg-light text-dark">${page.number+1}
					/ ${page.totalPages}</span></li>
			<li class="page-item"><a class="page-link"
				href="/admin/bill?p=${page.number == page.totalPages-1 ? page.totalPages-1 : page.number+1}"
				aria-label="Next"> <i class="bi bi-caret-right-fill"></i>
			</a></li>
			<li class="page-item"><a class="page-link"
				href="/admin/bill?p=${page.totalPages-1}" aria-label="Last"> <i
					class="bi bi-skip-forward-fill"></i>
			</a></li>
		</ul>
	</nav>
</div>
