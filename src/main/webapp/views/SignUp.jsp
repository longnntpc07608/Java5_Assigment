<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

</head>
<body>
	<div class="container mt-5">
		<div class="card">
			<div class="card-header  text-center">
				<h4 class="text-primary text-center">Đăng ký</h4>
			</div>

			<div class="card-body">
				<c:if test="${not empty message}">
					<p class="text-danger text-center">${ errorMessageSignUp }</p>
				</c:if>

				<form action="/SignUp" method="post" modelAttribute="user">
					<div class="form-group">
						<label>Tên đăng nhập</label> <input class="form-control"
							name="username" required /> <label>Họ tên</label> <input
							path="fullname" class="form-control" name="fullname" required />
						<label>Email</label> <input path="email" class="form-control"
							name="email" required /> <label>Mật khẩu</label> <input
							path="password" class="form-control" name="password"
							type="password" required /> <label>Nhập lại mật khẩu</label> <input
							type="password" class="form-control" name="cfpwd" required /> <span>Bạn
							đã có tài khoản?</span> <a href="/login">Đăng nhập</a>
						<button type="submit" class="btn btn-primary"
							style="margin-left: 80%;">Đăng ký</button>
					</div>
				</form>
			</div>

		</div>

	</div>