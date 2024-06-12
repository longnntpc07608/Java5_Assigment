<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<title></title>

<link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
<div class="container">
	<div class="row content">
		<%-- <div class="col-sm-2">
			<h1>
				<small>Loại Sản Phẩm</small>
			</h1>
			<ul class="nav nav-pills nav-stacked" data-spy="affixx"
				data-offset-top="333">
				<c:forEach var="cate" items="${ categories }">
					<li><a href="/shop/${ cate.id }">${ cate.name }</a></li>
				</c:forEach>
			</ul>
		</div> --%>
		
		
		<br>
		<div class="row">
			<h4 class="text-primary">${ category }</h4>
			<c:if test="${ products.isEmpty() }">
				<h1 style="padding: 169px;">
					<small>Không có sản phẩm</small>
				</h1>
			</c:if>
			<c:forEach var="p" items="${ products }">
				<div class="col-sm-3">
					<div class="card text-center m-2">
						<div class="card-header" style="background-color: white; height: 55px;">${ p.name }</div>
						<div class="card-body">
							<a href="#">
							 <img src="/image/${ p.image }" class="img-responsive" style="width: 100%; height: 190px;" alt=""/>
							</a>
						</div>
						<div class="card-footer">
							<h4 class="">
								<b> ${ p.price.toString().replace(".0", " VNĐ") }</b>
							</h4>
							<a href="/cart/add/${p.id}">
							<button class="btn btn-outline-danger">Thêm Vào Giỏ Hàng</button>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
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




