<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container mt-5" style="width: 100%">
	<div class="card">
		<div class="card-header">

			<h3 class="text-primary text-center">Quên mật khẩu</h3>
		</div>
		<div class="card-body">
			<form action="/forgot-password" method="post">
				<div class="form-group">
					<label for="usernameF">Tên đăng nhập</label> 
					<input class="form-control" type="text" id="usernameF" name="usernameF"><br>
					<label for="emailF">Email</label> 
					<input class="form-control" type="email" id="emailF" name="emailF"><br>
					<button class="btn btn-primary" style="margin-left: 90%" type="submit">Gửi</button>
				</div>
			</form>
		</div>
	</div>
	<c:if test="${not empty sessionScope.errorMessageForgotPassword}">
		<p style="color: red;">${sessionScope.errorMessageForgotPassword}</p>
	</c:if>
	<c:if test="${not empty sessionScope.successMessageForgotPassword}">
		<p style="color: green;">${sessionScope.successMessageForgotPassword}</p>
	</c:if>

</div>