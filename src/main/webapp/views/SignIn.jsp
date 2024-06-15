<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />

<div>
	<h1 class="logo-badge text-whitesmoke">
		<span class="fa fa-user-circle"></span>
	</h1>
</div>


<div class="container-content">


	<%-- <div class="container" style="width: 50%;">
		<div class="card">
			<div class="card-header">

				<h4 class="text-center">Sign In</h4>
			</div>
			<div class="card-body">
				<p class="text-danger">${ errorMessage }</p>
				<form class="m-3" action="/login" method="post">
					<div class="form-group">
						<input type="text" class="form-control m-3" placeholder="Username"
							name="username">
					</div>
					<div class="form-group">
						<input type="password" class="form-control m-3"
							placeholder="Password" name="password">
					</div>
					
					
					<button type="submit" class="btn btn-primary" style="width: 20%; margin-left: 320px;">Sign In</button>
					
				</form>


			</div>
			<div class="card-footer text-center">
				<a class="text" data-toggle="modal" data-target="#modalForgot"
					style="cursor: pointer;"><small style="text-decoration: none">
					Forgot your password?</small></a>
				<p class="text text-center"></p>
				<a class="" href="/SignUp"><small>Sign Up</small></a>
			</div>
		</div>
	</div>

</div> --%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <div class="container mt-5" style="width: 100% ">
        <div class="card" >
            <div class="card-header  text-center">
        <h3 class="text-primary text-center">Đăng nhập</h3>
            </div>
            <div class="card-body">
                <c:if test="${not empty errorMessage}">
                    <div class="alert text-danger" role="alert">${ errorMessage }</div>
                </c:if>
                <form action="/login" method="post">
                    <div class="form-group">
                        <label for="tendangnhap">Tên đăng nhập</label>
                        <input class="form-control" type="text" name="username" required>
                        <br>
                        <label for="matkhau">Mật khẩu</label>
                        <input class="form-control" type="password" name="password" required>
                        <br>
                        <span>Bạn chưa có tài khoản?</span> <a href="/SignUp">Đăng ký</a> <br>
                        <a href="/ForgotPassword">Quên mật khẩu?</a> <br>
                        <button class="btn btn-primary" style="margin-left: 60%;">Đăng nhập</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Forgot -->
    
        
