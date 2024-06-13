<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OrderDetails</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">
            <small>Order Details</small>
        </h1>
        <hr>
        <div class="container">
            <h3><a href="/admin/bill"><i class="bi bi-arrow-left"></i></a></h3>
            <br>
            <div class="table-responsive">
                <table class="table text-center">
                    <thead class="row">
                        <tr>
                            <th class="col-sm-4">Sản Phẩm</th>
                            <th class="col-sm-2">Hình Ảnh</th>
                            <th class="col-sm-2">Giá</th>
                            <th class="col-sm-1">Số Lượng</th>
                            <th class="col-sm-2">Tạm Tính</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${listOD}">
                            <tr>
                                <td><b>${item.product.name}</b> <br> <br></td>
                                <td><img alt="" src="/image/1.jpeg" class="img-fluid"></td>
                                <td>${item.price}VNĐ</td>
                                <td><b>${item.quantity}</b></td>
                                <td>${item.price * item.quantity}VNĐ</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br>
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="alert alert-primary text-center" role="alert">
                            <i class="bi bi-heart"></i> 
                            <b>Tình Trạng:</b>
                            <c:choose>
                                <c:when test="${Status == 0}">Đang Xử Lý</c:when>
                                <c:when test="${Status == 1}">Đang Lấy Hàng</c:when>
                                <c:when test="${Status == 2}">Đang Giao Hàng</c:when>
                                <c:when test="${Status == 3}">Đã Giao Hàng</c:when>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="alert alert-secondary text-center" role="alert">
                            <i class="bi bi-currency-dollar"></i> 
                            <b>Tổng Tiền:</b> ${TongTien} VNĐ
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
