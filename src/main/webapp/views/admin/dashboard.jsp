<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard Page</title>
</head>
<body>
	<h1>
		<small>Dashboard Page</small>
	</h1>
	<hr>

	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>Loại mặt hàng</th>
					<th>Doanh Thu</th>
					<th>Số Lượng Đã Bán</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="r" items="${report}">
					<tr>
						<td>${r.loai.name}</td>
						<td>${r.doanhthu.toString().replace(".0", " VNĐ")}</td>
						<td>${r.soLuong}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
